//
//  API.swift
//  skixam
//
//  Created by Asad Alvi on 14/09/2023.
//

import Foundation

class API {
    
    static let shared = API()
    
    private static let baseURL = "https://skixam.itechdoor.com/api/"
    
    static var register: String {
        return baseURL + "register"
    }
    
    static var login: String {
        return baseURL + "login"
    }
    
    static var logout: String {
        return baseURL + "logout"
    }
    
    private init() {}
    
    func getUrl(_ urlEndPoint : String) -> String {
        return API.baseURL + urlEndPoint
    }
}







