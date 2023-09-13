//
//  ThePiste1VC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class ThePiste1VC: UIViewController {


// MARK: -    Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var viewBGLock: UIView!
    
    @IBOutlet weak var viewBGContinue: UIView!
    
    @IBOutlet weak var viewBGOverlayBox: UIView!
    
    @IBOutlet weak var viewBGOverlayContinue: UIView!
    
    @IBOutlet weak var viewBGGradientEffect: UIView!
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewBGOverlayBox.isHidden = true
        viewBGGradientEffect.isHidden = true
        
        setCornerRadius()
        tapGestures()
    }
    
    
// MARK: -     set Corner Radius:-
    
    func setCornerRadius(){
        viewBGLock.layer.cornerRadius = 4
        viewBGContinue.layer.cornerRadius = 10
        
        viewBGOverlayBox.layer.cornerRadius = 4
        viewBGOverlayContinue.layer.cornerRadius = 4
        
    }
    
    
    
// MARK: -     Tap Gestures:-
                
                func tapGestures(){
                    
                    let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
                    cmdBack.isUserInteractionEnabled = true
                    cmdBack.addGestureRecognizer(tgBack)
                    
                    let tgContinue = UITapGestureRecognizer(target: self, action: #selector(showOverlay))
                    viewBGContinue.isUserInteractionEnabled = true
                    viewBGContinue.addGestureRecognizer(tgContinue)
                    
                    let tgOverlayContinue = UITapGestureRecognizer(target: self, action: #selector(gotoQuickTest2))
                    viewBGOverlayContinue.isUserInteractionEnabled = true
                    viewBGOverlayContinue.addGestureRecognizer(tgOverlayContinue)
                }
                
                
                
// MARK: -     Custom Functions:-
                
                @objc func gotoBack(){
                    self.navigationController?.popViewController(animated: true)
                }
                
                @objc func showOverlay(){
                    viewBGOverlayBox.isHidden = false
                    viewBGGradientEffect.isHidden = false
                    
                    
                }
    
                @objc func gotoQuickTest2(){
                    viewBGOverlayBox.isHidden = true
                    viewBGGradientEffect.isHidden = true
                    performSegue(withIdentifier: SMacros.kSegueQuickTest2, sender: self)
                    
                }


}
