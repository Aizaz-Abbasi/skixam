//
//  SplashScreenVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class SplashScreenVC: UIViewController {

// MARK: -    Outlets:-
    
    @IBOutlet weak var viewBGGetStarted: UIView!
    @IBOutlet weak var viewBGAlreadyHaveAnAccount: UIView!
   
    @IBOutlet weak var lblKCreateAccount: UILabel!
    @IBOutlet weak var lblKAlreadyHaveAnAccount: UILabel!
    
    
    
    
// MARK: -    ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCornerRadius()
        tapGestures()
    }
    
    
    
    
// MARK: -     Corner Radius:-
    
    func addCornerRadius(){
        
        viewBGGetStarted.layer.cornerRadius = 10
        viewBGAlreadyHaveAnAccount.layer.cornerRadius = 10
    }
    
    
// MARK: -     Tap Gestures:-

    func tapGestures(){
        
        let tgGetStarted = UITapGestureRecognizer(target: self, action: #selector(gotoHomePage))
        viewBGGetStarted.isUserInteractionEnabled = true
        viewBGGetStarted.addGestureRecognizer(tgGetStarted)
        
        let tgSignIn = UITapGestureRecognizer(target: self, action: #selector(gotoLogin))
        viewBGAlreadyHaveAnAccount.isUserInteractionEnabled = true
        viewBGAlreadyHaveAnAccount.addGestureRecognizer(tgSignIn)
        
    }
    
    
    
    
// MARK: -      Custom Functions:-
    
    @objc func gotoHomePage(){
        self.performSegue(withIdentifier: SMacros.kSegueNewProfile, sender: self)
    }
    
    @objc func gotoLogin(){
        self.performSegue(withIdentifier: SMacros.kSegueLogin, sender: self)
    }
}
