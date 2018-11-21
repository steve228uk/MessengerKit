//
//  MSGMessengerViewController + CellDelegate.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import SafariServices

extension MSGMessengerViewController: MSGMessageCellDelegate {
    
    public func cellLongPressReceived(for message: MSGMessage) {
        delegate?.longPressReceieved(for: message)
    }
    
    public func cellTapReceived(for message: MSGMessage) {
        delegate?.tapReceived(for: message)
    }
    
    public func cellLinkTapped(url: URL) {
        delegate?.linkTapped(url: url)
    }
    
    public func cellAvatarTapped(for user: MSGUser) {
        delegate?.avatarTapped(for: user)
    }
    
}
