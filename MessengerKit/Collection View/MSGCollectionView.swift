//
//  MSGCollectionView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// The main collection view for `MessengerKit`.
/// This should be subclassed to provide custom styles for `MSGMessengerViewController`.
///
/// When subclassing ensure that the `registerCells` method is also subclassed and cells, headers, and footers are registered.
open class MSGCollectionView: UICollectionView {
    
    /// The label at the bottom of the chat `MSGCollectionView`
    /// This label is used to display `Stephen is typing...`
    public private(set) var typingLabel: UILabel!
    
    /// The style defined in `MSGMessengerViewController`
    var style: MSGMessengerStyle? {
        didSet {
            backgroundColor = style?.backgroundColor
        }
    }
    
    required public init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        alwaysBounceVertical = true
        
        registerCells()
        addTypingLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("MSGCollectionView should not be initialized manually! Did you mean to use MSGMessengerViewController?")
    }
    
    
    /// Override this method to register custom cells.
    ///
    /// The following identifiers **must** be registered:
    ///
    /// - `outgoingText`
    /// - `incomingText`
    ///
    /// If you wish to use emoji, video, or image message types you should also register:
    ///
    /// - `outgoingEmoji`
    /// - `incomingEmoji`
    /// - `outgoingImage`
    /// - `incomingImage`
    /// - `outgoingVideo`
    /// - `incomingVideo`
    ///
    /// Optionally, should you require headers and footers:
    ///
    /// - `outgoingHeader`
    /// - `outgoingFooter`
    /// - `incomingHeader`
    /// - `incomingFooter`
    ///
    /// Headers and footers will need to be disabled by setting their height to 0 in your `MSGMessengerStyle`
    open func registerCells() { }
    
    /// Scrolls the collection view to the very bottom.
    ///
    /// - Parameter animated: Whether the scrolling should be animated or not
    public func scrollToBottom(animated: Bool) {
        guard contentSize.height > bounds.size.height else { return }
        setContentOffset(CGPoint(x: 0, y: (contentSize.height - bounds.size.height) + (contentInset.bottom)), animated: animated)
    }
    
    /// Adds the typing label to the bottom of the collection view.
    /// This should be shown/hidden via the `setUsersTyping(_:)` method on `MSGMessengerViewController`
    open func addTypingLabel() {
        
        // TODO: add appearance proxy!!
        
        let attributedText = NSMutableAttributedString(string: "2 people ", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold),
            .foregroundColor: UIColor.darkText
        ])

        attributedText.append(NSAttributedString(string: "typing…", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor.darkText
        ]))

        typingLabel = UILabel()
        addSubview(typingLabel)
        bringSubviewToFront(typingLabel)
        
    }
    
    /// Lays out the `typingLabel` if required.
    open func layoutTypingLabelIfNeeded() {
        
        typingLabel.sizeToFit()
        
        // The definitive bottom of the collection view
        let bottom = contentOffset.y + bounds.size.height
        
        // Check the content size is greater than the bounds or use the bounds as the position for the y
        let y = contentSize.height > bounds.height ? contentSize.height + 16 : bottom - (16 + typingLabel.bounds.height)
        typingLabel.frame = CGRect(x: 20, y: y, width: contentSize.width - 40, height: typingLabel.bounds.height)
        
        let newOffset: CGFloat = typingLabel.bounds.height > 0 ? 55 : 16
        UIView.animate(withDuration: 0.3) {
            self.contentInset =  UIEdgeInsets(top: self.contentInset.top, left: 0, bottom: newOffset, right: 0)
        }
        
        // Only scroll the view if the user is already at the bottom
        if bottom >= contentSize.height && contentSize.height > bounds.height {
            scrollToBottom(animated: true)
        }
        
    }
    
}



