//
//  BackPackEssentialsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit

class BackPackEssentialsVC: UIViewController {

// MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    @IBOutlet weak var viewBGLock: UIView!
    @IBOutlet weak var iconMenu: UIImageView!
    
    
    @IBOutlet weak var viewBGTelephonePortableChargé: UIView!
    @IBOutlet weak var viewBGCheckBoxTelephonePortableChargé: UIView!
    
    @IBOutlet weak var viewBGEau: UIView!
    @IBOutlet weak var viewBGCheckBoxEau: UIView!
    
    @IBOutlet weak var viewBGTrousseDePremiersSecours: UIView!
    @IBOutlet weak var viewBGCheckBoxTrousseDePremiersSecours: UIView!
    
    @IBOutlet weak var viewBGChampagne: UIView!
    @IBOutlet weak var viewBGCheckBoxChampagne: UIView!
    
    @IBOutlet weak var viewBGPlanDesPistes: UIView!
    @IBOutlet weak var viewBGCheckBoxPlanDesPistes: UIView!
    
    @IBOutlet weak var viewBGAppereilPhoto: UIView!
    @IBOutlet weak var viewBGCheckBoxAppereilPhoto: UIView!
    
    @IBOutlet weak var viewBGNumérosDUrgence: UIView!
    @IBOutlet weak var viewBGCheckBoxNumérosDUrgence: UIView!
    
    @IBOutlet weak var viewBGJeuDeCarte: UIView!
    @IBOutlet weak var viewBGCheckBoxJeuDeCarte: UIView!
    
    @IBOutlet weak var viewBGBanane: UIView!
    @IBOutlet weak var viewBGCheckBoxBanane: UIView!
    
    @IBOutlet weak var viewBGBoussole: UIView!
    @IBOutlet weak var viewBGCheckBoxBoussole: UIView!
    
    @IBOutlet weak var viewBGContinue: UIView!
    
    

// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Call the function to set the border color for each outlet
        setBorderColor(for: viewBGCheckBoxTelephonePortableChargé)
        setBorderColor(for: viewBGCheckBoxEau)
        setBorderColor(for: viewBGCheckBoxTrousseDePremiersSecours)
        setBorderColor(for: viewBGCheckBoxChampagne)
        setBorderColor(for: viewBGCheckBoxPlanDesPistes)
        setBorderColor(for: viewBGCheckBoxAppereilPhoto)
        setBorderColor(for: viewBGCheckBoxNumérosDUrgence)
        setBorderColor(for: viewBGCheckBoxJeuDeCarte)
        setBorderColor(for: viewBGCheckBoxBanane)
        setBorderColor(for: viewBGCheckBoxBoussole)
        
        
        // Apply tap gestures to all viewBGCheckBox outlets
             applyTapGesture(to: viewBGCheckBoxTelephonePortableChargé)
             applyTapGesture(to: viewBGCheckBoxEau)
             applyTapGesture(to: viewBGCheckBoxTrousseDePremiersSecours)
             applyTapGesture(to: viewBGCheckBoxChampagne)
             applyTapGesture(to: viewBGCheckBoxPlanDesPistes)
             applyTapGesture(to: viewBGCheckBoxAppereilPhoto)
             applyTapGesture(to: viewBGCheckBoxNumérosDUrgence)
             applyTapGesture(to: viewBGCheckBoxJeuDeCarte)
             applyTapGesture(to: viewBGCheckBoxBanane)
             applyTapGesture(to: viewBGCheckBoxBoussole)
        

       setCornerRadius()
       tapGestures()
    }
    
    
    
