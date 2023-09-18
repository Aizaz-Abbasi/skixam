//
//  NewProfileVC.swift
//  skixam
//
//  Created by Usman Ramzan on 29/08/2023.
//

import UIKit

class NewProfileVC: UIViewController, UITextFieldDelegate {
    
    // MARK: -       Outlets: -
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var cmdContinue: UIView!
    
    @IBOutlet weak var lblKWelcomeToSkixam: UILabel!
    @IBOutlet weak var lblKLetsGoItWontTakeLong: UILabel!
    
    @IBOutlet weak var viewBGName: UIView!
    @IBOutlet weak var viewBGDateOfBirth: UIView!
    @IBOutlet weak var viewBGCoreBusiness: UIView!
    @IBOutlet weak var viewBGLevel: UIView!
    @IBOutlet weak var viewBGEmail: UIView!
    @IBOutlet weak var viewBGPassword: UIView!
    
    @IBOutlet weak var lblKContinue: UILabel!
    @IBOutlet weak var lblBusiness: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    // START Expanding Core Business
    @IBOutlet weak var viewBGExpandCoreBusiness: UIView!
    @IBOutlet weak var viewBGSelectionCoreBusiness: UIView!
    @IBOutlet weak var viewBGSki: UIView!
    @IBOutlet weak var viewBGSnowboard: UIView!
    @IBOutlet weak var viewBGSkiNordique: UIView!
    @IBOutlet weak var viewBGParaglidingFlight: UIView!
    
    @IBOutlet weak var lblSelectionCoreBusiness: UILabel!
    @IBOutlet weak var lblSki: UILabel!
    @IBOutlet weak var lblSnowboard: UILabel!
    @IBOutlet weak var lblSkiNordique: UILabel!
    @IBOutlet weak var lblParaglidingFlight: UILabel!
    // END Expanding Core Business

    
    
    
    
    // MARK: -       ViewDidLoad: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtName.delegate = self
        txtDateOfBirth.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        txtPassword.isSecureTextEntry = true
        
        viewBGExpandCoreBusiness.isHidden = true
        
        setCornerRadius()
        tapGestures()
    }
    
    
    // MARK: -       set Corner Radius: -
    
    func setCornerRadius() {
        
        viewBGName.layer.borderWidth = 2
        viewBGName.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGName.layer.cornerRadius = 10
        
        viewBGDateOfBirth.layer.borderWidth = 2
        viewBGDateOfBirth.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGDateOfBirth.layer.cornerRadius = 10
        
        viewBGCoreBusiness.layer.borderWidth = 2
        viewBGCoreBusiness.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGCoreBusiness.layer.cornerRadius = 10
        
        viewBGExpandCoreBusiness.layer.borderWidth = 2
        viewBGExpandCoreBusiness.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGExpandCoreBusiness.layer.cornerRadius = 10
        
        viewBGLevel.layer.borderWidth = 2
        viewBGLevel.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGLevel.layer.cornerRadius = 10
        
        viewBGEmail.layer.borderWidth = 2
        viewBGEmail.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGEmail.layer.cornerRadius = 10
        
        viewBGPassword.layer.borderWidth = 2
        viewBGPassword.layer.borderColor = UIColor(hex: "#012CB1").cgColor
        viewBGPassword.layer.cornerRadius = 10
        
        cmdContinue.layer.cornerRadius = 10
        
    }
    
    // MARK: -      tap Gestures: -
    
    func tapGestures(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        cmdBack.isUserInteractionEnabled = true
        cmdBack.addGestureRecognizer(tgBack)
        
        let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoModules))
        cmdContinue.isUserInteractionEnabled = true
        cmdContinue.addGestureRecognizer(tgContinue)
        
        let tgHideKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tgHideKeyboard)
        
        let tgShowCoreBusiness = UITapGestureRecognizer(target: self, action: #selector(ExpandCoreBusiness))
        viewBGCoreBusiness.isUserInteractionEnabled = true
        viewBGCoreBusiness.addGestureRecognizer(tgShowCoreBusiness)
        
        let tgSelectSki = UITapGestureRecognizer(target: self, action: #selector(SelectSki))
        viewBGSki.isUserInteractionEnabled = true
        viewBGSki.addGestureRecognizer(tgSelectSki)
        
    }
    
    
    
    // MARK: -       Custom Functions: -
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func hideKeyboard(){
        txtName.resignFirstResponder()
        txtDateOfBirth.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    @objc func ExpandCoreBusiness(){
        viewBGExpandCoreBusiness.isHidden = false
    }
    
    @objc func SelectSki(){
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        txtName.resignFirstResponder()
        txtDateOfBirth.resignFirstResponder()
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        
        return true
    }
    
    @objc func gotoModules(){
        
        
        if txtName.text?.isEmpty == true {
            self.displayAlert(withTitle: "Error", andMessage: "Please enter your name")
        }else if txtEmail.text?.isEmpty == true{
            self.displayAlert(withTitle: "Error", andMessage: "Please enter valid email")
        }else if !validateEmail(txtEmail.text!) {
            self.displayAlert(withTitle: "Error", andMessage: "please enter a valid email")
        }else if txtPassword.text?.isEmpty == true{
            self.displayAlert(withTitle: "Error", andMessage: "Please enter your password")
        }
        register()
    }
    
    
    func register(){
 
        
        let loginParameters = ["first_name": "hdcvksd2222", "last_name": "sdfsd1122","email":"test1122@gmail.com","phone":"3629083023",  "address":"jhsdhf233"]
        
        AIServiceManager.sharedManager.callPostApi(API.register, responseType: RegisterResponse.self, parameters: loginParameters) { response in
            switch response {
                
            case .success(let user):
                print("response",response)
                print("user Login", user)
                HIDE_CUSTOM_LOADER()
               // self.performSegue(withIdentifier: "segueHomePage", sender: self)
                break
                // Handle user object
            case .failure(let error):
                print("ERROR: Login",error)
                break
                // Handle error
            }
        }
        
        
    }

    
    
    func displayAlert(withTitle title: String, andMessage msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Okay", style: .default) { (action) in
            // Handle the user's response if needed
        }
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
