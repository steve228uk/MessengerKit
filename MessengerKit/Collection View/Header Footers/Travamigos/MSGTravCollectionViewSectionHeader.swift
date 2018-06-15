//
//  MSGTravCollectionViewSectionHeader.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGTravCollectionViewSectionHeader: MSGSectionReusableView {
    
    @IBOutlet weak var label: UILabel!
    
    override var title: String? {
        didSet {
            label.text = title
        }
    }
    
}
