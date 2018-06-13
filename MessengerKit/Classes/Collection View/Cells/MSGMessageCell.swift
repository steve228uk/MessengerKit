//
//  MSGMessageCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGMessageCell: UICollectionViewCell {
    
    /// The message the cell is displaying
    public var message: MSGMessage?
    
    /// Provides information on how to style the cell
    public var style: MSGMessengerStyle?
    
    /// Whether the cell is the last displayed in the section.
    /// We need to know this for styles like iMessage as the final cell sometimes differs in appearance.
    public var isLastInSection: Bool = false
    
    /// Ensure this is declared as weak or you'll end up with a memory leak, kids.
    public weak var delegate: MSGMessageCellDelegate?
    
    /// The gesture recogniser for long press.
    /// This should be added to the cell's `contentView`
    public var longPressGestureRecognizer: UILongPressGestureRecognizer!
    
    /// The gesture recogniser for a tap.
    /// This should be added to the cell's `contentView`
    public var tapGestureRecognizer: UITapGestureRecognizer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizers()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureRecognizers()
    }
    
    open func addGestureRecognizers() {
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressReceieved(_:)))
        contentView.addGestureRecognizer(longPressGestureRecognizer)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapReceived(_:)))
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
}

// MARK: - MSGMessageCellDelegate Handlers

extension MSGMessageCell {
    
    @objc func longPressReceieved(_ sender: UILongPressGestureRecognizer) {
        guard let message = message, sender.state == .began else { return }
        delegate?.cellLongPressReceived(for: message)
    }
    
    @objc func tapReceived(_ sender: UITapGestureRecognizer) {
        guard let message = message, sender.state == .ended else { return }
        delegate?.cellTapReceived(for: message)
    }
    
}
