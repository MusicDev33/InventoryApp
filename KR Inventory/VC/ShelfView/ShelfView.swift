//
//  ShelfView.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class ShelfView: UIView {
    let shelfTable: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "shelfCell")
        //table.register(SearchBarHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = true
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(shelfTable)
        
        shelfTable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        shelfTable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        shelfTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        shelfTable.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
