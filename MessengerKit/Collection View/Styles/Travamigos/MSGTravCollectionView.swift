//
//  MSGTravCollectionView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravCollectionView: MSGCollectionView {

    override open func registerCells() {
        super.registerCells()
        
        collectionViewLayout = MSGTravCollectionViewFlowLayout()
        
        // Text
        
        register(UINib(nibName: "MSGOutgoingTravCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        
        register(UINib(nibName: "MSGIncomingTravCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingText")
        
        // Emoji
        
        register(UINib(nibName: "MSGOutgoingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingEmoji")
        
        register(UINib(nibName: "MSGIncomingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingEmoji")
        
        // Image
        
        register(UINib(nibName: "MSGOutgoingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingImage")
        
        register(UINib(nibName: "MSGIncomingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingImage")
        
        // Footers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionFooter", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionFooter", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionHeader", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionHeader", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
