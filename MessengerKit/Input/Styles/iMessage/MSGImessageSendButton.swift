//
//  MSGImessageSendButton.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGImessageSendButton: UIButton {

    let overlay = CALayer()
    
    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.alpha = self.isEnabled ? 1 : 0.3
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            overlay.isHidden = !isHighlighted
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        overlay.frame = layer.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
        
        overlay.backgroundColor = UIColor.black.cgColor
        overlay.opacity = 0.3
        overlay.isHidden = true
        overlay.frame = layer.bounds
        
        layer.addSublayer(overlay)
    }

}
