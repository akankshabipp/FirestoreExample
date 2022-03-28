//
//  EventsViewController.swift
//  FirestoreExample
//mera yaha code hai
//  Created by admin on 25/03/22.
//

import UIKit
import Firebase
class EventsViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "Dog")
    }
    @IBAction func switchBtnActivity(_ sender: UISwitch) {
        FirebaseAnalytics.Analytics.logEvent("flip_switch", parameters: nil)
    }
    
    @IBAction func btnActivity(_ sender: UIButton) {
        FirebaseAnalytics.Analytics.logEvent("press_button", parameters: nil)
        if img.image == UIImage(named: "Cat"){
            Analytics.logEvent("Image_Change_dog", parameters: nil)
            img.image = UIImage(named: "Dog")
        } else {
            Analytics.logEvent("Image_Change_cat", parameters: nil)
            img.image = UIImage(named: "Cat")
        }
    }
    
    @IBAction func progressActivity(_ sender: UISlider) {
        FirebaseAnalytics.Analytics.logEvent("Slider_changing", parameters: nil)
    }
    //@IBAction func imgActivity(_ sender: UIImage) {
       // Analytics.logEvent("Image_Change", parameters: nil)
    //}
}
