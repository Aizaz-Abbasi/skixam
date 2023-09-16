//
//  ExistingProfileVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class ExistingProfileVC: UIViewController, UITextFieldDelegate {
    
    // MARK: -     Outlets:-
    
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var cmdContinue: UIView!
    
    @IBOutlet weak var viewBGEmail: UIView!
    @IBOutlet weak var viewBGPassword: UIView!
    
    @IBOutlet weak var lblHelloPaulVictor: UILabel!
    @IBOutlet weak var lblTodaysWeather: UILabel!
    @IBOutlet weak var lblKContinue: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    

  
    
    
    
    
    // MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        addCornerRadius()
        tapGestures()
    }
    
    
    
    
    
    // MARK: -     Corner Radius:-
    
    func addCornerRadius(){
        
        viewBGEmail.layer.borderWidth = 2
        viewBGEmail.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGEmail.layer.cornerRadius = 10
        
        viewBGPassword.layer.borderWidth = 2
        viewBGPassword.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGPassword.layer.cornerRadius = 10
        
        cmdContinue.layer.cornerRadius = 10
    }
    
    
    
    
    // MARK: -     Tap Gestures:-
    
    func tapGestures(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        cmdBack.isUserInteractionEnabled = true
        cmdBack.addGestureRecognizer(tgBack)
        
        let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoApparelEssentials))
        cmdContinue.isUserInteractionEnabled = true
        cmdContinue.addGestureRecognizer(tgContinue)
        
        let tgHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tgHideKeyboard)
    }
    
    
    
    // MARK: -     Custom Functions:-
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoApparelEssentials(){
        login()
        
    }
    
    @objc func hideKeyboard(){
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()

        return true
    }
    
    
    func login(){
        
        let loginParameters = ["login": "admin@gmail.com", "password": "password"]
        
        AIServiceManager.sharedManager.callPostApi(API.login, responseType: LoginResponse.self, parameters: loginParameters) { response in
            switch response {
                
            case .success(let user):
                print("response",response)
                print("user Login", user)
                self.performSegue(withIdentifier: "segueHomePage", sender: self)
                break
                // Handle user object
            case .failure(let error):
                print("ERROR: Login",error)
                break
                // Handle error
            }
        }
    }
    
}
