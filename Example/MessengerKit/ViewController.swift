//
//  ViewController.swift
//  Messenger
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit
import MessengerKit

class ViewController: MSGMessengerViewController {

    let steve = User(displayName: "Steve", avatar: #imageLiteral(resourceName: "steve228uk"), avatarUrl: nil, isSender: true)
    
    let tim = User(displayName: "Tim", avatar: #imageLiteral(resourceName: "timi"), avatarUrl: nil, isSender: false)
    
    var id = 100
    
    override var style: MSGMessengerStyle {
        var style = MessengerKit.Styles.iMessage
        style.headerHeight = 0
//        style.inputPlaceholder = "Message"
//        style.alwaysDisplayTails = true
//        style.outgoingBubbleColor = .magenta
//        style.outgoingTextColor = .black
//        style.incomingBubbleColor = .green
//        style.incomingTextColor = .yellow
//        style.backgroundColor = .orange
//        style.inputViewBackgroundColor = .purple
        return style
    }
    
    
    lazy var messages: [[MSGMessage]] = {
        return [
            [
                MSGMessage(id: 1, body: .emoji("🐙💦🔫"), user: tim, sentAt: Date()),
            ],
            [
                MSGMessage(id: 2, body: .text("Yeah sure, gimme 5"), user: steve, sentAt: Date()),
                MSGMessage(id: 3, body: .text("Okay ready when you are"), user: steve, sentAt: Date())
            ],
            [
                MSGMessage(id: 4, body: .text("Awesome 😁"), user: tim, sentAt: Date()),
            ],
            [
                MSGMessage(id: 5, body: .text("Ugh, gotta sit through these two…"), user: steve, sentAt: Date()),
                MSGMessage(id: 6, body: .image(#imageLiteral(resourceName: "Splatoon")), user: steve, sentAt: Date()),
            ],
            [
                MSGMessage(id: 7, body: .text("Every. Single. Time."), user: tim, sentAt: Date()),
            ],
            [
                MSGMessage(id: 8, body: .emoji("🙄😭"), user: steve, sentAt: Date()),
                MSGMessage(id: 9, body: .imageFromUrl(URL(string: "https://placeimg.com/640/480/any")!), user: steve, sentAt: Date()
                )
            ]
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "iMessage"
        
        dataSource = self
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.scrollToBottom(animated: false)
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        id += 1
        
        let body: MSGMessageBody = (inputView.message.containsOnlyEmoji && inputView.message.count < 5) ? .emoji(inputView.message) : .text(inputView.message)
        
        let message = MSGMessage(id: id, body: body, user: steve, sentAt: Date())
        insert(message)
    }
    
    override func insert(_ message: MSGMessage) {
        
        collectionView.performBatchUpdates({
            if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                self.messages[self.messages.count - 1].append(message)
                
                let sectionIndex = self.messages.count - 1
                let itemIndex = self.messages[sectionIndex].count - 1
                self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                
            } else {
                self.messages.append([message])
                let sectionIndex = self.messages.count - 1
                self.collectionView.insertSections([sectionIndex])
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
    }
    
    override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
        
        collectionView.performBatchUpdates({
            for message in messages {
                if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                    self.messages[self.messages.count - 1].append(message)
                    
                    let sectionIndex = self.messages.count - 1
                    let itemIndex = self.messages[sectionIndex].count - 1
                    self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                    
                } else {
                    self.messages.append([message])
                    let sectionIndex = self.messages.count - 1
                    self.collectionView.insertSections([sectionIndex])
                }
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: false)
            self.collectionView.layoutTypingLabelIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                callback?()
            }
        })
        
    }

}

// MARK: - Overrides

extension ViewController {
    
}

// MARK: - MSGDataSource

extension ViewController: MSGDataSource {
    
    func numberOfSections() -> Int {
        return messages.count
    }
    
    func numberOfMessages(in section: Int) -> Int {
        return messages[section].count
    }
    
    func message(for indexPath: IndexPath) -> MSGMessage {
        return messages[indexPath.section][indexPath.item]
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].first?.user.displayName
    }

}

// MARK: - MSGDelegate

extension ViewController: MSGDelegate {
    
    func linkTapped(url: URL) {
        print("Link tapped:", url)
    }
    
    func avatarTapped(for user: MSGUser) {
        print("Avatar tapped:", user)
    }
    
    func tapReceived(for message: MSGMessage) {
        print("Tapped: ", message)
    }
    
    func longPressReceieved(for message: MSGMessage) {
        print("Long press:", message)
    }
    
    func shouldDisplaySafari(for url: URL) -> Bool {
        return true
    }
    
    func shouldOpen(url: URL) -> Bool {
        return true
    }
    
}