// MARK: -     Corner Radius:-
    
    func setCornerRadius(){
        
        viewBGLock.layer.cornerRadius = 4
        
        viewBGTelephonePortableChargé.layer.cornerRadius = 10
        viewBGEau.layer.cornerRadius = 10
        viewBGTrousseDePremiersSecours.layer.cornerRadius = 10
        viewBGChampagne.layer.cornerRadius = 10
        viewBGPlanDesPistes.layer.cornerRadius = 10
        viewBGAppereilPhoto.layer.cornerRadius = 10
        viewBGNumérosDUrgence.layer.cornerRadius = 10
        viewBGJeuDeCarte.layer.cornerRadius = 10
        viewBGBanane.layer.cornerRadius = 10
        viewBGBoussole.layer.cornerRadius = 10
        
        viewBGCheckBoxTelephonePortableChargé.layer.cornerRadius = 4
        viewBGCheckBoxEau.layer.cornerRadius = 4
        viewBGCheckBoxTrousseDePremiersSecours.layer.cornerRadius = 4
        viewBGCheckBoxChampagne.layer.cornerRadius = 4
        viewBGCheckBoxPlanDesPistes.layer.cornerRadius = 4
        viewBGCheckBoxAppereilPhoto.layer.cornerRadius = 4
        viewBGCheckBoxNumérosDUrgence.layer.cornerRadius = 4
        viewBGCheckBoxJeuDeCarte.layer.cornerRadius = 4
        viewBGCheckBoxBanane.layer.cornerRadius = 4
        viewBGCheckBoxBoussole.layer.cornerRadius = 4
        
        viewBGContinue.layer.cornerRadius = 10
        
    }
    
    

// MARK: -     Border Color:-

        func setBorderColor(for view: UIView) {
               // Convert RGB values to CGFloat in the range 0.0 to 1.0
               let redValue: CGFloat = 159.0 / 255.0
               let greenValue: CGFloat = 240.0 / 255.0
               let blueValue: CGFloat = 255.0 / 255.0
               
               // Create UIColor using the RGB values
               let borderColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
               
               // Set the border color of the view's layer
               view.layer.borderColor = borderColor.cgColor
               view.layer.borderWidth = 1.0 // Set the desired border width
               
               // Optionally, you might want to round the corners
               view.layer.cornerRadius = 5.0 // Adjust the corner radius as needed
            
           }
    
    
    
    
// MARK: -     Custom Functions:-
        
        // Apply tap gesture to a given view
           private func applyTapGesture(to view: UIView) {
               let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
               view.addGestureRecognizer(tapGesture)
           }

           // Toggle checkmark for a tapped view
           @objc func viewTapped(_ sender: UITapGestureRecognizer) {
               if let tappedView = sender.view {
                   toggleCheckmark(for: tappedView)
               }
           }

           // Toggle checkmark for a view
           private func toggleCheckmark(for view: UIView) {
               if let checkmarkImageView = view.viewWithTag(99) as? UIImageView {
                   checkmarkImageView.removeFromSuperview()
               } else {
                   addCheckmark(to: view)
               }
           }
        // Add checkmark to a view
           private func addCheckmark(to view: UIView) {
               let checkmarkImage = UIImage(named: "checkmark_checked")
               let checkmarkImageView = UIImageView(image: checkmarkImage)
               checkmarkImageView.contentMode = .scaleAspectFit
               checkmarkImageView.frame = CGRect(x: view.bounds.width - 30, y: 0, width: 30, height: 30)
               checkmarkImageView.tag = 99
               view.addSubview(checkmarkImageView)
           }

        
    
    
// MARK: -     Tap Gestures:-
                
                func tapGestures(){
                    
                    let tgBack = UITapGestureRecognizer(target: self, action: #selector(gotoBack))
                    cmdBack.isUserInteractionEnabled = true
                    cmdBack.addGestureRecognizer(tgBack)
                    
                    let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoThePiste1))
                    viewBGContinue.isUserInteractionEnabled = true
                    viewBGContinue.addGestureRecognizer(tgContinue)
                }
                
                
                
// MARK: -     Custom Functions:-
                
                @objc func gotoBack(){
                    self.navigationController?.popViewController(animated: true)
                }
                
                @objc func gotoThePiste1(){
                    performSegue(withIdentifier: SMacros.kSegueThePiste1, sender: self)
                }


    


}
