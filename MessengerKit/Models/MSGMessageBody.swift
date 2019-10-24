//
//  MSGMessageBody.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// The body of an `MSGMessage`
///
/// - text: A message that is exclusively text.
/// - emoji: Use when a message is emoji only to display larger on the display.
/// - image: An image. Provide a URL.
/// - video: A video. Provide a thumb and a URL.
/// - custom: Not used by any of the included templates by default but it can be in a custom cell or style. The body can be any object required.
public enum MSGMessageBody {
    
    case text(String)
    case emoji(String)
    case image(UIImage)
    case imageFromUrl(URL)
    case video(UIImage, String)
    case custom(Any)
    
}
