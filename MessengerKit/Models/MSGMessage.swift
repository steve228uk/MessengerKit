//
//  MSGMessage.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

/// Represents a message within MessengerKit.
open class MSGMessage: NSObject{
    
    /// A unique identifier for the message.
    /// This is used to cache bubble sizes for the messenger.
    public let id: Int
    
    /// The body of the message.
    public let body: MSGMessageBody
    
    /// The user that sent the message.
    public let user: MSGUser
    
    /// The time that the message was sent.
    public let sentAt: Date
    
    public init(id: Int, body: MSGMessageBody, user: MSGUser, sentAt: Date) {
        self.id = id
        self.body = body
        self.user = user
        self.sentAt = sentAt
    }
    
}
