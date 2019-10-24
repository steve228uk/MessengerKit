//
//  MSGCollectionView + DataSource.swift
//  MessengerKit
//
//  Created by Stephen Radford on 08/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

extension MSGMessengerViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, MSGSectionReusableViewDelegate {
    
    // MARK: - DataSource
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource?.numberOfSections() ?? 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberOfMessages(in: section) ?? 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let message = dataSource?.message(for: indexPath) else {
            fatalError("Message not defined for \(indexPath)")
        }
        
        let count = collectionView.numberOfItems(inSection: indexPath.section)
        let isLast = indexPath.item + 1 == count
        
        switch message.body {
        case .text:
            let identifier = message.user.isSender ? "outgoingText" : "incomingText"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MSGMessageCell
            
            cell.delegate = self
            cell.message = message
            cell.style = style
            cell.isLastInSection = isLast
            
            // If there's more than one item in the section
            // then we reload the previous one
            if count > 1 {
                updatePreviousCell(of: indexPath, in: collectionView)
            }
            
            return cell
            
            
        case .emoji:
            
            let identifier = message.user.isSender ? "outgoingEmoji" : "incomingEmoji"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MSGMessageCell
            
            cell.delegate = self
            cell.message = message
            cell.style = style
            cell.isLastInSection = isLast
            
            return cell
            
            
        case .image, .imageFromUrl:
            
            let identifier = message.user.isSender ? "outgoingImage" : "incomingImage"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MSGMessageCell
            
            cell.delegate = self
            cell.message = message
            cell.style = style
            cell.isLastInSection = isLast
            
            return cell
            
            
        case .video:
            
            let identifier = message.user.isSender ? "outgoingVideo" : "incomingVideo"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MSGMessageCell
            
            cell.delegate = self
            cell.message = message
            cell.style = style
            cell.isLastInSection = isLast
            
            return cell
            
        case .custom:
            let identifier = message.user.isSender ? "outgoingCustom" : "incomingCustom"
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MSGMessageCell
            
            cell.delegate = self
            cell.message = message
            cell.style = style
            cell.isLastInSection = isLast
            
            return cell
        }
        
    }
    
    /// Updates the cell directly prior to the one being reloaded to mark it
    /// as no longer being `isLast`.
    ///
    /// - Parameters:
    ///   - indexPath: The current index path being rendered
    ///   - collectionView: The collection view the cell belongs to
    private func updatePreviousCell(of indexPath: IndexPath, in collectionView: UICollectionView) {
        let previousIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)
        let cell = collectionView.cellForItem(at: previousIndexPath) as? MSGMessageCell
        cell?.isLastInSection = false
    }
    
    // MARK: - Delegate
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let message = dataSource?.message(for: indexPath) else {
            fatalError("Message not defined for \(indexPath)")
        }
        
        return calculateSize(for: message)
    }
    
    
    open func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            guard let message = dataSource?.message(for: indexPath) else {
                continue
            }
            
            calculateSize(for: message)
        }
        
    }
    
    @discardableResult open func calculateSize(for message: MSGMessage) -> CGSize {
        
        if let size = cachedSizes[message.id] {
            return size
        }
        
        let size = style.size(for: message, in: collectionView)
        
        cachedSizes[message.id] = size
        
        return size
        
    }
    
    // MARK: - Header / Footer
    
    open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let message = dataSource?.message(for: indexPath) else {
            fatalError("Message not defined for \(indexPath)")
        }
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            
            
            let identifier = message.user.isSender ? "outgoingFooter" : "incomingFooter"
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as! MSGSectionReusableView
            
            footer.message = message
            footer.style = style
            footer.delegate = self
            footer.title = dataSource?.footerTitle(for: indexPath.section)
            
            return footer
            
        default:
            
            
            let identifier = message.user.isSender ? "outgoingHeader" : "incomingHeader"
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as! MSGSectionReusableView
            
            header.message = message
            header.style = style
            header.delegate = self
            header.title = dataSource?.headerTitle(for: indexPath.section)
            
            return header
            
        }
        
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard style.headerHeight > 0 else {
            return .zero
        }
        
        return CGSize(width: collectionView.bounds.width, height: style.headerHeight)
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard style.footerHeight > 0 else {
            return .zero
        }
        
        return CGSize(width: collectionView.bounds.width, height: style.footerHeight)
    }
    
    public func reusableViewAvatarTapped(for user: MSGUser) {
        delegate?.avatarTapped(for: user)
    }
    
}
