//
//  Login.swift
//  skixam
//
//  Created by Asad Alvi on 14/09/2023.
//

import Foundation


struct LoginResponse: Codable {
    
    let success:Bool?
    let message:String?
    let accessToken: String?
    let user: User?
    let token_type: String?
    let expires_in: Int?

    struct User: Codable {
        let first_name: String?
        let last_name: String?
        let email: String?
        let phone: String?
        let address: String?
    }
}
