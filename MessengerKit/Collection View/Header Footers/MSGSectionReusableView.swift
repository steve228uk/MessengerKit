//
//  MSGSectionInfoProvider.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGSectionReusableView: UICollectionReusableView {
    
    open var style: MSGMessengerStyle?
    
    open var message: MSGMessage?
    
    open var title: String?
    
    open weak var delegate: MSGSectionReusableViewDelegate?
    
}
