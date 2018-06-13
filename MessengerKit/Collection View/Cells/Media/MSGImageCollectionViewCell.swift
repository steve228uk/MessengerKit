//
//  MSGImageCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 11/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGImageCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    override public var message: MSGMessage? {
        didSet {
            guard let message = message,
                case let MSGMessageBody.image(image) = message.body else { return }
            
            imageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true   
    }

}
