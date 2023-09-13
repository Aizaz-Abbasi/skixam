//
//  Planning3VC.swift
//  skixam
//
//  Created by Usman Ramzan on 11/09/2023.
//

import UIKit

class Planning3VC: UIViewController {

// MARK: -       Outlets: -
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    @IBOutlet weak var viewBGCheckWeatherForcast: UIView!
    @IBOutlet weak var viewBGContinue: UIView!
    
    @IBOutlet weak var lblContinue: UILabel!
    @IBOutlet weak var lblBeCareful: UILabel!
    @IBOutlet weak var lblCheckTheWeatherAndTrailConditions: UILabel!
    @IBOutlet weak var lblCheckWeatherForecast: UILabel!
    
    
    
    
// MARK: -       ViewDidLoad: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

     setBorderWidthAndConrerRadius()
        tapGestures()
    }
    
// MARK: -       set Corner Radius & Border Width: -
    
    func setBorderWidthAndConrerRadius(){
        viewBGCheckWeatherForcast.layer.cornerRadius = 10
        viewBGContinue.layer.cornerRadius = 10
    }
    
    
// MARK: -       tap Gestures: -
    
    func tapGestures(){
        
//        let tgContinue = UITapGestureRecognizer(target: self, action: #selector(<#T##@objc method#>))
//        viewBGContinue.isUserInteractionEnabled = true
//        viewBGContinue.addGestureRecognizer(tgContinue)
        
    }
    
    
// MARK: -       Custom Functions: -
    
   
}
