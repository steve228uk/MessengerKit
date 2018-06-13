//
//  MSGMessengerView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// Internal class used to load the collection view and input view for `MSGMessengerView`.
/// This view simply contains two containers and is loaded from the `MSGMessengerView` nib.
class MSGMessengerView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var collectionViewContainer: UIView!
    
    @IBOutlet weak var inputViewContainer: UIView!

    func add(_ collectionView: MSGCollectionView) {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionViewContainer.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: collectionViewContainer.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: collectionViewContainer.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: collectionViewContainer.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: collectionViewContainer.bottomAnchor).isActive = true
        
    }
    
    func add(_ inputView: MSGInputView) {
        
        inputView.translatesAutoresizingMaskIntoConstraints = false
        
        inputViewContainer.addSubview(inputView)
        
        inputView.topAnchor.constraint(equalTo: inputViewContainer.topAnchor).isActive = true
        inputView.leadingAnchor.constraint(equalTo: inputViewContainer.leadingAnchor).isActive = true
        inputView.trailingAnchor.constraint(equalTo: inputViewContainer.trailingAnchor).isActive = true
        inputView.bottomAnchor.constraint(equalTo: inputViewContainer.bottomAnchor).isActive = true
        
    }
    
}
