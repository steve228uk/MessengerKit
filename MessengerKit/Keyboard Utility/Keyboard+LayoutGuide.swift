//
//  Keyboard+LayoutGuide.swift
//  KeyboardLayoutGuide
//
//  Created by Sacha DSO on 14/11/2017.
//  Copyright © 2017 freshos. All rights reserved.
//

import UIKit

private class Keyboard {
    static let shared = Keyboard()
    var currentHeight: CGFloat = 0
}

public extension UIView {
    
    private struct AssociatedKeys {
        static var keyboardLayoutGuide = "keyboardLayoutGuide"
    }
    
    /// A layout guide representing the inset for the keyboard.
    /// Use this layout guide’s top anchor to create constraints pinning to the top of the keyboard.
    public var keyboardLayoutGuide: KeyboardLayoutGuide {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociatedKeys.keyboardLayoutGuide) as? KeyboardLayoutGuide {
                return obj
            }
            let new = KeyboardLayoutGuide()
            addLayoutGuide(new)
            new.setUp()
            objc_setAssociatedObject(self, &AssociatedKeys.keyboardLayoutGuide, new as Any, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return new
        }
    }
}

open class KeyboardLayoutGuide: UILayoutGuide {
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init() {
        super.init()
        
        // Observe keyboardWillChangeFrame notifications
        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(keyboardWillChangeFrame(_:)),
                       name: UIResponder.keyboardWillChangeFrameNotification,
                       object: nil)
    }
    
    internal func setUp() {
        guard let view = owningView else {
            return
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Keyboard.shared.currentHeight),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            ])
        let viewBottomAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11.0, *) {
            viewBottomAnchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            viewBottomAnchor = view.bottomAnchor
        }
        bottomAnchor.constraint(equalTo: viewBottomAnchor).isActive = true
    }
    
    @objc
    private func keyboardWillChangeFrame(_ note: Notification) {
        if var height = note.keyboardHeight {
            if #available(iOS 11.0, *), height > 0 {
                height -= (owningView?.safeAreaInsets.bottom)!
            }
            heightConstraint?.constant = height
            animate(note)
            Keyboard.shared.currentHeight = height
        }
    }
    
    private func animate(_ note: Notification) {
        if isVisible(view: self.owningView!) {
            self.owningView?.layoutIfNeeded()
        } else {
            UIView.performWithoutAnimation {
                self.owningView?.layoutIfNeeded()
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Helpers

extension UILayoutGuide {
    internal var heightConstraint: NSLayoutConstraint? {
        guard let target = owningView else { return nil }
        for c in target.constraints {
            if let fi = c.firstItem as? UILayoutGuide, fi == self && c.firstAttribute == .height {
                return c
            }
        }
        return nil
    }
}

extension Notification {
    var keyboardHeight: CGFloat? {
        guard let v = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return nil
        }
        // Weirdly enough UIKeyboardFrameEndUserInfoKey doesn't have the same behaviour
        // in ios 10 or iOS 11 so we can't rely on v.cgRectValue.width
        let screenHeight = UIApplication.shared.keyWindow?.bounds.height ?? UIScreen.main.bounds.height
        return screenHeight - v.cgRectValue.minY
    }
}

// Credits to John Gibb for this nice helper :)
// https://stackoverflow.com/questions/1536923/determine-if-uiview-is-visible-to-the-user
func isVisible(view: UIView) -> Bool {
    func isVisible(view: UIView, inView: UIView?) -> Bool {
        guard let inView = inView else { return true }
        let viewFrame = inView.convert(view.bounds, from: view)
        if viewFrame.intersects(inView.bounds) {
            return isVisible(view: view, inView: inView.superview)
        }
        return false
    }
    return isVisible(view: view, inView: view.superview)
}

