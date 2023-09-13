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
    
    @IBOutlet weak var viewBGName: UIView!
    @IBOutlet weak var viewBGDateOfBirth: UIView!
    @IBOutlet weak var viewBGCoreBusiness: UIView!
    @IBOutlet weak var viewBGLevel: UIView!
    @IBOutlet weak var viewBGEmail: UIView!
    @IBOutlet weak var viewBGPassword: UIView!
    @IBOutlet weak var cmdContinue: UIView!
    
    @IBOutlet weak var lblKWelcomeToSkixam: UILabel!
    @IBOutlet weak var lblKLetsGoItWontTakeLong: UILabel!
    @IBOutlet weak var lblKContinue: UILabel!
    @IBOutlet weak var lblBusiness: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDateOfBirth: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    
    // MARK: -       ViewDidLoad: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtName.delegate = self
        txtDateOfBirth.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        txtPassword.isSecureTextEntry = true
        
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
