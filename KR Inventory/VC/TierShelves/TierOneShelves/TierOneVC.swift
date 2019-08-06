//
//  TierOneVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class TierOneVC: UIViewController, UIGestureRecognizerDelegate {
    var topView: TierOneView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.topView = TierOneView(frame: self.view.frame)
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

extension TierOneVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Warehouse.shelfTierOne.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "tierOneCell")
        
        cell.textLabel?.text = Warehouse.shelfTierOne[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        let shelfText = cell.textLabel?.text!
        
        let partView = TierTwoVC()
        partView.tOneShelf = shelfText
        
        self.navigationController?.pushViewController(partView, animated: true)
    }
}

extension TierOneVC{
    @objc func swipedBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

