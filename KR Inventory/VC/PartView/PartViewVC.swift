//
//  PartViewVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class PartViewVC: UIViewController, UIGestureRecognizerDelegate {
    var topView: PartView!
    var shelf: String!
    var parts: [Part]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.topView = PartView(frame: self.view.frame)
        self.topView.shelfLabel.text = self.shelf
        self.view.addSubview(topView)
        // Do any additional setup after loading the view.
        
        self.topView.partTable.delegate = self
        self.topView.partTable.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedBack))
        swipeRight.direction = .right
        swipeRight.delegate = self
        self.topView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeAllBack))
        swipeLeft.direction = .left
        swipeLeft.delegate = self
        self.topView.addGestureRecognizer(swipeLeft)
    }
    
}

extension PartViewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "partCell")
        
        cell.textLabel?.text = parts[indexPath.row].partNumber
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quantityString = "Quantity: " + String(parts[indexPath.row].quantity!)
        
        let alert = UIAlertController(title: parts[indexPath.row].partNumber, message: quantityString, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {action in
            InvRoutes.deletePart(partNumber: self.parts[indexPath.row].partNumber!, shelf: self.shelf,
                                 completion: {part in
                                    self.parts = self.parts.filter {$0.partNumber != self.parts[indexPath.row].partNumber}
                                    tableView.reloadData()
                                    self.notifyDeleted(partNumber: part.partNumber ?? "NOT FOUND", shelf: part.shelf ?? "UNKNOWN")
            })
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension PartViewVC{
    @objc func swipedBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func swipeAllBack(){
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 5], animated: true)
    }
}

extension PartViewVC{
    func notifyDeleted(partNumber: String, shelf: String){
        let title = partNumber + " deleted from shelf " + shelf + "."
        let alert = UIAlertController(title: title, message: "You did it hoss.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fuck Yeah!", style: .default, handler: { action in
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
