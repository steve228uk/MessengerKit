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
        
        guard let delegate = delegate else { return }
        
        if let scheme = url.scheme, scheme.starts(with: "http"),
        delegate.shouldDisplaySafari(for: url) {
            
            let vc = SFSafariViewController(url: url)
            vc.preferredControlTintColor = tintColor
            present(vc, animated: true)
            
        } else if delegate.shouldOpen(url: url) {
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        }

        delegate.linkTapped(url: url)
        
    }
    
    public func cellAvatarTapped(for user: MSGUser) {
        delegate?.avatarTapped(for: user)
    }
    
}
