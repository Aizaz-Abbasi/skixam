//
//  QuickTest21.swift
//  skixam
//
//  Created by Usman Ramzan on 24/08/2023.
//

import UIKit

class QuickTest21: UIViewController {


// MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    
    @IBOutlet weak var viewBGCroisementDePiste: UIView!
    @IBOutlet weak var viewBGviewBGCheckBoxCroisementDePiste: UIView!
    
    @IBOutlet weak var viewBGPisteFermée: UIView!
    @IBOutlet weak var viewBGCheckBoxviewBGPisteFermée: UIView!

    @IBOutlet weak var viewBGQRCode: UIView!
    @IBOutlet weak var viewBGContinue: UIView!
    
    
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the function to set the border color for each outlet
        setBorderColor(for: viewBGviewBGCheckBoxCroisementDePiste)
        setBorderColor(for: viewBGCheckBoxviewBGPisteFermée)
        
        // Apply tap gestures to all viewBGCheckBox outlets
        applyTapGesture(to: viewBGviewBGCheckBoxCroisementDePiste)
        applyTapGesture(to: viewBGCheckBoxviewBGPisteFermée)

        setCornerRadius()
        tapGestures()
    }
    
    
    
// MARK: -    Corner Radius:-
    
    func setCornerRadius(){
        
        viewBGQRCode.layer.cornerRadius = 4
        
        viewBGCroisementDePiste.layer.cornerRadius = 10
        viewBGPisteFermée.layer.cornerRadius = 10
        
        viewBGContinue.layer.cornerRadius = 10
        
        viewBGviewBGCheckBoxCroisementDePiste.layer.cornerRadius = 4
        viewBGCheckBoxviewBGPisteFermée.layer.cornerRadius = 4
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
                    
                    let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoQRCodeEnd))
                    viewBGContinue.isUserInteractionEnabled = true
                    viewBGContinue.addGestureRecognizer(tgContinue)
                }
                
                
                
// MARK: -     Custom Functions:-
                
                @objc func gotoBack(){
                    self.navigationController?.popViewController(animated: true)
                }
                
                @objc func gotoQRCodeEnd(){
                    performSegue(withIdentifier: SMacros.kSegueQRCodeEnd, sender: self)
                }


            
   
  
}
