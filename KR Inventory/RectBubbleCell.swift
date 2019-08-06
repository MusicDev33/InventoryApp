//
//  RectBubbleCell.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class RectBubbleCell: UICollectionViewCell{
    
    let colorImg: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.nebulaGreen.cgColor
        return view
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var random = ""
    
    let selectedImg: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    func setAsColor(){
        colorImg.backgroundColor = Colors.nebulaGreen
    }
    
    func unsetAsColor(){
        colorImg.backgroundColor = UIColor.clear
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
            {
                self.setAsColor()
            }
            else
            {
                self.unsetAsColor()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(colorImg)
        addSubview(sizeLabel)
        addSubview(selectedImg)
        
        colorImg.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        colorImg.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        colorImg.widthAnchor.constraint(equalToConstant: 59).isActive = true
        colorImg.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -2).isActive = true
        
        sizeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sizeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        selectedImg.rightAnchor.constraint(equalTo: colorImg.rightAnchor, constant: -15).isActive = true
        selectedImg.topAnchor.constraint(equalTo: colorImg.topAnchor, constant: 15).isActive = true
        
        selectedImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        selectedImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    var colorImgRightAnchor: NSLayoutConstraint?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
