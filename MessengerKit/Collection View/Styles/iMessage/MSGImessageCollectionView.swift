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
        
        register(UINib(nibName: "MSGOutgoingTailCollectionViewCell", bundle: MSGMessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "MSGIncomingTailCollectionViewCell", bundle: MSGMessengerKit.bundle),
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
        
        register(UINib(nibName: "MSGImessageOutgoingFooterView", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGImessageIncomingFooterView", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGImessageOutgoingHeaderView", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGImessageIncomingHeaderView", bundle: MSGMessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
