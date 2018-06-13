//
//  MessagesTableViewController.swift
//  Messenger
//
//  Created by Stephen Radford on 13/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController {

    let iMessageController = UINavigationController(rootViewController: ViewController())
    
    let travamigosController = UINavigationController(rootViewController: TravamigosViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the views before we need them to prevent flashing.
        // This is only required in split view and if we weren't manually loading it would be fine.
        iMessageController.viewControllers.first?.loadViewIfNeeded()
        travamigosController.viewControllers.first?.loadViewIfNeeded()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            splitViewController?.showDetailViewController(iMessageController, sender: nil)
            break
        case 1:
            splitViewController?.showDetailViewController(travamigosController, sender: nil)
            break
        default:
            break
        }
        
    }

}
