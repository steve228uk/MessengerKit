//
//  MSGTravamigosStyle.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// Styles the messenger view to be similar to that used in Travamigos.
public struct MSGTravamigosStyle: MSGMessengerStyle {
    
    public var collectionView: MSGCollectionView.Type = MSGTravCollectionView.self
    
    public var inputView: MSGInputView.Type = MSGTravInputView.self
    
    public var headerHeight: CGFloat = 12
    
    public var footerHeight: CGFloat = 30
    
    public var backgroundColor: UIColor = .groupTableViewBackground
    
    public var inputViewBackgroundColor: UIColor = .white
    
    public var inputTextViewBackgroundColor : UIColor = .white
    
    public var font: UIFont = .systemFont(ofSize: 14, weight: .bold)
    
    public var inputFont: UIFont = .systemFont(ofSize: 14, weight: .bold)
    
    public var inputPlaceholder: String = "Type something..."
    
    public var inputTextColor: UIColor = .darkGray
    
    public var inputPlaceholderTextColor: UIColor = .lightGray
    
    public var outgoingTextColor: UIColor = .white
    
    public var incomingTextColor: UIColor = .darkGray
    
    public var outgoingLinkColor: UIColor = .white
    
    public var incomingLinkColor: UIColor = UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00)
    
    public var outgoingLinkUnderlineStyle: NSNumber = 0

    public var incomingLinkUnderlineStyle: NSNumber = 0

    public func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = MSGTravOutgoingBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
        
    }
    
    // MARK: - Custom Properties
    
    /// Colors for the gradient on outgoing bubbles
    public var outgoingGradient: [CGColor] = [
        UIColor(red:1.00, green:0.30, blue:0.13, alpha:1.00).cgColor,
        UIColor(red:0.89, green:0.08, blue:0.46, alpha:1.00).cgColor
    ]
    
    /// Colors for the gradient on incoming bubbles
    public var incomingGradient: [CGColor] = [
        UIColor.white.cgColor,
        UIColor.white.cgColor
    ]
    
    /// The text for the send button
    public var inputButtonText = "Send"
    
}
