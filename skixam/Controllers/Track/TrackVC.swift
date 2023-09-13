//
//  TrackVC.swift
//  skixam
//
//  Created by Usman Ramzan on 07/09/2023.


import UIKit

class TrackVC: UIViewController {

// MARK: -       Outlets: -
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    
    
// MARK: -      ViewDidLoad: -
    override func viewDidLoad() {
        super.viewDidLoad()

      tapGesture()
    }
    
// MARK: -   Tap Gesture: -
    
    func tapGesture(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        cmdBack.isUserInteractionEnabled = true
        cmdBack.addGestureRecognizer(tgBack)
        
    }
    
// MARK: -    Custom Functions: -
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }

}
