//
//  MSGTravCollectionViewFlowLayout.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override public init() {
        super.init()
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open func setup() {
        sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: -15, right: 0)
    }
    
}
