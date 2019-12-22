//
//  MSGIMessageStyle.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

/// Styles the `MSGMessengerViewController` to be similar in style to iMessage.
public struct MSGIMessageStyle: MSGMessengerStyle {
    
    public var collectionView: MSGCollectionView.Type = MSGImessageCollectionView.self
    
    public var inputView: MSGInputView.Type = MSGImessageInputView.self
    
    public var headerHeight: CGFloat = 12
    
    public var footerHeight: CGFloat = 30
    
    public var backgroundColor: UIColor = .white
    
    public var inputViewBackgroundColor: UIColor = .white
    
    public var inputTextViewBackgroundColor : UIColor = .white
    
    public var font: UIFont = .preferredFont(forTextStyle: .body)
    
    public var inputFont: UIFont = .systemFont(ofSize: 14)
    
    public var inputTextColor: UIColor = .darkText
    
    public var inputPlaceholder: String = "Type something..."
    
    public var inputPlaceholderTextColor: UIColor = .lightGray
    
    public var outgoingTextColor: UIColor = .white
    
    public var incomingTextColor: UIColor = .darkText
    
    public var outgoingLinkColor: UIColor = .white
    
    public var incomingLinkColor: UIColor = UIColor(hue:0.58, saturation:0.81, brightness:0.95, alpha:1.00)
    
    public func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = MSGTailOutgoingBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
        
    }
    
    
    // MARK: - Custom Properties
    
    /// The color of the bubble when its outgoing
    public var outgoingBubbleColor: UIColor = UIColor(hue:0.58, saturation:0.81, brightness:0.95, alpha:1.00)
    
    /// The color of the bubble when its incoming
    public var incomingBubbleColor: UIColor = UIColor(hue:0.67, saturation:0.02, brightness:0.92, alpha:1.00)
    
    /// If set to true then tails will be displayed on every cell
    /// and not use the final cell in the section.
    public var alwaysDisplayTails: Bool = false
    
    /// The font used by header views
    public var headerFont: UIFont = UIFont.systemFont(ofSize: 10)
    
    /// The text color used by header views
    public var headerTextColor: UIColor = UIColor(hue:0.67, saturation:0.03, brightness:0.58, alpha:1.00)
    
    /// The font used by footer views
    public var footerFont: UIFont = UIFont.systemFont(ofSize: 10)
    
    /// The text color used by footer views
    public var footerTextColor: UIColor = UIColor(hue:0.67, saturation:0.03, brightness:0.58, alpha:1.00)
    
}
