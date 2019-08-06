//
//  InventoryRoutes.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class InvRoutes{
    static func getPartsOnShelf(shelf: String, completion: @escaping ([Part]) -> Void){
        let url = URL(string: shelfUrl + "/" + shelf + "/parts")!
        
        let request = RouteUtils.basicGetRequest(url: url)
        
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                print(jsonObject)
                var partsArray = [Part]()
                var index = 0
                for _ in jsonObject["parts"]{
                    let shelfName = jsonObject["parts"][index]["shelf"].string!
                    let partNumber = jsonObject["parts"][index]["partNumber"].string!
                    let quantity = jsonObject["parts"][index]["quantity"].int!
                    
                    let newPart = Part(partNumber: partNumber, shelf: shelfName, quantity: quantity)
                    
                    partsArray.append(newPart)
                    index += 1
                }
                
                completion(partsArray)
            case .failure(_):
                print("Couldn't send getPartsOnShelf route.")
            }
        })
    }
    
    static func getAllShelves(completion: @escaping () -> Void){
        let url = URL(string: shelfUrl)!
        
        let request = RouteUtils.basicGetRequest(url: url)
        
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                var index = 0
                for _ in jsonObject["shelves"]{
                    let shelfName = jsonObject["shelves"][index]["name"].string!
                    
                    Warehouse.shelves[shelfName] = []
                    Warehouse.orderedShelvesList.append(shelfName)
                    index += 1
                }
                print(Warehouse.orderedShelvesList.count)
                completion()
            case .failure(_):
                print("Couldn't send getAllShelves route.")
            }
        })
    }
    
    static func getShelves(shelf: String, completion: @escaping ([String]) -> Void){
        let url = URL(string: shelfUrl + "/" + shelf)!
        
        let request = RouteUtils.basicGetRequest(url: url)
        
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                print(jsonObject)
                var returnArray = [String]()
                var index = 0
                for _ in jsonObject["shelves"]{
                    returnArray.append(jsonObject["shelves"][index]["name"].string!)
                    index += 1
                }
                
                completion(returnArray)
            case .failure(_):
                print("Couldn't send getShelves route.")
            }
        })
    }
    
    static func getAllParts(completion: @escaping () -> Void){
        let url = URL(string: partUrl)!
        
        let request = RouteUtils.basicGetRequest(url: url)
        
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                var index = 0
                for _ in jsonObject["parts"]{
                    let shelfName = jsonObject["parts"][index]["shelf"].string!
                    let partNumber = jsonObject["parts"][index]["partNumber"].string!
                    let quantity = jsonObject["parts"][index]["quantity"].int!
                    
                    let newPart = Part(partNumber: partNumber, shelf: shelfName, quantity: quantity)
                    
                    Warehouse.shelves[shelfName]?.append(newPart)
                    index += 1
                }
                
                completion()
            case .failure(_):
                print("Couldn't send getAllShelves route.")
            }
        })
    }
    
    static func addShelf(shelfName: String, completion: @escaping () -> Void){
        let url = URL(string: shelfAddUrl)!
        
        var requestJson = [String:Any]()
        requestJson["name"] = shelfName
        
        do {
            let data = try JSONSerialization.data(withJSONObject: requestJson, options: [])
            let request = RouteUtils.basicPostRequest(url: url, data: data)
            
            Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
                switch response.result{
                case .success(let Json):
                    let jsonObject = JSON(Json)
                    print(jsonObject)
                    completion()
                case .failure(_):
                    print("Couldn't send addShelf route.")
                }
            })
        }catch{
            
        }
    }
    
    static func addPart(partNumber: String, shelf: String, quantity: Int, completion: @escaping () -> Void){
        let url = URL(string: partAddUrl)!
        
        var requestJson = [String:Any]()
        requestJson["partNumber"] = partNumber
        requestJson["shelf"] = shelf
        requestJson["quantity"] = quantity
        
        do {
            let data = try JSONSerialization.data(withJSONObject: requestJson, options: [])
            let request = RouteUtils.basicPostRequest(url: url, data: data)
            
            Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
                switch response.result{
                case .success(let Json):
                    let jsonObject = JSON(Json)
                    print(jsonObject)
                    completion()
                case .failure(_):
                    print("Couldn't send addPart route.")
                }
            })
        }catch{
            
        }
    }
    
    static func getPart(partNumber: String, completion: @escaping (Part) -> Void){
        let urlString = partUrl + "/" + partNumber
        let encUrlString = urlString.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        let url = URL(string: encUrlString)
        
        let request = RouteUtils.basicGetRequest(url: url!)
        
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                print(jsonObject)
                
                let returnPart = Part(partNumber: "b", shelf: "b", quantity: 9)
                completion(returnPart)
            case .failure(_):
                print("Couldn't send getPart route.")
            }
        })
    }
    
    static func deletePart(partNumber: String, shelf: String,completion: @escaping (Part) -> Void){
        let urlString = shelfUrl + "/" + shelf + "/parts/" + partNumber
        let encUrlString = urlString.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        let url = URL(string: encUrlString)
        
        let request = RouteUtils.basicDeleteRequest(url: url!)
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                print(jsonObject)
                
                let returnPart = Part(partNumber: jsonObject["part"]["partNumber"].string,
                                      shelf: jsonObject["part"]["shelf"].string,
                                      quantity: 0)
                completion(returnPart)
            case .failure(_):
                print("Couldn't send deletePart route.")
            }
        })
    }
    
    static func deleteShelfParts(shelf: String,completion: @escaping () -> Void){
        let urlString = shelfUrl + "/" + shelf + "/parts"
        let url = URL(string: urlString)
        
        let request = RouteUtils.basicDeleteRequest(url: url!)
        Alamofire.request(request).responseJSON(completionHandler: { response -> Void in
            switch response.result{
            case .success(let Json):
                let jsonObject = JSON(Json)
                print(jsonObject)
                
                completion()
            case .failure(_):
                print("Couldn't send deletePart route.")
            }
        })
    }
}
