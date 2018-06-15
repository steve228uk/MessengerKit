//
//  MSGMessengerViewController.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

/// `MSGMessengerViewController` is a drop in messenger interface.
/// It incorporates both `MSGCollectionView` and `MSGInputView` into one UI.
///
/// If you wish to use your own `MSGCollectionView` or  `MSGInputView` subclass please use the appropriate initializer or subclass.
open class MSGMessengerViewController: UIViewController {

    // MARK: - Subviews
    
    /// The input view that's used within the messenger
    private(set) public lazy var messageInputView: MSGInputView = {
        
        var inputView: MSGInputView!
        
        if let nib = style.inputView.nib,
        let view = nib.instantiate(withOwner: self, options: nil).first as? MSGInputView {
            inputView = view
        } else {
            inputView = style.inputView.init()
        }
        
        inputView.style = style
        inputView.tintColor = tintColor
        
        return inputView
    }()
    
    /// The collection view that's used within the messenger
    private(set) public lazy var collectionView: MSGCollectionView = {
        let collectionView = style.collectionView.init()
        collectionView.keyboardDismissMode = keyboardDismissMode
        return collectionView
    }()
    
    // MARK: - Private Properties
    
    /// The layout guide for the keyboard
    private let keyboardLayoutGuide = KeyboardLayoutGuide()
    
    /// Sizes of the bubbles will be cached here for styles that use them
    internal var cachedSizes = [Int:CGSize]()
    
    /// This is set when the collection view `contentSize` changed so we know it's loaded
    private var collectionViewLoaded = false {
        didSet {
            if collectionViewLoaded && shouldScrollToBottom && !oldValue {
                collectionView.scrollToBottom(animated: false)
            }
        }
    }
    
    
    // MARK: - Public Properties
    
    /// The data source for the messenger
    public weak var dataSource: MSGDataSource?
    
    /// The delegate for the messenger
    public weak var delegate: MSGDelegate?
    
    /// The style of the messenger
    open var style: MSGMessengerStyle {
        return MessengerKit.Styles.iMessage
    }
    
    /// How the keyboard should be dismissed by the Messenger View Controller
    open var keyboardDismissMode: UIScrollViewKeyboardDismissMode = .interactive {
        didSet {
            collectionView.keyboardDismissMode = keyboardDismissMode
        }
    }
    
    @IBInspectable
    open var tintColor: UIColor? {
        didSet {
            messageInputView.tintColor = tintColor
        }
    }
    
    /// Whether the view controller should automatically scroll to bottom on appear.
    /// Defaults to `true`.
    public var shouldScrollToBottom: Bool = true
    
    
    // MARK: - Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if tintColor == nil {
            tintColor = view.tintColor
        }
        
        view.backgroundColor = style.backgroundColor
        
        setupCollectionView()
        setupInput()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Setup an observer so we can detect the keyboard appearing and keep the collectionview at the bottom
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        if shouldScrollToBottom {
            collectionView.scrollToBottom(animated: true)
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    open override func loadView() {
        loadFromDefaultNib()
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // We clear the cached sizes when the collection view changes
        cachedSizes = [:]
    }
    
    private func loadFromDefaultNib() {
        let view = UINib(nibName: "MSGMessengerView", bundle: MessengerKit.bundle)
            .instantiate(withOwner: self, options: nil).first as? MSGMessengerView
        
        view?.backgroundView.backgroundColor = style.inputViewBackgroundColor
        view?.add(collectionView)
        view?.add(messageInputView)
        
        self.view = view
    }
    
    
    // MARK: - Setup
    
    private func setupInput() {
        
        guard let view = view as? MSGMessengerView else {
            fatalError("Root view is not MSGMessengerView!!")
        }
        
        view.addLayoutGuide(keyboardLayoutGuide)
        view.inputViewContainer.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor).isActive = true
    
        messageInputView.addTarget(self, action: #selector(inputViewDidChange(inputView:)), for: .valueChanged)
        messageInputView.addTarget(self, action: #selector(inputViewPrimaryActionTriggered(inputView:)), for: .primaryActionTriggered)
    }
    
    open func setupCollectionView() {
        collectionView.style = style
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        collectionView.isPrefetchingEnabled = true
        
        collectionView.contentInset = UIEdgeInsetsMake(16, 0, 16, 0)
        
        collectionView.addObserver(self, forKeyPath: "contentSize", options: .old, context: nil)
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let observedObject = object as? MSGCollectionView, observedObject == collectionView {
            collectionViewLoaded = true
            collectionView.removeObserver(self, forKeyPath: "contentSize")
        }
        
    }
    
    
    // MARK: - Actions
    
    @objc open dynamic func inputViewDidChange(inputView: MSGInputView) { }
    
    @objc open dynamic func inputViewPrimaryActionTriggered(inputView: MSGInputView) { }
    
    
    // MARK: - Keyboard
    
    @objc open dynamic func keyboardWillShow(_ notification: Notification) {
        collectionView.scrollToBottom(animated: false)
    }
    
    // MARK: - Users Typing
    
    /// Sets the users that are currently typing.
    /// Can be overridden for additional control.
    ///
    /// - Parameter users: The users that are typing.
    open func setUsersTyping(_ users: [MSGUser]) {
        
        // TODO: add appearance proxy!!
        
        guard users.count > 0 else {
            collectionView.typingLabel.text = nil
            collectionView.layoutTypingLabelIfNeeded()
            return
        }
        
        var attributedText: NSMutableAttributedString!
        
        if users.count == 1 {
            attributedText = NSMutableAttributedString(string: users[0].displayName, attributes: [
                .font: UIFont.systemFont(ofSize: 14, weight: .bold),
                .foregroundColor: UIColor.darkText
            ])
        } else {
            attributedText = NSMutableAttributedString(string: "\(users.count) amigos ", attributes: [
                .font: UIFont.systemFont(ofSize: 14, weight: .bold),
                .foregroundColor: UIColor.darkText
            ])
        }
        
        attributedText.append(NSAttributedString(string: users.count == 1 ? "is typing…" : "typing…", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor.black
        ]))
        
        
        collectionView.typingLabel.attributedText = attributedText
        collectionView.layoutTypingLabelIfNeeded()
        
    }
    
}
