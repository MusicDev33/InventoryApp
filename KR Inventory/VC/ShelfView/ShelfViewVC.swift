//
//  ShelfViewVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class ShelfViewVC: UIViewController, UIGestureRecognizerDelegate {
    var topView: ShelfView!
    var shelves: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.topView = ShelfView(frame: self.view.frame)
        self.view.addSubview(topView)
        // Do any additional setup after loading the view.
        
        self.topView.shelfTable.delegate = self
        self.topView.shelfTable.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedBack))
        swipeRight.direction = .right
        swipeRight.delegate = self
        self.topView.addGestureRecognizer(swipeRight)
    }

}

extension ShelfViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shelves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "shelfCell")
        
        cell.textLabel?.text = self.shelves[indexPath.row]
        //guard let amtParts = Warehouse.shelves[Warehouse.orderedShelvesList[indexPath.row]]?.count else { return cell}
        //cell.detailTextLabel?.text = String(amtParts)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        let shelfText = cell.textLabel?.text!
        
        InvRoutes.getPartsOnShelf(shelf: shelfText!, completion: {parts in
            let partView = PartViewVC()
            partView.shelf = shelfText
            partView.parts = parts
            
            self.navigationController?.pushViewController(partView, animated: true)
        })
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //let deleteAction = self.contextualDeleteAction(forRowAtIndexPath: indexPath)
        let deleteAction = self.contextualDelete(forRowAtIndexPath: indexPath)
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfig
    }
    
    func contextualDelete(forRowAtIndexPath indexPath: IndexPath) -> UIContextualAction {
        
        let completionHandler: UIContextualAction.Handler = { contextAction, srcView, completion  in
            InvRoutes.deleteShelfParts(shelf: self.shelves[indexPath.row], completion: {
                self.topView.shelfTable.setEditing(false, animated: true)
            })
        }
        
        let action = UIContextualAction(style: .destructive, title: "Delete", handler: completionHandler)
        
        action.image = UIImage(named: "Trashcan")
        action.backgroundColor = UIColor.red
        return action
    }
}

extension ShelfViewVC{
    @objc func swipedBack(){
        self.navigationController?.popViewController(animated: true)
    }
}
