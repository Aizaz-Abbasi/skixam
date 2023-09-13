//
//  AparellEssentialsResultsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class ApparelEssentialsResultsVC: UIViewController {

    
// MARK: -     Outlets:-
    
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var viewBGLock: UIView!

    @IBOutlet weak var viewBGContinue: UIView!
    

    
    
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setCornerRadius()
       tapGestures()
    }
    
    
    
// MARK: -     set Corner Radius:-
    
    func setCornerRadius(){
        
        viewBGContinue.layer.cornerRadius = 10
        viewBGLock.layer.cornerRadius = 4
        
    }
    
    

// MARK: -     Tap Gestures:-
            
            func tapGestures(){
                
                let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
                cmdBack.isUserInteractionEnabled = true
                cmdBack.addGestureRecognizer(tgBack)
                
                let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoBackPackEssentials))
                viewBGContinue.isUserInteractionEnabled = true
                viewBGContinue.addGestureRecognizer(tgContinue)
            }
            
            
            
// MARK: -     Custom Functions:-
            
            @objc func gotoBack(){
                self.navigationController?.popViewController(animated: true)
            }
            
            @objc func gotoBackPackEssentials(){
                performSegue(withIdentifier: SMacros.kSegueBackPackEssentials, sender: self)
            }


        
       
   

}
