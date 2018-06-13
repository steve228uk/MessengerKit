//
//  MessengerKit.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import Foundation

public final class MessengerKit {
    
    /// The bundle that contains nibs and assets.
    internal static var bundle: Bundle? {
        let sourceBundle = Bundle(for: MessengerKit.self)
        
        if let url = sourceBundle.url(forResource: "MessengerKit", withExtension: "bundle"), let bundle = Bundle(url: url) {
            return bundle
        }
        
        return sourceBundle
    }
    
    private init() { }
    
    /// Built-in styles to be used by `MSGMessengerViewController`
    public struct Styles {
        
        public static let travamigos = MSGTravamigosStyle()
        
        public static let iMessage = MSGIMessageStyle()
        
        private init() { }
        
    }
    
}
