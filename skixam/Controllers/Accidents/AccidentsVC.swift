//
//  AccidentsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 07/09/2023.
//

import UIKit

class AccidentsVC: UIViewController {
    
// MARK: -      Outlets: -
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    
// MARK: -      ViewDidLoad: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      tapGestures()
    }
    
// MARK: -        tap Gesutures: -
    
    
    func tapGestures(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        cmdBack.isUserInteractionEnabled = true
        cmdBack.addGestureRecognizer(tgBack)
        
        
    }

// MARK: -        Custom Functions: -
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
        printContent("Back Button Tapped !!")
    }

}
