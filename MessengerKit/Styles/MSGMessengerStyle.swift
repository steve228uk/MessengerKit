//
//  MSGMessengerStyle.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// Controls how the `MSGMessengerViewController` should be styled.
///
/// To define which cells should be used then a subclass of `MSGCollectionView` should be provided.
/// Custom cells can be registered there.
public protocol MSGMessengerStyle {

    /// The collection view class to use
    var collectionView: MSGCollectionView.Type { get }

    /// The input view class to use
    var inputView: MSGInputView.Type { get }

    /// The height of the header above the section
    var headerHeight: CGFloat { get }

    /// The height of the footer above the section
    var footerHeight: CGFloat { get }
    
    /// The background color of the messenger view
    var backgroundColor: UIColor { get }
    
    /// The background color of the input view.
    /// Not all styles take this into consideration.
    var inputViewBackgroundColor: UIColor { get }
    
    /// The font that should be used for incoming and outgoing bubbles
    var font: UIFont { get }
    
    /// The font that should be used within the input view
    var inputFont: UIFont { get }
    
    /// The placeholder that is displayed in the input view
    var inputPlaceholder: String { get }
    
    /// The color of text used in the input view
    var inputTextColor: UIColor { get }
    
    /// The color of text used by the placeholder in input view
    var inputPlaceholderTextColor: UIColor { get }
    
    // The color of the textview in the input view
    var inputTextViewBackgroundColor : UIColor { get }
    
    /// The text color of outgoing messages
    var outgoingTextColor: UIColor { get }
    
    /// Color of links in the outgoing messages
    var outgoingLinkColor: UIColor { get }
    
    /// Underline style of links on the outgoing messages
    var outgoingLinkUnderlineStyle: NSNumber { get }

    /// The text color of incoming messages
    var incomingTextColor: UIColor { get }
    
    /// Color of links on the incoming messages
    var incomingLinkColor: UIColor { get }

    /// Underline style of links on the incoming messages
    var incomingLinkUnderlineStyle: NSNumber { get }

    /// Calculates the size of the cell for a given message
    ///
    /// - Parameter message: The message to calculate the size for
    /// - Returns: The size calculated
    func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize
    
}
