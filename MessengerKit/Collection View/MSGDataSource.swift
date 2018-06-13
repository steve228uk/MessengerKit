//
//  MSGCollectionViewDataSource.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

/// Used to provide messages to the `MSGCollectionView`
public protocol MSGDataSource: NSObjectProtocol {
    
    /// Should return the number of sections within the collection view.
    ///
    /// A section usually represents a new user speaking but can also be used for
    /// messages sent at a later time.
    ///
    /// - Returns: The number of sections.
    func numberOfSections() -> Int
    
    /// Should return the number of messages within the collection view section.
    /// A section usually represents a new user speaking but can also be used for
    /// messages sent at a later time.
    ///
    /// - Returns: The number of messages available.
    func numberOfMessages(in section: Int) -> Int
    
    /// Should return the message for a given index.
    ///
    /// - Parameter index: The index to return the message for.
    /// - Returns: The message that corresponds to the index.
    func message(for indexPath: IndexPath) -> MSGMessage
    
    /// The text that should be displayed in a label in the section footer.
    /// This may not be displayed on all styles.
    ///
    /// - Parameter section: The index of the section the footer is being rendered for.
    /// - Returns: The title that should be displayed
    func footerTitle(for section: Int) -> String?
    
    /// The text that should be displayed in a label in the section header.
    /// This may not be displayed on all styles.
    ///
    /// - Parameter section: The index of the section the header is being rendered for.
    /// - Returns: The title that should be displayed.
    func headerTitle(for section: Int) -> String?
    
}
