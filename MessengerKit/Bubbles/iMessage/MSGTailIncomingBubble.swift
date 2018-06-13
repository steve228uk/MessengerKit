//
//  MSGTailIncomingBubble.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

public class MSGTailIncomingBubble: MSGTailOutgoingBubble {
    
    
    lazy var incomingTailImage: UIImage = {
        
        let image = UIImage(
            named: "Incoming Tail Bubble",
            in: MessengerKit.bundle,
            compatibleWith: nil
        )
        
        let resizableImage = image?.resizableImage(
            withCapInsets: UIEdgeInsetsMake(10, 20, 10, 10),
            resizingMode: .stretch
        )
        
        return resizableImage!
        
    }()
    
    lazy var incomingStandardImage: UIImage = {
        
        let image = UIImage(
            named: "Incoming Bubble",
            in: MessengerKit.bundle,
            compatibleWith: nil
        )
        
        let resizableImage = image?.resizableImage(
            withCapInsets: UIEdgeInsetsMake(10, 20, 10, 10),
            resizingMode: .stretch
        )
        
        return resizableImage!
        
    }()
    
    
    override var shouldShowTail: Bool {
        didSet {
            backgroundImageView.image = shouldShowTail ? incomingTailImage : incomingStandardImage
        }
    }
    
    
    override func addBackground() {
        super.addBackground()
      
        backgroundImageView.image = incomingTailImage
        textContainerInset = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 10)
    }
    
    
}
