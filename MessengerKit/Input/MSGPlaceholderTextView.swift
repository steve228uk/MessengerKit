//
//  MSGPlaceholderTextView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// A text view that supports a placeholder.
///
/// (I really should open a radar to request a native control).
open class MSGPlaceholderTextView: UIView {
    
    /// The actual text view being used
    private let textView = UITextView()
    
    /// The label used for the placeholder
    private let label = UILabel()
    
    /// The deleate for the view
    public weak var delegate: MSGPlaceholderTextViewDelegate?
    
    @IBInspectable
    public var placeholder: String = "Type something…" {
        didSet {
            label.text = placeholder
        }
    }
    
    public var text: String! {
        get {
            return textView.text
        }
        set {
            textView.text = newValue
            textViewDidChange(textView)
        }
    }
    
    public var font: UIFont? {
        didSet {
            textView.font = font
            label.font = font
        }
    }
    
    @IBInspectable
    public var textColor: UIColor? {
        didSet {
            textView.textColor = textColor
        }
    }
    
    @IBInspectable
    public var placeholderColor: UIColor? {
        didSet {
            label.textColor = placeholderColor
        }
    }
    
    public var textContainerInset: UIEdgeInsets? {
        didSet {
            textView.textContainerInset = textContainerInset ?? .zero
        }
    }
    
    public var contentInset: UIEdgeInsets? {
        didSet {
            textView.contentInset = contentInset ?? .zero
        }
    }
    
    override open var tintColor: UIColor! {
        didSet {
            textView.tintColor = tintColor
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setup()
        styleLabel()
    }
    
    private func setup() {
        addSubviews()
        styleLabel()
        styleTextView()
    }
    
    private func addSubviews() {
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    private func styleLabel() {
        label.text = placeholder
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
    }
    
    private func styleTextView() {
        textView.backgroundColor = .clear
        textView.tintColor = tintColor
        textView.delegate = self
    }
    
    open override func resignFirstResponder() -> Bool {
        return textView.resignFirstResponder()
    }
    
    open override func becomeFirstResponder() -> Bool {
        return textView.becomeFirstResponder()
    }
    
}

extension MSGPlaceholderTextView: UITextViewDelegate {
    
    public func textViewDidChange(_ textView: UITextView) {
        delegate?.textViewDidChange(textView)
        label.isHidden = textView.text != ""
    }
    
}

public protocol MSGPlaceholderTextViewDelegate: NSObjectProtocol {
    
    func textViewDidChange(_ textView: UITextView)
    
}
