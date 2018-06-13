//
//  MSGEmojiCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 11/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGEmojiCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.emoji(body) = message.body else { return }
            
            textLabel.text = body
        }
    }
    
}
