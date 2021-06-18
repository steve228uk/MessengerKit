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
        
        register(UINib(nibName: "MSGOutgoingTravCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        
        register(UINib(nibName: "MSGIncomingTravCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingText")
        
        // Emoji
        
        register(UINib(nibName: "MSGOutgoingEmojiCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingEmoji")
        
        register(UINib(nibName: "MSGIncomingEmojiCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingEmoji")
        
        // Image
        
        register(UINib(nibName: "MSGOutgoingImageCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingImage")
        
        register(UINib(nibName: "MSGIncomingImageCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingImage")
        
        // Footers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionFooter", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionFooter", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGTravOutgoingCollectionViewSectionHeader", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGTravIncomingCollectionViewSectionHeader", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
