//
//  CustomOutgoingTextCell.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import MessengerKit

class CustomTextCell: MSGMessageCell {

    @IBOutlet weak var bubble: CustomBubble!
    
    @IBOutlet weak var bubbleWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var avatarView: UIImageView?
    
    override open var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.text(body) = message.body else { return }
            
            bubble.text = body
            avatarView?.image = message.user.avatar
        }
    }
    
    override var style: MSGMessengerStyle? {
        didSet {
            guard let style = style as? CustomStyle, let message = message else { return }
            bubble.layer.borderColor = message.user.isSender ? style.outgoingBorderColor.cgColor : style.incomingBorderColor.cgColor
            bubble.linkTextAttributes[NSAttributedStringKey.underlineColor.rawValue] = style.outgoingLinkColor
            bubble.linkTextAttributes[NSAttributedStringKey.foregroundColor.rawValue] = style.outgoingLinkColor
            bubble.font = style.font
            bubble.textColor = message.user.isSender ? style.outgoingTextColor : style.incomingTextColor
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        let bubbleSize = bubble.calculatedSize(in: bounds.size)
        bubbleWidthConstraint.constant = bubbleSize.width
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarView?.layer.cornerRadius = 24
        avatarView?.layer.masksToBounds = true
    }
    
}
