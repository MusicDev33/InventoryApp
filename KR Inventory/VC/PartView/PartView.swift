//
//  PartView.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class PartView: UIView {
    
    var shelfLabel: UILabel = {
        let label = UILabel()
        label.text = "Shelf No."
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let partTable: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "partCell")
        //table.register(SearchBarHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = true
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0)
        
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(shelfLabel)
        addSubview(partTable)
        
        shelfLabel.bottomAnchor.constraint(equalTo: partTable.topAnchor, constant: -15).isActive = true
        shelfLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        partTable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        partTable.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partTable.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        partTable.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

