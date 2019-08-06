//
//  MainMenuVC.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController, UITextFieldDelegate {
    
    var shelfField: IQField!
    
    var partNumberField: IQField!
    var partShelfField: IQField!
    var partSuffixField: IQField!
    
    var sendShelfButton: UIButton!
    var sendPartButton: UIButton!
    var shelfViewButton: UIButton!
    
    var alphabetList = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
    var alphabetIndex = 0
    var nextShelf = ""
    
    var quantity = 1
    
    var topView: MainMenuView!
    
    var numKeyArray: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        topView = MainMenuView(frame: self.view.frame)
        
        self.view.addSubview(topView)
        
        topView.sendShelfField.delegate = self
        
        topView.partNumberPrefixField.delegate = self
        topView.partNumberField.delegate = self
        topView.partShelfField.delegate = self
        topView.partSuffixField.delegate = self

        let tap = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        tap.delegate = self
        topView.addGestureRecognizer(tap)
        
        topView.sendShelfButton.addTarget(self, action: #selector(sendShelf), for: .touchUpInside)
        topView.sendPartButton.addTarget(self, action: #selector(sendPart), for: .touchUpInside)
        topView.sendNextShelfButton.addTarget(self, action: #selector(sendNextShelf), for: .touchUpInside)
        topView.shelfViewButton.addTarget(self, action: #selector(shelfViewButtonPressed), for: .touchUpInside)
        topView.clearButton.addTarget(self, action: #selector(clearButtonPressed), for: .touchUpInside)
        topView.addPartsButton.addTarget(self, action: #selector(toPartsAdd), for: .touchUpInside)
        
        topView.zeroButton.addTarget(self, action: #selector(zeroButtonPressed), for: .touchUpInside)
        topView.oneButton.addTarget(self, action: #selector(oneButtonPressed), for: .touchUpInside)
        topView.dashButton.addTarget(self, action: #selector(dashKeyPressed(sender:)), for: .touchUpInside)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.topView.clearButton.isHidden = true
        
        if textField == self.topView.partNumberPrefixField{
            self.openNumPad()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.topView.clearButton.isHidden = false
        if textField == self.topView.partNumberPrefixField{
            self.closeNumPad()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .default{
            self.nextShelf = topView.sendShelfField.text! + "-" + alphabetList[alphabetIndex]
            let nextString = "Next: " + self.nextShelf
            topView.sendNextShelfButton.setTitle(nextString, for: .normal)
        }else{
            
        }
        
        textField.resignFirstResponder()
        self.topView.clearButton.isHidden = false
        return true
    }
}

// MARK: UIGestureRecognizer Ext.
extension MainMenuVC: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

extension MainMenuVC{
    
    func openNumPad(){
        let numbers = [1,2,3,4,5,6,7,8,9,0]
        
        let firstFiveNumbers = [1,2,3,4,5]
        let secondFiveNumbers = [6,7,8,9,0]
        topView.numPadHeightConstraint?.constant = 70
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
        
        let buttonWidth = CGFloat(36)
        let screenWidth = UIScreen.main.bounds.width
        
        let extraSpace = CGFloat(screenWidth - (10*buttonWidth))
        let spacingConstant = CGFloat(extraSpace/11)
        
        numKeyArray = [UIButton]()
        var lastButton: UIButton = UIButton()
        for number in numbers {
            let button = UIButton(type: .system)
            button.setTitle(String(number), for: .normal)
            
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            
            button.layer.cornerRadius = buttonWidth/2
            button.translatesAutoresizingMaskIntoConstraints = false
            
            self.topView.numPadView.addSubview(button)
            
            button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            button.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            
            button.topAnchor.constraint(equalTo: self.topView.numPadView.topAnchor, constant: 5).isActive = true
            if number == 1{
                lastButton = button
                button.leftAnchor.constraint(equalTo: self.topView.numPadView.leftAnchor, constant: spacingConstant).isActive = true
            }else{
                button.leftAnchor.constraint(equalTo: lastButton.rightAnchor, constant: spacingConstant).isActive = true
            }
            button.addTarget(self, action: #selector(numKeyPressed(sender:)), for: .touchUpInside)
            numKeyArray.append(button)
            lastButton = button
        }
    }
    
    func closeNumPad(){
        topView.numPadHeightConstraint?.constant = 0
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            for button in self.numKeyArray{
                button.alpha = 0
            }
        }, completion: {_ in
            for button in self.numKeyArray{
                button.removeFromSuperview()
            }
        })
        
        
    }
    
    @objc func numKeyPressed(sender: UIButton){
        self.topView.partNumberPrefixField.text! += sender.titleLabel!.text!
    }
    
    @objc func dashKeyPressed(sender: UIButton){
        self.topView.partNumberPrefixField.text! += "-"
    }
    
    @objc func screenTapped(){
        self.view.endEditing(true)
    }
    
    @objc func sendShelf(){
        InvRoutes.addShelf(shelfName: self.topView.partShelfField.text!, completion: {
            self.view.endEditing(true)
            self.topView.partShelfField.text = ""
        })
    }
    
    @objc func sendPart(){
        self.topView.sendPartButton.isEnabled = false
        UIView.animate(withDuration: 0.1, animations: {
            self.topView.sendPartButton.backgroundColor = Colors.nebulaFlame
        })
        
        var partNumber = self.topView.partNumberPrefixField.text! + self.topView.partNumberField.text!
        
        if let text = self.topView.partSuffixField.text, !text.isEmpty{
            partNumber += text
        }
        
        InvRoutes.addPart(partNumber: partNumber, shelf: self.topView.partShelfField.text!, quantity: self.quantity, completion: {
            self.topView.partNumberField.text = ""
            
            UIView.animate(withDuration: 0.13, animations: {
                self.topView.sendPartButton.backgroundColor = UIColor.clear
            }, completion: {_ in
                self.topView.sendPartButton.isEnabled = true
            })
        })
    }
    
    @objc func sendNextShelf(){
        InvRoutes.addShelf(shelfName: self.nextShelf, completion: {
            self.alphabetIndex += 1
            self.nextShelf = self.topView.sendShelfField.text! + "-" + self.alphabetList[self.alphabetIndex]
            self.topView.sendNextShelfButton.setTitle("Next: " + self.nextShelf, for: .normal)
        })
    }
    
    @objc func shelfViewButtonPressed(){
        let shelfView = TierOneVC()
        self.navigationController?.pushViewController(shelfView, animated: true)
    }
    
    @objc func clearButtonPressed(){
        self.topView.sendShelfField.text = ""
        
        self.alphabetIndex = 0
        
        self.nextShelf = ""
        self.topView.sendNextShelfButton.setTitle("Next: ", for: .normal)
        
        self.topView.partNumberField.text = ""
        self.topView.partSuffixField.text = ""
        self.topView.partShelfField.text = ""
    }
    
    @objc func toPartsAdd(){
        let partVC = SendPartVC()
        self.navigationController?.pushViewController(partVC, animated: true)
    }
    
    @objc func zeroButtonPressed(){
        self.quantity = 0
        self.topView.zeroButton.backgroundColor = Colors.nebulaGreen
        self.topView.oneButton.backgroundColor = UIColor.clear
    }
    
    @objc func oneButtonPressed(){
        self.quantity = 1
        self.topView.oneButton.backgroundColor = Colors.nebulaGreen
        self.topView.zeroButton.backgroundColor = UIColor.clear
    }
}
