//
//  MSGSectionInfoProviderDelegate.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

public protocol MSGSectionReusableViewDelegate: NSObjectProtocol {
    
    func reusableViewAvatarTapped(for user: MSGUser)
    
}


extension MSGSectionReusableViewDelegate {
    
    public func reusableViewAvatarTapped(for user: MSGUser) { }
    
}
