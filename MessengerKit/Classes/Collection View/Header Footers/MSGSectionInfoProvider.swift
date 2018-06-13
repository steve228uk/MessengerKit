//
//  MSGSectionInfoProvider.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

protocol MSGSectionInfoProvider: NSObjectProtocol {
    
    var style: MSGMessengerStyle? { get set }
    
    var message: MSGMessage? { get set }
    
    var title: String? { get set }
    
    var delegate: MSGSectionInfoProviderDelegate? { get set }
    
}
