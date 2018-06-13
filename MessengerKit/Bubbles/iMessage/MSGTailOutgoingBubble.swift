//
//  MSGTailOutgoingBubble.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// A bubble for outgoing messages for use in the iMessage style.
public class MSGTailOutgoingBubble: UITextView {
    
    lazy var tailImage: UIImage = {
    
        let image = UIImage(
            named: "Outgoing Tail Bubble",
            in: MessengerKit.bundle,
            compatibleWith: nil
        )
        
        let resizableImage = image?.resizableImage(
            withCapInsets: UIEdgeInsetsMake(10, 10, 10, 20),
            resizingMode: .stretch
        )
        
        return resizableImage!
        
    }()
    
    lazy var standardImage: UIImage = {
       
        let image = UIImage(
            named: "Outgoing Bubble",
            in: MessengerKit.bundle,
            compatibleWith: nil
        )
        
        let resizableImage = image?.resizableImage(
            withCapInsets: UIEdgeInsetsMake(10, 10, 10, 20),
            resizingMode: .stretch
        )
        
        return resizableImage!
        
    }()
    
    lazy var backgroundImageView: UIImageView = {
        
        return UIImageView(
            image: tailImage
        )
        
    }()
    
    var shouldShowTail: Bool = true {
        didSet {
            backgroundImageView.image = shouldShowTail ? tailImage : standardImage
        }
    }
    
    override public var canBecomeFirstResponder: Bool {
        return false
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        setupView()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundImageView.frame = bounds
    }
    
    open func setupView() {
        
        isEditable = false
        isSelectable = true // TODO: Check that links are tappable
        dataDetectorTypes = [.flightNumber, .calendarEvent, .address, .phoneNumber, .link, .lookupSuggestion]
        isUserInteractionEnabled = true
        delaysContentTouches = true
        font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
        textContainerInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 15)
        textContainer.lineFragmentPadding = 0
        
        backgroundColor = .clear
        textColor = .white
        
        linkTextAttributes[NSAttributedStringKey.underlineStyle.rawValue] = NSUnderlineStyle.styleSingle.rawValue
        
        addBackground()
        
    }
    
    func addBackground() {
        backgroundImageView.contentMode = .scaleToFill
        insertSubview(backgroundImageView, at: 0)
        backgroundImageView.frame = bounds
    }
    
    func calculatedSize(in size: CGSize) -> CGSize {
        return sizeThatFits(CGSize(width: size.width * 0.8, height: .infinity))
    }
    
    // Disables text selection
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        guard let pos = closestPosition(to: point) else {
            return false
        }
        
        guard let range = tokenizer.rangeEnclosingPosition(pos, with: .character,
                                                           inDirection: UITextLayoutDirection.left.rawValue) else {
                                                            return false
        }
        
        let startIndex = offset(from: beginningOfDocument, to: range.start)
        
        return attributedText.attribute(.link, at: startIndex, effectiveRange: nil) != nil
    }
    
}
