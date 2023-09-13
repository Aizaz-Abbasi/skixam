//
//  MechanicalLiftsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 07/09/2023.
//

import UIKit

class MechanicalLiftsVC: UIViewController {

// MARK: -     Outlets: -
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var cmdContinue: UIView!
    
    @IBOutlet weak var lblMechanicalLifts: UILabel!
    @IBOutlet weak var lblUnderConstruction: UILabel!

    @IBOutlet weak var lblKContinue: UILabel!
    
    
    // MARK: -     ViewDidLoad: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setCornerRadius()
        tapGestures()
    }
    
    
    
// MARK: -     set Corner Radius: -
    
    func setCornerRadius(){
        cmdContinue.layer.cornerRadius = 10
    }
    
    
// MARK: -       tap Gestures: -
    
    func tapGestures(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        tgBack.view?.isUserInteractionEnabled = true
        tgBack.view?.addGestureRecognizer(tgBack)
        
        let tgGotoAccidents = UITapGestureRecognizer(target: self, action: #selector(gotoAccidents))
        cmdContinue.isUserInteractionEnabled = true
        cmdContinue.addGestureRecognizer(tgGotoAccidents)
    }
    

// MARK: -       Custom Functions: -
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoAccidents(){
        self.performSegue(withIdentifier: SMacros.kSegueAccidents, sender: self)
        print("Button got pressed !!")
    }

   

}
