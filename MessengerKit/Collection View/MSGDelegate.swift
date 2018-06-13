//
//  MSGDelegate.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

/// The main delegate for `MessengerKit`.
/// Your delegate should be set on the `MSGCollectionView` or `MSGMessengerView` instance.
///
/// All methods are optional.
public protocol MSGDelegate: NSObjectProtocol {
    
    /// Called when the avatar of a user was tapped.
    ///
    /// - Parameter user: The user that was tapped.
    func avatarTapped(for user: MSGUser)
    
    /// Called when a long press ocurred on a chat message.
    ///
    /// - Parameter message: The message that was long pressed.
    func longPressReceieved(for message: MSGMessage)
    
    /// Called when a chat message cell is tapped.
    ///
    /// - Parameter message: The message that was tapped
    func tapReceived(for message: MSGMessage)
    
    /// Called when a link within a chat message is tapped.
    ///
    /// - Parameter url: The URL that was tapped
    func linkTapped(url: URL)
    
    /// Called to check that `SFSafariViewController` should be shown for HTTP links.
    ///
    /// - Parameter url: The URL that was tapped
    /// - Returns: Whether Safari should be shown or not
    func shouldDisplaySafari(for url: URL) -> Bool
    
    /// Called to check whether a non-HTTP should attempt to be opened.
    /// Links like `tel://` will call this method.
    ///
    /// - Parameter url: The URL that was tapped
    /// - Returns: Whether the URL should be opened or not
    func shouldOpen(url: URL) -> Bool
    
}

extension MSGDelegate {
    
    public func avatarTapped(for user: MSGUser) { }
    
    public func longPressReceieved(for message: MSGMessage) { }
    
    public func tapReceived(for message: MSGMessage) { }
    
    public func linkTapped(url: URL) { }
    
    public func shouldDisplaySafari(for url: URL) -> Bool { return true }
    
    public func shouldOpen(url: URL) -> Bool { return true }
    
}
