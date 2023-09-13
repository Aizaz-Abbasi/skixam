//
//  LesEssentielsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class TheEssentialsVC: UIViewController {
    
    // MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var cmdContinue: UIView!
    
    @IBOutlet weak var viewBGEmail: UIView!
    @IBOutlet weak var viewBGPassword: UIView!
    
    @IBOutlet weak var lblHelloPaulVictor: UILabel!
    @IBOutlet weak var lblTodaysWeather: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    
    @IBOutlet weak var lblKContinue: UILabel!
    
    
    
    // MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
    
    
    
    // MARK: -     Custom Functions:-
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoApparelEssentials(){
        performSegue(withIdentifier: SMacros.kSegueApparelEssentials, sender: self)
    }
    
    
}
