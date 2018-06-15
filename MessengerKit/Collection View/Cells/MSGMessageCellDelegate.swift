//
//  MSGMessageCellDelegate.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

public protocol MSGMessageCellDelegate: NSObjectProtocol {
    
    func cellLongPressReceived(for message: MSGMessage)
    
    func cellTapReceived(for message: MSGMessage)
    
    func cellLinkTapped(url: URL)
    
    func cellAvatarTapped(for user: MSGUser)
    
}
