//
//  Routes.swift
//  KR Inventory
//
//  Created by Shelby McCowan on 6/18/19.
//  Copyright © 2019 Shelby McCowan. All rights reserved.
//

import Foundation

let baseUrl = "http://159.89.152.215:3000/kr/inv/"

let shelfUrl = baseUrl + "shelves"
let partUrl = baseUrl + "parts"

let shelfAddUrl = shelfUrl + "/add"
let partAddUrl = partUrl + "/add"

class RouteUtils {
    static func basicPostRequest(url: URL, data: Data) -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    static func basicGetRequest(url: URL) -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    static func basicDeleteRequest(url: URL) -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
}
