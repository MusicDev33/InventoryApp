//
//  SendPartView.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class SendPartView: UIView {
    
    let shelfField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Shelf"
        textView.returnKeyType = UIReturnKeyType.done
        
        return textView
    }()
    
    let resetRackButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Reset", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let nextRackButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Rack: A", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let nextShelfButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Shelf: 1", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let prefixField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Prefix"
        
        return textView
    }()
    
    let quantityZeroButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = Colors.nebulaGreen
        button.setTitle("0", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let quantityOneButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("1", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity: "
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderWidth = 1
        label.layer.borderColor = Colors.nebulaGreen.cgColor
        label.layer.cornerRadius = 22
        return label
    }()
    
    let sizeOneField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "First Size"
        textView.keyboardType = UIKeyboardType.decimalPad
        
        return textView
    }()
    
    let addPeriodButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle(".", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    var sizeSelectOne: UICollectionView!
    
    let sizeTwoField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Second Size"
        textView.keyboardType = UIKeyboardType.decimalPad
        
        return textView
    }()
    var sizeSelectTwo: UICollectionView!
    
    let sendPartButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Send Part: ", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let typeInPartField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Type Part Number"
        
        return textView
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Clear", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.createSizeSelectOne()
        self.createSizeSelectTwo()
        
        addSubview(prefixField)
        addSubview(sizeOneField)
        addSubview(shelfField)
        addSubview(nextShelfButton)
        addSubview(nextRackButton)
        addSubview(resetRackButton)
        addSubview(sizeTwoField)
        addSubview(sizeSelectTwo)
        
        addSubview(quantityOneButton)
        addSubview(quantityZeroButton)
        addSubview(quantityLabel)
        addSubview(sendPartButton)
        
        addSubview(addPeriodButton)
        addSubview(typeInPartField)
        addSubview(clearButton)
        
        shelfField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        shelfField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shelfField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        shelfField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
        nextShelfButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        nextShelfButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nextShelfButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        nextShelfButton.topAnchor.constraint(equalTo: shelfField.topAnchor).isActive = true
        
        nextRackButton.rightAnchor.constraint(equalTo: nextShelfButton.leftAnchor, constant: -7).isActive = true
        nextRackButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nextRackButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        nextRackButton.topAnchor.constraint(equalTo: shelfField.topAnchor).isActive = true
        
        resetRackButton.rightAnchor.constraint(equalTo: nextRackButton.leftAnchor, constant: -7).isActive = true
        resetRackButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        resetRackButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        resetRackButton.topAnchor.constraint(equalTo: shelfField.topAnchor).isActive = true
        
        prefixField.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        prefixField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        prefixField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        prefixField.topAnchor.constraint(equalTo: shelfField.bottomAnchor, constant: 7).isActive = true
        
        quantityZeroButton.leftAnchor.constraint(equalTo: prefixField.rightAnchor, constant: 7).isActive = true
        quantityZeroButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        quantityZeroButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        quantityZeroButton.topAnchor.constraint(equalTo: prefixField.topAnchor).isActive = true
        
        quantityOneButton.leftAnchor.constraint(equalTo: quantityZeroButton.rightAnchor, constant: 7).isActive = true
        quantityOneButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        quantityOneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        quantityOneButton.topAnchor.constraint(equalTo: prefixField.topAnchor).isActive = true
        
        quantityLabel.leftAnchor.constraint(equalTo: quantityOneButton.rightAnchor, constant: 7).isActive = true
        quantityLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        quantityLabel.topAnchor.constraint(equalTo: prefixField.topAnchor).isActive = true
        
        sizeSelectOne.leftAnchor.constraint(equalTo: addPeriodButton.rightAnchor, constant: 7).isActive = true
        sizeSelectOne.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
        sizeSelectOne.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sizeSelectOne.centerYAnchor.constraint(equalTo: sizeOneField.centerYAnchor).isActive = true
        
        sizeOneField.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        sizeOneField.widthAnchor.constraint(equalToConstant: 99).isActive = true
        sizeOneField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sizeOneField.topAnchor.constraint(equalTo: prefixField.bottomAnchor, constant: 7).isActive = true
        
        addPeriodButton.leftAnchor.constraint(equalTo: sizeOneField.rightAnchor, constant: 7).isActive = true
        addPeriodButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        addPeriodButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        addPeriodButton.centerYAnchor.constraint(equalTo: sizeOneField.centerYAnchor).isActive = true
        
        sizeSelectTwo.leftAnchor.constraint(equalTo: sizeTwoField.rightAnchor, constant: 7).isActive = true
        sizeSelectTwo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -7).isActive = true
        sizeSelectTwo.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sizeSelectTwo.centerYAnchor.constraint(equalTo: sizeTwoField.centerYAnchor).isActive = true
        
        sizeTwoField.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        sizeTwoField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        sizeTwoField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sizeTwoField.topAnchor.constraint(equalTo: sizeOneField.bottomAnchor, constant: 7).isActive = true
        
        sendPartButton.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        sendPartButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        sendPartButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sendPartButton.topAnchor.constraint(equalTo: sizeTwoField.bottomAnchor, constant: 7).isActive = true
        
        typeInPartField.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        typeInPartField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        typeInPartField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        typeInPartField.topAnchor.constraint(equalTo: sendPartButton.bottomAnchor, constant: 7).isActive = true
        
        clearButton.leftAnchor.constraint(equalTo: shelfField.leftAnchor).isActive = true
        clearButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        clearButton.topAnchor.constraint(equalTo: typeInPartField.bottomAnchor, constant: 7).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createSizeSelectOne(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.itemSize = CGSize(width: 60, height: 44)
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        self.sizeSelectOne = UICollectionView(frame: frame, collectionViewLayout: layout)
        self.sizeSelectOne.isUserInteractionEnabled = true
        self.sizeSelectOne.allowsSelection = true
        self.sizeSelectOne.alwaysBounceVertical = false
        self.sizeSelectOne.translatesAutoresizingMaskIntoConstraints = false
        sizeSelectOne.register(RectBubbleCell.self, forCellWithReuseIdentifier: "bubbleCell")
        sizeSelectOne.backgroundColor = UIColor.white
        sizeSelectOne.layer.cornerRadius = 22
        sizeSelectOne.layer.borderWidth = 1
        sizeSelectOne.layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(sizeSelectOne)
    }
    
    func createSizeSelectTwo(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.itemSize = CGSize(width: 60, height: 44)
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        sizeSelectTwo = UICollectionView(frame: frame, collectionViewLayout: layout)
        sizeSelectTwo.isUserInteractionEnabled = true
        sizeSelectTwo.allowsSelection = true
        sizeSelectTwo.alwaysBounceVertical = false
        sizeSelectTwo.translatesAutoresizingMaskIntoConstraints = false
        sizeSelectTwo.register(RectBubbleCell.self, forCellWithReuseIdentifier: "bubbleCell")
        sizeSelectTwo.backgroundColor = UIColor.white
        sizeSelectTwo.layer.cornerRadius = 22
        sizeSelectTwo.layer.borderWidth = 1
        sizeSelectTwo.layer.borderColor = UIColor.lightGray.cgColor
        
        addSubview(sizeSelectTwo)
    }
}
