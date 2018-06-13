//
//  MSGImessageTravCollectionViewFlowLayout.swift
//  MessengerKit
//
//  Created by Stephen Radford on 11/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGImessageCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override public init() {
        super.init()
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open func setup() {
        sectionInset = UIEdgeInsetsMake(5, 0, 5, 0)
        minimumLineSpacing = 5
    }
    
}
