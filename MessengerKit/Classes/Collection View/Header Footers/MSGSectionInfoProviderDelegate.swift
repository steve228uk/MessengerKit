//
//  MSGSectionInfoProviderDelegate.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

protocol MSGSectionInfoProviderDelegate: NSObjectProtocol {
    
    func avatarTapped(for user: MSGUser)
    
}


extension MSGSectionInfoProviderDelegate {
    
    func avatarTapped(for user: MSGUser) { }
    
}
