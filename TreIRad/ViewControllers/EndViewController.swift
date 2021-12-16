//
//  testViewController.swift
//  TreIRad
//
//  Created by Kevin Zetterlind on 2021-12-10.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var playerWonLabel: UILabel!
    var playerWon : String? = "Hej"
    var timer: Timer?
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        playerWonLabel.text = playerWon
        
         timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(EndViewController.timerAction), userInfo: nil, repeats: false)
         
         
     }

     @objc func timerAction()
     {
         if timer != nil {
             timer?.invalidate()
             dismiss(animated: true, completion: {
             })
         }
     }

     override func viewWillDisappear(_ animated: Bool) {
         if self.isBeingDismissed {
             let filterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewC")
             filterVC.modalPresentationStyle = UIModalPresentationStyle.custom
             self.presentingViewController?.present(filterVC, animated: true, completion: nil)
         }
     }
 }
