//
//  MSGUser.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// Objects representing a user within MessengerKit
/// Must conform to this protocol.
public protocol MSGUser {
    
    /// The name that will be displayed on the cell
    var displayName: String { get }
    
    /// The avatar for the user.
    var avatar: UIImage? { get set }
    
    /// Whether this user is the one sending messages.
    /// This is used to determine which bubble is rendered.
    var isSender: Bool { get }
    
}
