//
//  CustomCollectionView.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import MessengerKit

class CustomCollectionView: MSGImessageCollectionView {

    override func registerCells() {
        super.registerCells()
        
        register(UINib(nibName: "CustomOutgoingTextCell", bundle: nil), forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "CustomIncomingTextCell", bundle: nil), forCellWithReuseIdentifier: "incomingText")
    }

}
