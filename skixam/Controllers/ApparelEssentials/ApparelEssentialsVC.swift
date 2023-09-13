//
//  ApareilEssentialsVC.swift
//  skixam
//
//  Created by Usman Ramzan on 22/08/2023.
//

import UIKit


class ApparelEssentialsVC: UIViewController {

    
// MARK: -     Outlets:-
    
    @IBOutlet weak var cmdBack: UIImageView!
    @IBOutlet weak var viewBGLock: UIView!
    
    @IBOutlet weak var viewBGCasque: UIView!
    @IBOutlet weak var viewBGCheckBoxCasque: UIView!
    
    @IBOutlet weak var viewBGÉcharpe: UIView!
    @IBOutlet weak var viewBGCheckBoxÉcharpe: UIView!
    
    @IBOutlet weak var viewBGChaussuresDeSki: UIView!
    @IBOutlet weak var viewBGCheckBoxChaussuresDeSki: UIView!
    
    @IBOutlet weak var viewBGPantalonDeSki: UIView!
    @IBOutlet weak var viewBGCheckBoxPantalonDeSki: UIView!
    
    @IBOutlet weak var viewBGLunettesDeSoleil: UIView!
    @IBOutlet weak var viewBGCheckBoxLunettesDeSoleil: UIView!
    
    @IBOutlet weak var viewBGVêtementsSuperposès: UIView!
    @IBOutlet weak var viewBGCheckBoxVêtementsSuperposès: UIView!
    
    @IBOutlet weak var viewBGVesteDeSki: UIView!
    @IBOutlet weak var viewBGCheckBoxVesteDeSki: UIView!
    
    @IBOutlet weak var viewBGChaussettesDeSki: UIView!
    @IBOutlet weak var viewBGCheckBoxChaussettesDeSki: UIView!
    
    @IBOutlet weak var viewBGManteauDeSki: UIView!
    @IBOutlet weak var viewBGCheckBoxManteauDeSki: UIView!
    
    @IBOutlet weak var ViewBGCacheCou: UIView!
    @IBOutlet weak var ViewBGCheckBoxCacheCou: UIView!
    
    @IBOutlet weak var viewBGContinue: UIView!
    
    
    
    
    
// MARK: -     ViewDidLoad:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the function to set the border color for each outlet
        setBorderColor(for: viewBGCheckBoxCasque)
        setBorderColor(for: viewBGCheckBoxÉcharpe)
        setBorderColor(for: viewBGCheckBoxChaussuresDeSki)
        setBorderColor(for: viewBGCheckBoxPantalonDeSki)
        setBorderColor(for: viewBGCheckBoxLunettesDeSoleil)
        setBorderColor(for: viewBGCheckBoxVêtementsSuperposès)
        setBorderColor(for: viewBGCheckBoxVesteDeSki)
        setBorderColor(for: viewBGCheckBoxChaussettesDeSki)
        setBorderColor(for: viewBGCheckBoxManteauDeSki)
        setBorderColor(for: ViewBGCheckBoxCacheCou)
        
        
        // Apply tap gestures to all viewBGCheckBox outlets
             applyTapGesture(to: viewBGCheckBoxCasque)
             applyTapGesture(to: viewBGCheckBoxÉcharpe)
             applyTapGesture(to: viewBGCheckBoxChaussuresDeSki)
             applyTapGesture(to: viewBGCheckBoxPantalonDeSki)
             applyTapGesture(to: viewBGCheckBoxLunettesDeSoleil)
             applyTapGesture(to: viewBGCheckBoxVêtementsSuperposès)
             applyTapGesture(to: viewBGCheckBoxVesteDeSki)
             applyTapGesture(to: viewBGCheckBoxChaussettesDeSki)
             applyTapGesture(to: viewBGCheckBoxManteauDeSki)
             applyTapGesture(to: ViewBGCheckBoxCacheCou)

        
        
        
        setCornerRadius()
        tapGestures()
    }
    

// MARK: -     Corner Radius:-
    
    func setCornerRadius(){
        
        viewBGLock.layer.cornerRadius = 4
        
        viewBGCasque.layer.cornerRadius = 10
        viewBGCheckBoxCasque.layer.cornerRadius = 4
        
        viewBGÉcharpe.layer.cornerRadius = 10
        viewBGCheckBoxÉcharpe.layer.cornerRadius = 4
    
        viewBGChaussuresDeSki.layer.cornerRadius = 10
        viewBGCheckBoxChaussuresDeSki.layer.cornerRadius = 4
        
        viewBGPantalonDeSki.layer.cornerRadius = 10
        viewBGCheckBoxPantalonDeSki.layer.cornerRadius = 4
        
        viewBGLunettesDeSoleil.layer.cornerRadius = 10
        viewBGCheckBoxLunettesDeSoleil.layer.cornerRadius = 4
        
        viewBGVêtementsSuperposès.layer.cornerRadius = 10
        viewBGCheckBoxVêtementsSuperposès.layer.cornerRadius = 4
        
        viewBGVesteDeSki.layer.cornerRadius = 10
        viewBGCheckBoxVesteDeSki.layer.cornerRadius = 4
        
        viewBGChaussettesDeSki.layer.cornerRadius = 10
        viewBGCheckBoxChaussettesDeSki.layer.cornerRadius = 4
        
        viewBGManteauDeSki.layer.cornerRadius = 10
        viewBGCheckBoxManteauDeSki.layer.cornerRadius = 4
        
        ViewBGCacheCou.layer.cornerRadius = 10
        ViewBGCheckBoxCacheCou.layer.cornerRadius = 4
        
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
            
            let tgContinue = UITapGestureRecognizer(target: self, action: #selector(gotoApparelEssentialsResults))
            viewBGContinue.isUserInteractionEnabled = true
            viewBGContinue.addGestureRecognizer(tgContinue)
        }
        
        
        
// MARK: -     Custom Functions:-
        
        @objc func gotoBack(){
            self.navigationController?.popViewController(animated: true)
        }
        
        @objc func gotoApparelEssentialsResults(){
            performSegue(withIdentifier: SMacros.kSegueApparelEssentialsResults, sender: self)
        }


    
   
  
}
