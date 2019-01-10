//
//  MSGTravBubble.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// A bubble for outgoing messages for use in the Travamigos style.
class MSGTravOutgoingBubble: UITextView {
    
    var gradientLayer = CAGradientLayer()
    
    var gradientColors: [CGColor] {
        return [
            UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00).cgColor,
            UIColor(red:0.89, green:0.08, blue:0.46, alpha:1.00).cgColor
        ]
    }
    
    override public var selectedTextRange: UITextRange? {
        get {
            return nil
        }
        set { }
    }
    
    override var canBecomeFirstResponder: Bool {
        return false
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.frame = layer.bounds
        CATransaction.commit()
    }
    
    
    fileprivate func setupView() {
        
        layer.cornerRadius = 18
        layer.masksToBounds = true
        
        isEditable = false
        isSelectable = true // TODO: Check that links are tappable
        dataDetectorTypes = [.flightNumber, .calendarEvent, .address, .phoneNumber, .link, .lookupSuggestion]
        isUserInteractionEnabled = true
        delaysContentTouches = true
        font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
        textContainerInset = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
        textContainer.lineFragmentPadding = 0
        
        linkTextAttributes = [NSAttributedString.Key.underlineColor: NSUnderlineStyle.single.rawValue]
        
        addGradientLayer()
    }
    
    fileprivate func addGradientLayer() {
        gradientLayer.colors = gradientColors
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        gradientLayer.frame = layer.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func calculatedSize(in size: CGSize) -> CGSize {
        return sizeThatFits(CGSize(width: size.width - 40, height: .infinity))
    }
    
    // Disables text selection
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        guard let pos = closestPosition(to: point) else {
            return false
        }
        
        guard let range = tokenizer.rangeEnclosingPosition(pos, with: .character,
                                                           inDirection: UITextDirection(rawValue: UITextLayoutDirection.left.rawValue)) else {
                                                            return false
        }
        
        let startIndex = offset(from: beginningOfDocument, to: range.start)
        
        return attributedText.attribute(.link, at: startIndex, effectiveRange: nil) != nil
    }
    
}
