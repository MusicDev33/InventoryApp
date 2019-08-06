//
//  TierTwoVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class TierTwoVC: UIViewController, UIGestureRecognizerDelegate {
    var topView: ShelfView!
    var tOneShelf: String!
    
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

extension TierTwoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "tierTwoCell")
        
        cell.textLabel?.text = self.tOneShelf + "0" + String(indexPath.row + 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        guard let shelfText = cell.textLabel?.text! else { return }
        InvRoutes.getShelves(shelf: shelfText, completion: {shelves in
            
            let shelfView = ShelfViewVC()
            shelfView.shelves = shelves
            self.navigationController?.pushViewController(shelfView, animated: true)
        })
    }
}

extension TierTwoVC{
    @objc func swipedBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

