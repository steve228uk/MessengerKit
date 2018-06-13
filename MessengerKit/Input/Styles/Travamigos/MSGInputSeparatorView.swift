//
//  MSGInputSeparatorView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// The separator between the `MSGPlaceholderTextView` and the send button.
///
/// This is used because we had some issues drawing the line manually.
class MSGInputSeparatorView: UIView {
    
    var barColor: UIColor? = .lightGray {
        didSet {
            bar.backgroundColor = barColor
        }
    }
    
    private lazy var bar: UIView = {
        let view = UIView()
        view.backgroundColor = self.barColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    func setup() {
        bar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bar)
        bar.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        bar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        bar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}
