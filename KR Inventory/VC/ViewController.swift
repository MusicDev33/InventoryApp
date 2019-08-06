//
//  ViewController.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        self.navigationController?.isNavigationBarHidden = true
        
        for tierOneShelf in 52...78 {
            Warehouse.shelfTierOne.append(String(tierOneShelf))
        }
        
        Warehouse.shelfTierOne.append("99")
        
        for tOneShelf in Warehouse.shelfTierOne{
            for shelf in 1...9{
                let tempShelf = tOneShelf + "0" + String(shelf)
                Warehouse.shelfTierTwo[tOneShelf]?.append(tempShelf)
            }
        }
        
        let mainMenu = MainMenuVC()
        self.navigationController?.pushViewController(mainMenu, animated: true)
        /*
        InvRoutes.getAllShelves {
            InvRoutes.getAllParts {
                let mainMenu = MainMenuVC()
                self.navigationController?.pushViewController(mainMenu, animated: true)
            }
        }*/
    }
}

