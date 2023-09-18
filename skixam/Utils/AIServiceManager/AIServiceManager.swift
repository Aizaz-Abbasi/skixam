//
//  AIServiceManager.swift
//  Swift3CodeStucture
//
//  Created by Ravi Alagiya on 11/24/16.
//  Copyright © 2016 agilepc-100. All rights reserved.
//

import Alamofire
import UIKit


class AIServiceManager: NSObject {
    
    static let sharedManager : AIServiceManager = {
        let instance = AIServiceManager()
        return instance
    }()
    
    // MARK: - ERROR HANDLING
    
    func handleError(_ errorToHandle : NSError){
        
        if(errorToHandle.domain == CUSTOM_ERROR_DOMAIN)	{
            //let dict = errorToHandle.userInfo as NSDictionary
            displayAlertWithTitle(APP_NAME, andMessage:"Something went wrong.", buttons: ["Dismiss"], completion: nil)
            
        }else if(errorToHandle.code == -1009){
            
            displayAlertWithTitle(APP_NAME, andMessage: "Please check your internet connection and try again.", buttons: ["Dismiss"], completion: nil)
        }else{
            if(errorToHandle.code == -999){
                return
            }
            displayAlertWithTitle(APP_NAME, andMessage:errorToHandle.localizedDescription, buttons: ["Dismiss"], completion:nil)
        }
    }
    
    
    // MARK: - ************* COMMON API METHOD **************
    // GET
    
    func callGetApi<T: Decodable>(_ url: String, responseType: T.Type, completionHandler: @escaping (AFResult<T>) -> ()) {
        if IS_INTERNET_AVAILABLE() {
            SHOW_CUSTOM_LOADER()
            AF.request(url, method: .get, parameters: nil)
                .responseDecodable(of: T.self, completionHandler: { response in
                    completionHandler(response.result)
                })
        } else {
            SHOW_INTERNET_ALERT()
        }
    }
    
    
//    func callPostApi<T: Decodable>(_ url: String, responseType: T.Type, parameters: [String: Any], completionHandler: @escaping (AFResult<T>) -> ()) {
//         if IS_INTERNET_AVAILABLE() {
//             SHOW_CUSTOM_LOADER()
//             AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
//                 .responseDecodable(of: T.self, completionHandler: { response in
//
//
//                     do {
//                         let decodedResponse = try JSONDecoder().decode(RegisterResponse.self, from: response.data ?? Data())
//                         print("decodedResponse decoding response: \(decodedResponse)")
//                         // Handle successful decoding
//                     } catch {
//                         print("Error decoding response: \(error)")
//                     }
//
//
//                     do {
//                         print("data1",String(data: response.data ?? Data(), encoding: .utf8) ?? "No data")
//                         print("response reg",response.result)
//                         let decodedResponse = try response.result.get()
//                         completionHandler(.success(decodedResponse))
//                     } catch {
//                         print("response error",error)
//                         completionHandler(.failure(error as! AFError))
//                     }
//                 })
//         } else {
//             SHOW_INTERNET_ALERT()
//         }
//     }

    
    func callPostApi<T: Decodable>(_ url: String, responseType: T.Type, parameters: [String: Any], completionHandler: @escaping (AFResult<T>) -> ()) {
        if IS_INTERNET_AVAILABLE() {
            SHOW_CUSTOM_LOADER()
            
            // Define custom headers
            let headers: HTTPHeaders = [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
            
            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                .responseDecodable(of: T.self, completionHandler: { response in
                    completionHandler(response.result)
                })
        } else {
            SHOW_INTERNET_ALERT()
        }
    }

    
    
//    func callPostApi<T: Decodable>(_ url: String, responseType: T.Type, parameters: [String: Any], completionHandler: @escaping (AFResult<T>) -> ()) {
//        if IS_INTERNET_AVAILABLE() {
//            SHOW_CUSTOM_LOADER()
//            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
//                .responseDecodable(of: T.self, completionHandler: { response in
//                    completionHandler(response.result)
//                })
//        } else {
//            SHOW_INTERNET_ALERT()
//        }
//    }
    

    
    func uploadImageWithParams(_ url: String, image: UIImage, parameters: [String: Any], completionHandler: @escaping (AFResult<Data>) -> ()) {
        if IS_INTERNET_AVAILABLE() {
            SHOW_CUSTOM_LOADER()
            AF.upload(
                multipartFormData: { multipartFormData in
                    // Convert UIImage to Data
                    if let imageData = image.jpegData(compressionQuality: 0.5) {
                        multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
                    }
                    
                    // Append other parameters
                    for (key, value) in parameters {
                        if let valueData = (value as? String)?.data(using: .utf8) {
                            multipartFormData.append(valueData, withName: key)
                        }
                    }
                },
                to: url)
                .responseData { response in
                    completionHandler(response.result)
                }
        } else {
            SHOW_INTERNET_ALERT()
        }
    }

    
    func callGetApiStr(_ url : String , completionHandler : @escaping (AFDataResponse<Any>) -> ())
    {
        if IS_INTERNET_AVAILABLE()
        {
            SHOW_CUSTOM_LOADER()
            AF.request(url, method:.get, parameters: nil).responseJSON(completionHandler: completionHandler)
        }else{
            SHOW_INTERNET_ALERT()
        }
    }
    
}
    

   
    
