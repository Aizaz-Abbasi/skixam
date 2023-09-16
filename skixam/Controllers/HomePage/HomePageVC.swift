//
//  HomePageVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class HomePageVC: UIViewController {

    
// MARK: -     Outlets:-
    
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    @IBOutlet weak var viewBGTheEssentials: UIView!
    @IBOutlet weak var viewBGMechanicalLifts: UIView!
    @IBOutlet weak var viewBGTheTrail: UIView!
    @IBOutlet weak var viewBGAccidents: UIView!
    @IBOutlet weak var viewBGRapidTest: UIView!
    
    
    @IBOutlet weak var txtKTheEssentials: UILabel!
    @IBOutlet weak var txtKMechanicalLifts: UILabel!
    @IBOutlet weak var txtKTheTrail: UILabel!
    @IBOutlet weak var txtKAccidents: UILabel!
    @IBOutlet weak var txtKRapidTest: UILabel!
    @IBOutlet weak var txtKActivities: UILabel!
    
    @IBOutlet weak var viewBGActivities: UIView!
    
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()

      cornerRadius()
      tapGestures()
    }

    
// MARK: -     Corner Radius:-

    func cornerRadius(){
        viewBGTheEssentials.layer.cornerRadius = 10
        viewBGMechanicalLifts.layer.cornerRadius = 10
        viewBGTheTrail.layer.cornerRadius = 10
        viewBGAccidents.layer.cornerRadius = 10
        viewBGRapidTest.layer.cornerRadius = 10
        viewBGActivities.layer.cornerRadius = 10
        
    }
    
    
// MARK: -     Tap Gestures:-
    
    func tapGestures(){
        
        let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
        cmdBack.isUserInteractionEnabled = true
        cmdBack.addGestureRecognizer(tgBack)
        
        let tgActivities = UITapGestureRecognizer(target: self, action: #selector(gotoTheEssentials))
        viewBGActivities.isUserInteractionEnabled = true
        viewBGActivities.addGestureRecognizer(tgActivities)
        
    }
    
    
// MARK: -     Custom Functions:-
    
    @objc func gotoBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoTheEssentials(){
        performSegue(withIdentifier: "segueTheEssentials", sender: self)
    }
}
