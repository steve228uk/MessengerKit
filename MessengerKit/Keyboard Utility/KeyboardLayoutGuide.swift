//
//  KeyboardLayoutGuide.swift
//  KeyboardUtility
//
//  Created by Jonny on 9/10/17.
//  Copyright © 2017 Jonny. All rights reserved.
//
//

import UIKit

public class KeyboardLayoutGuide : UILayoutGuide {
    
    private var observer: KeyboardFrameObserver?
    
    public override var owningView: UIView? {
        didSet {
            guard let view = owningView else {
                observer = nil
                return
            }
            
            let topConstraint = view.bottomAnchor.constraint(equalTo: topAnchor)
            topConstraint.priority = .defaultHigh
            
            let heightConstraint = heightAnchor.constraint(equalToConstant: 0)
            
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: view.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topConstraint,
                heightConstraint,
            ])
            
            // layoutGuide.layoutFrame.origin.y <= view.bounds.height
            if #available(iOS 11.0, *) {
                topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                topAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
            }
            
            observer = KeyboardFrameObserver(view: view) { [weak view] keyboardFrame, animated in
                guard let view = view else { return }
                
                topConstraint.constant = view.bounds.height - keyboardFrame.origin.y
                heightConstraint.constant = keyboardFrame.height
                
                if animated {
                    view.layoutIfNeeded()
                }
            }
        }
    }
}
