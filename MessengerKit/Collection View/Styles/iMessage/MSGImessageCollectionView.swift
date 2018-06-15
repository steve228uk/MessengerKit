//
//  MSGImessageCollectionView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGImessageCollectionView: MSGCollectionView {
    
    override open func registerCells() {
        super.registerCells()
        
        collectionViewLayout = MSGImessageCollectionViewFlowLayout()
        
        // Text
        
        register(UINib(nibName: "MSGOutgoingTailCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "MSGIncomingTailCollectionViewCell", bundle: MessengerKit.bundle),
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
        
        register(UINib(nibName: "MSGImessageOutgoingFooterView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGImessageIncomingFooterView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGImessageOutgoingHeaderView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGImessageIncomingHeaderView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
