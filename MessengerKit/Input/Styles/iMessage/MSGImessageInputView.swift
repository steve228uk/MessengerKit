//
//  MSGImessageInputView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGImessageInputView: MSGInputView {
    
    override public class var nib: UINib? {
        return UINib(nibName: "MSGImessageInputView",
                     bundle: MessengerKit.bundle)
    }
    
    open override var tintColor: UIColor! {
        didSet {
            textView.tintColor = tintColor
            sendButton.tintColor = .white
            sendButton.backgroundColor = tintColor
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = (sendButton.bounds.height / 2) + 2
        
        textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 40)
    }
    
}
