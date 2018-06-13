
//
//  MSGTravInputView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGTravInputView: MSGInputView {

    var lineColor: UIColor = UIColor(hue:0.67, saturation:0.02, brightness:0.92, alpha:1.00)
    
    /// The stack view used to old all subviews
    private let stackView = UIStackView()
    
    /// The height constraint to be modified as required
    private var heightConstraint: NSLayoutConstraint!
    
    /// The separator to be used between the text view and button
    private let separator: UIView = {
        let view = MSGInputSeparatorView()
        view.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    
    private let topBorder = CALayer()
    
    open override var tintColor: UIColor! {
        didSet {
            textView.tintColor = tintColor
            styleSendButton()
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        topBorder.frame = CGRect(x: 0, y: 0, width: layer.bounds.width, height: 1)
    }
    
    override open func setup() {
        
        textView = MSGPlaceholderTextView()
        sendButton = UIButton(type: .system)
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        textView.contentInset = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
        
        addStackView()
        addSubviews()
        addTopBorder()
        setupSendButton()
        
        super.setup()
    }
    
    func addHeightConstraints() {
        heightConstraint = heightAnchor.constraint(equalToConstant: minHeight)
        heightConstraint.isActive = true
    }
    
    func addStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        addSubview(stackView)
        
        var guide: UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            guide = safeAreaLayoutGuide
        } else {
            guide = layoutMarginsGuide
        }
        
        stackView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    func addSubviews() {
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(sendButton)
    }
    
    func setupTextView() {
        textView.tintColor = tintColor
        textView.delegate = self
    }
    
    func setupSendButton() {
        sendButton.isEnabled = false
        sendButton.addTarget(self, action: #selector(sendButtonTapped(_:)), for: .touchUpInside)
        sendButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        styleSendButton()
    }
    
    func styleSendButton() {
        let title = (style as? MSGTravamigosStyle)?.inputButtonText ?? "Send"
        
        sendButton.setAttributedTitle(NSAttributedString(string: title, attributes: [
            .foregroundColor: tintColor,
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
            ]), for: .normal)
        
        sendButton.setAttributedTitle(NSAttributedString(string: title, attributes: [
            .foregroundColor: UIColor(red:0.90, green:0.90, blue:0.91, alpha:1.00),
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]), for: .disabled)
    }
    
    func addTopBorder() {
        topBorder.backgroundColor = lineColor.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: layer.bounds.width, height: 1)
        layer.addSublayer(topBorder)
    }

}
