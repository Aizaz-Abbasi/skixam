//
//  AIServiceConstants.swift
//  Swift3CodeStructure
//
//  Created by Ravi Alagiya on 25/11/2016.
//  Copyright © 2016 Ravi Alagiya. All rights reserved.
//

import Foundation

//MARK:- BASE URL

//Live URL
//let URL_BASE                            = "http://ringy.jp/"
let URL_BASE                            = "https://ringy.jp:22000/"
//Test URL
let URL_IMAGE                           = URL_BASE + "/images/chatImages/"

let URL_QR_IMAGE  = "https://ringy.jp:22000//images/";

let URL_UserRegister                    = getFullUrl("UserRegister")

//MARK:- FULL URL

func getFullUrl(_ urlEndPoint : String) -> String {
    return URL_BASE + urlEndPoint
}



//MARK:- Chat API
let URL_CHAT_BASE                            = "https://ringy.jp:22000"



let URL_Chat_login      = getChat_FullUrl("login")
let URL_Chat_register_user      = getChat_FullUrl("projects/register-user")


func getChat_FullUrl(_ urlEndPoint : String) -> String {
    return URL_CHAT_BASE + urlEndPoint
}

let CHAT_PROJECT_KEY                         = "5d4c07fb030f5d0600bf5c03"
