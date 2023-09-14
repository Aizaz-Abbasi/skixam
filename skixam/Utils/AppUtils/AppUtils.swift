//
//  AppUtils.swift
//  skixam
//  Created by Usman Ramzan on 11/09/2023.
//

import Foundation
import UIKit

let CUSTOM_ERROR_DOMAIN = "CUSTOM_ERROR_DOMAIN"
let CUSTOM_ERROR_USER_INFO_KEY = "CUSTOM_ERROR_USER_INFO_KEY"


func validateEmail(_ email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: email)
}

func IS_INTERNET_AVAILABLE() -> Bool{
    return AIReachabilityManager.sharedManager.isInternetAvailableForAllNetworks()
}

func SHOW_INTERNET_ALERT(){
//    HIDE_CUSTOM_LOADER()
    HIDE_NETWORK_ACTIVITY_INDICATOR()
    
    displayAlertWithTitle(APP_NAME, andMessage: "Please check your internet connection and try again.", buttons: ["Dismiss"], completion: nil)
}

// MARK: - ALERT
func displayAlertWithMessage(_ message:String) -> Void {
    
    displayAlertWithTitle(APP_NAME, andMessage: message, buttons: ["OK"], completion: nil)
}


func displayAlertWithMessageFromVC(_ vc:UIViewController, message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void {
    
    let alertController = UIAlertController(title: APP_NAME, message: message, preferredStyle: .alert)
    
    for index in 0..<buttons.count    {
        
        alertController.setValue(NSAttributedString(string: APP_NAME, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alertController.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),NSAttributedString.Key.foregroundColor :  UIColor.black]), forKey: "attributedMessage")
        
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        action.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(action)
    }
    
    vc.present(alertController, animated: true, completion: nil)
}

func displayAlertWithTitle(_ title:String, andMessage message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    for index in 0..<buttons.count    {
        
        alertController.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor :  UIColor.black]), forKey: "attributedTitle")
        
        alertController.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedMessage")
        
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        action.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(action)
    }
    UIApplication.shared.delegate!.window!?.rootViewController!.present(alertController, animated: true, completion:nil)
}


func displayAlertWithTitle(_ vc:UIViewController, title:String, andMessage message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    for index in 0..<buttons.count    {
        
        alertController.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
//
//        alertController.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColorNSAttributedString.Key.foregroundColor : APP_HEADER_TEXT_COLOR]), forKey: "attributedTitle")
        alertController.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedTitle")
        
        alertController.setValue(NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]), forKey: "attributedMessage")
        
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        action.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(action)
    }
    vc.present(alertController, animated: true, completion: nil)
}


func SHOW_NETWORK_ACTIVITY_INDICATOR(){
    UIApplication.shared.isNetworkActivityIndicatorVisible =  true
}

func HIDE_NETWORK_ACTIVITY_INDICATOR(){
    UIApplication.shared.isNetworkActivityIndicatorVisible =  false
}
