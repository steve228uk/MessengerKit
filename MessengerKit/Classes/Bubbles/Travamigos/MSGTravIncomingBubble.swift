//
//  MSGTravIncomingBubble.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGTravIncomingBubble: MSGTravOutgoingBubble {
    
    override var gradientColors: [CGColor] {
        return [
            UIColor.white.cgColor,
            UIColor.white.cgColor
        ]
    }
    
    override var tintColor: UIColor! {
        get {
            return .blue
        }
        set { }
    }
    
}
