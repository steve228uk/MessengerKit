//
//  KeyboardFrameObserver.swift
//  KeyboardUtility
//
//  Created by Jonny on 9/10/17.
//  Copyright © 2017 Jonny. All rights reserved.
//

import UIKit

/// Init to start observation, deinit or call invalidate() to stop observation.
public class KeyboardFrameObserver : NSObject {
    
    public private(set) weak var view: UIView?
    
    let updateHandler: (CGRect, Bool) -> Void
    
    public init(view: UIView, updateHandler: @escaping (_ frame: CGRect, _ animated: Bool) -> Void) {
        self.view = view
        self.updateHandler = updateHandler
        super.init()
        KeyboardFrameObserversManager.shared.addObserver(self)
    }
    
    deinit {
        invalidate()
    }
    
    /// Stop observation.
    public func invalidate() {
        KeyboardFrameObserversManager.shared.removeObserver(self)
    }
}

