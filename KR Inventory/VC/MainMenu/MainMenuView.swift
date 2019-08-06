//
//  MainMenuView.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class MainMenuView: UIView {
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Clear", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let sendShelfField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Shelf Name"
        
        return textView
    }()
    
    let sendNextShelfButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Next: ", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let sendShelfButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Send Shelf", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let partNumberPrefixField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Part Prefix"
        textView.returnKeyType = UIReturnKeyType.next
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        //myUITextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textView.clearButtonMode = UITextField.ViewMode.whileEditing
        
        return textView
    }()
    
    let partNumberField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Part Size"
        textView.returnKeyType = UIReturnKeyType.next
        textView.keyboardType = UIKeyboardType.decimalPad
        
        return textView
    }()
    
    let dashButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("-", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("0", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let oneButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("1", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        button.backgroundColor = Colors.nebulaGreen
        
        return button
    }()
    
    let partShelfField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Part Shelf"
        textView.returnKeyType = UIReturnKeyType.next
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
        return textView
    }()
    
    let partSuffixField: IQField = {
        let textView = IQField()
        textView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 22
        textView.font = UIFont.systemFont(ofSize: 19)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.placeholder = "Part Suffix"
        textView.returnKeyType = UIReturnKeyType.send
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        
        return textView
    }()
    
    let sendPartButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Send Part", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let shelfViewButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Shelves", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    let addPartsButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.backgroundColor = UIColor.clear
        button.setTitle("Add Parts", for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1
        
        return button
    }()
    
    // Numpad View
    
    var numPadHeightConstraint: NSLayoutConstraint?
    
    let numPadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        addSubview(numPadView)
        
        addSubview(partNumberPrefixField)
        addSubview(zeroButton)
        addSubview(oneButton)
        
        addSubview(clearButton)
        addSubview(sendShelfField)
        addSubview(sendNextShelfButton)
        addSubview(sendShelfButton)
        addSubview(partNumberField)
        addSubview(partShelfField)
        addSubview(partSuffixField)
        addSubview(sendPartButton)
        addSubview(shelfViewButton)
        
        addSubview(addPartsButton)
        addSubview(dashButton)
        
        
        clearButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        clearButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        clearButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        sendShelfButton.leftAnchor.constraint(equalTo: sendShelfField.leftAnchor).isActive = true
        sendShelfButton.topAnchor.constraint(equalTo: sendShelfField.bottomAnchor, constant: 7).isActive = true
        sendShelfButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.44).isActive = true
        sendShelfButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        sendNextShelfButton.rightAnchor.constraint(equalTo: sendShelfField.rightAnchor).isActive = true
        sendNextShelfButton.topAnchor.constraint(equalTo: sendShelfField.bottomAnchor, constant: 7).isActive = true
        sendNextShelfButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.44).isActive = true
        sendNextShelfButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        sendShelfField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sendShelfField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        sendShelfField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        sendShelfField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //PARTS
        
        partNumberPrefixField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partNumberPrefixField.topAnchor.constraint(equalTo: sendShelfButton.bottomAnchor, constant: 14).isActive = true
        partNumberPrefixField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        partNumberPrefixField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        partNumberField.leftAnchor.constraint(equalTo: partNumberPrefixField.leftAnchor).isActive = true
        partNumberField.topAnchor.constraint(equalTo: partNumberPrefixField.bottomAnchor, constant: 7).isActive = true
        partNumberField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.44).isActive = true
        partNumberField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //PLUSMINUS
        dashButton.rightAnchor.constraint(equalTo: oneButton.leftAnchor, constant: -7).isActive = true
        dashButton.topAnchor.constraint(equalTo: partNumberField.topAnchor).isActive = true
        dashButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        dashButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        zeroButton.rightAnchor.constraint(equalTo: sendShelfField.rightAnchor).isActive = true
        zeroButton.topAnchor.constraint(equalTo: partNumberField.topAnchor).isActive = true
        zeroButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        zeroButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        oneButton.rightAnchor.constraint(equalTo: zeroButton.leftAnchor, constant: -7).isActive = true
        oneButton.topAnchor.constraint(equalTo: partNumberField.topAnchor).isActive = true
        oneButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        oneButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        partShelfField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partShelfField.topAnchor.constraint(equalTo: partNumberField.bottomAnchor, constant: 7).isActive = true
        partShelfField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        partShelfField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        partSuffixField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        partSuffixField.topAnchor.constraint(equalTo: partShelfField.bottomAnchor, constant: 7).isActive = true
        partSuffixField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        partSuffixField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        sendPartButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        sendPartButton.topAnchor.constraint(equalTo: partSuffixField.bottomAnchor, constant: 7).isActive = true
        sendPartButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        sendPartButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        // NUMPADVIEW
        numPadView.topAnchor.constraint(equalTo: sendPartButton.bottomAnchor, constant: 7).isActive = true
        self.numPadHeightConstraint = numPadView.heightAnchor.constraint(equalToConstant: 0)
        self.numPadHeightConstraint?.isActive = true
        numPadView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        numPadView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        shelfViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        shelfViewButton.topAnchor.constraint(equalTo: numPadView.bottomAnchor, constant: 7).isActive = true
        shelfViewButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        shelfViewButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addPartsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addPartsButton.topAnchor.constraint(equalTo: shelfViewButton.bottomAnchor, constant: 14).isActive = true
        addPartsButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        addPartsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
