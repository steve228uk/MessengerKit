//
//  MSGMessengerViewController + Helpers.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

extension MSGMessengerViewController {
    
    @objc open func insert(_ message: MSGMessage) {
        
        collectionView.performBatchUpdates({
            
            let sectionIndex = numberOfSections(in: collectionView) - 1
            self.collectionView.insertSections([sectionIndex])
            
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
    }
    
    @objc open func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
        
        collectionView.performBatchUpdates({
            
            for _ in messages {
            
                // TODO: do something with the messages here
                
                let sectionIndex = numberOfSections(in: collectionView) - 1
                self.collectionView.insertSections([sectionIndex])
                
            }
            
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
        
    }
    
    @objc open func remove(_ message: MSGMessage) {
        
        // TODO: Needs implementing
        
    }
    
}
