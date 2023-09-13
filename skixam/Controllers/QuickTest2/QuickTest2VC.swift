//
//  QuickTest2VC.swift
//  skixam
//
//  Created by Usman Ramzan on 24/08/2023.
//

import UIKit

class QuickTest2VC: UIViewController {

    
// MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var viewBGQRCode: UIView!
    
    @IBOutlet weak var viewBG1: UIView!
    @IBOutlet weak var ViewBGCheckBox1: UIView!
    
    @IBOutlet weak var viewBG2: UIView!
    @IBOutlet weak var viewBGCheckBox2: UIView!
    
    @IBOutlet weak var viewBG3: UIView!
    @IBOutlet weak var viewBGCheckBox3: UIView!
    
    @IBOutlet weak var viewBGContinue: UIView!
    
    
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the function to set the border color for each outlet
        setBorderColor(for: ViewBGCheckBox1)
        setBorderColor(for: viewBGCheckBox2)
        setBorderColor(for: viewBGCheckBox3)
        
        
        // Apply tap gestures to all viewBGCheckBox outlets
        applyTapGesture(to: ViewBGCheckBox1)
        applyTapGesture(to: viewBGCheckBox2)
        applyTapGesture(to: viewBGCheckBox3)
        

       setCornerRadius()
       tapGestures()
    }
    
    
// MARK: -     Corner Radius:-
    
    func setCornerRadius(){
        
        viewBGQRCode.layer.cornerRadius = 4
        
        ViewBGCheckBox1.layer.cornerRadius = 4
        viewBGCheckBox2.layer.cornerRadius = 4
        viewBGCheckBox3.layer.cornerRadius = 4
        
        viewBG1.layer.cornerRadius = 10
        viewBG2.layer.cornerRadius = 10
        viewBG3.layer.cornerRadius = 10
        
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
        
        
        
        
// MARK: -     Toogle CheckMark:-
            
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
                    
                    let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoQuickTest21))
                    viewBGContinue.isUserInteractionEnabled = true
                    viewBGContinue.addGestureRecognizer(tgContinue)
                }
                
                
                
// MARK: -     Custom Functions:-
                
                @objc func gotoBack(){
                    self.navigationController?.popViewController(animated: true)
                }
                
                @objc func gotoQuickTest21(){
                    performSegue(withIdentifier: SMacros.kSegueQuickTest21, sender: self)
                }


            
           
        
}
