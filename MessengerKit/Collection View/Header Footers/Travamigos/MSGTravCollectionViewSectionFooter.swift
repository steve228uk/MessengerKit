//
//  MSGTravCollectionViewSectionFooter.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGTravCollectionViewSectionFooter: MSGSectionReusableView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var avatarTapGestureRecogniser: UITapGestureRecognizer!
    
    override var message: MSGMessage? {
        didSet {
            
            avatarImageView.image = message?.user.avatar
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.borderColor = UIColor(red:0.97, green:0.97, blue:0.97, alpha:1.00).cgColor
        
        avatarImageView.isUserInteractionEnabled = true
        avatarTapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(avatarTapped(_:)))
        avatarImageView.addGestureRecognizer(avatarTapGestureRecogniser)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        
        let path = UIBezierPath(ovalIn: avatarImageView.bounds)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        avatarImageView.layer.mask = mask
        
    }
    
    @objc func avatarTapped(_ sender: UITapGestureRecognizer) {
        guard let user = message?.user else { return }
        delegate?.reusableViewAvatarTapped(for: user)
    }
    
}
