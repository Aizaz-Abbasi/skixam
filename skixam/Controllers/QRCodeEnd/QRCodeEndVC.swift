//
//  QRCodeEndVC.swift
//  skixam
//
//  Created by Usman Ramzan on 25/08/2023.
//

import UIKit

class QRCodeEndVC: UIViewController {

// MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    @IBOutlet weak var viewBGQRCode2: UIView!
    @IBOutlet weak var imgQRCode2: UIImageView!
    
    @IBOutlet weak var viewBGContinue: UIView!
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()

      setCornerRadius()
      tapGestures()
    }
    
    
// MARK: -     setCornerRadius:-
    
    func setCornerRadius(){
        
        viewBGQRCode2.layer.cornerRadius = 10
        viewBGContinue.layer.cornerRadius = 10
        
    }
    
    
    
    
// MARK: -     Tap Gestures:-
                
                func tapGestures(){
                    
                    let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
                    cmdBack.isUserInteractionEnabled = true
                    cmdBack.addGestureRecognizer(tgBack)
                    
                    let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoQRCodeEnd))
                    viewBGContinue.isUserInteractionEnabled = true
                    viewBGContinue.addGestureRecognizer(tgContinue)
                }
                
                
                
// MARK: -     Custom Functions:-
                
                @objc func gotoBack(){
                    self.navigationController?.popViewController(animated: true)
                }
                
                @objc func gotoQRCodeEnd(){
                    self.navigationController?.popToRootViewController(animated: true)
                }


            
   

   
}
