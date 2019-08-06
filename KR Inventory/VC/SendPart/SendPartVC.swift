//
//  SendPartVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/19/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class SendPartVC: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    var shelfNumber: Int!
    var rackLetter: String!
    var rackIndex = 0
    
    var macroShelf = "39"
    
    var totalShelf = "3901-A"
    
    var topView: SendPartView!
    
    var partString = ""
    
    var currentQuantity = 0
    
    var addPeriodOn = false
    
    var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"]
    var customSizes = ["116","18","316","14","516","38","716","12","916",
                        "58","1116","34","1316","78","1516","1","118","114",
                        "112","134","2","214","212","234","3","4","5","6","7","8","9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        topView = SendPartView(frame: self.view.frame)
        
        self.shelfNumber = 1
        self.rackLetter = "A"
        
        self.view.addSubview(topView)
        topView.sizeSelectOne.delegate = self
        topView.sizeSelectOne.dataSource = self
        topView.sizeSelectTwo.delegate = self
        topView.sizeSelectTwo.dataSource = self
        
        topView.shelfField.delegate = self
        topView.prefixField.delegate = self
        topView.sizeOneField.delegate = self
        topView.sizeTwoField.delegate = self
        topView.typeInPartField.delegate = self
        // Do any additional setup after loading the view.
        
        topView.shelfField.text = totalShelf
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(screenTapped))
        swipeDown.direction = .down
        swipeDown.delegate = self
        topView.addGestureRecognizer(swipeDown)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedBack))
        swipeRight.direction = .right
        swipeRight.delegate = self
        self.topView.addGestureRecognizer(swipeRight)
        
        //Listeners
        topView.quantityZeroButton.addTarget(self, action: #selector(qtyZeroPressed), for: .touchUpInside)
        topView.quantityOneButton.addTarget(self, action: #selector(qtyOnePressed), for: .touchUpInside)
        topView.nextRackButton.addTarget(self, action: #selector(rackUp), for: .touchUpInside)
        topView.resetRackButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        topView.nextShelfButton.addTarget(self, action: #selector(shelfUp), for: .touchUpInside)
        topView.clearButton.addTarget(self, action: #selector(clearButton), for: .touchUpInside)
        topView.addPeriodButton.addTarget(self, action: #selector(addPeriod), for: .touchUpInside)
        topView.sendPartButton.addTarget(self, action: #selector(sendPart), for: .touchUpInside)
    }
}

extension SendPartVC{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.done{
            if textField.text!.count >= 2{
                topView.resetRackButton.isEnabled = true
                topView.nextShelfButton.isEnabled = true
                topView.nextRackButton.isEnabled = true
                self.macroShelf = textField.text!
                var totalShelfString = ""
                if self.shelfNumber < 10{
                    totalShelfString = self.macroShelf + "0" + String(self.shelfNumber) + "-" + alphabet[rackIndex]
                    textField.text = totalShelfString
                    self.totalShelf = totalShelfString
                }else{
                    totalShelfString = self.macroShelf + String(self.shelfNumber) + "-" + alphabet[rackIndex]
                    textField.text = totalShelfString
                    self.totalShelf = totalShelfString
                }
                
                textField.resignFirstResponder()
            }
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.topView.shelfField{
            if textField.text!.count >= 2 {
                textField.text = String(textField.text?.prefix(2) ?? "39")
            }
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField != topView.shelfField{
            self.partString += string
            self.topView.sendPartButton.setTitle(self.partString, for: .normal)
        }
        
        return true
    }
}

extension SendPartVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.customSizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bubbleCell", for: indexPath) as! RectBubbleCell
        cell.sizeLabel.text = customSizes[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.topView.sizeSelectOne{
            let size = customSizes[indexPath.row]
            topView.sizeOneField.text = size
            self.partString += size
            self.topView.sendPartButton.setTitle(self.partString, for: .normal)
        }else if collectionView == self.topView.sizeSelectTwo{
            let size = customSizes[indexPath.row]
            topView.sizeTwoField.text = size
            self.partString += size
            self.topView.sendPartButton.setTitle(self.partString, for: .normal)
        }
    }
}

extension SendPartVC{
    @objc func screenTapped(){
        self.view.endEditing(true)
    }
    
    @objc func swipedBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addPeriod(){
        self.partString += "."
        self.topView.sendPartButton.setTitle(self.partString, for: .normal)
    }
    
    @objc func clearButton(){
        self.partString = ""
        self.topView.sizeOneField.text = ""
        self.topView.sizeTwoField.text = ""
        self.topView.prefixField.text = ""
        self.topView.sendPartButton.setTitle("Send Part", for: .normal)
        topView.sizeSelectOne.reloadData()
        topView.sizeSelectTwo.reloadData()
    }
    
    @objc func qtyZeroPressed(){
        self.currentQuantity = 0
        topView.quantityZeroButton.backgroundColor = Colors.nebulaGreen
        topView.quantityOneButton.backgroundColor = UIColor.clear
    }
    
    @objc func qtyOnePressed(){
        self.currentQuantity = 1
        topView.quantityOneButton.backgroundColor = Colors.nebulaGreen
        topView.quantityZeroButton.backgroundColor = UIColor.clear
    }
    
    @objc func rackUp(){
        self.rackIndex += 1
        self.rackLetter = alphabet[rackIndex]
        let rackString = "Rack: " + self.rackLetter
        self.topView.nextRackButton.setTitle(rackString, for: .normal)
        
        var totalShelfString = ""
        
        if self.shelfNumber < 10{
            totalShelfString = self.macroShelf + "0" + String(self.shelfNumber) + "-" + alphabet[rackIndex]
            self.topView.shelfField.text = totalShelfString
        }else{
            totalShelfString = self.macroShelf + String(self.shelfNumber) + "-" + alphabet[rackIndex]
            self.topView.shelfField.text = totalShelfString
        }
    }
    
    @objc func reset(){
        self.rackIndex = 0
        self.rackLetter = alphabet[rackIndex]
        self.shelfNumber = 1
        
        self.topView.nextRackButton.setTitle("Rack: A", for: .normal)
        self.topView.nextShelfButton.setTitle("Shelf: 1", for: .normal)
        self.topView.shelfField.text = "3901-A"
        self.macroShelf = "39"
        self.totalShelf = "3901-A"
    }
    
    @objc func shelfUp(){
        self.shelfNumber += 1
        let shelfString = "Shelf: " + String(self.shelfNumber)
        var totalShelfString = ""
        self.topView.nextShelfButton.setTitle(shelfString, for: .normal)
        
        if self.shelfNumber < 10{
            totalShelfString = self.macroShelf + "0" + String(self.shelfNumber) + "-" + alphabet[rackIndex]
            self.topView.shelfField.text = totalShelfString
        }else{
            totalShelfString = self.macroShelf + String(self.shelfNumber) + "-" + alphabet[rackIndex]
            self.topView.shelfField.text = totalShelfString
        }
        
        self.totalShelf = totalShelfString
    }
    
    @objc func sendPart(){
        print(partString)
        print(totalShelf)
        InvRoutes.addPart(partNumber: self.partString, shelf: self.totalShelf, quantity: self.currentQuantity, completion: {
            self.partString = self.topView.prefixField.text!
            self.topView.sendPartButton.setTitle(self.topView.prefixField.text, for: .normal)
            self.topView.sizeOneField.text = ""
            self.topView.sizeTwoField.text = ""
            self.topView.sizeSelectOne.reloadData()
            self.topView.sizeSelectTwo.reloadData()
        })
    }
}
