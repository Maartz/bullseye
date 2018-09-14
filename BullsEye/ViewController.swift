//
//  ViewController.swift
//  BullsEye
//
//  Created by Maartz on 13/09/2018.
//  Copyright © 2018 Maartz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert(){
        
        let message = "The value of the slider is now \(currentValue)"
        
        // Create an alert pop up window
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        // Create an alert button action
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        // Add the action button to the alert window
        alert.addAction(action)
        // present the alert to the user
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }

}

