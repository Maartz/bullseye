//
//  ViewController.swift
//  BullsEye
//
//  Created by Maartz on 13/09/2018.
//  Copyright © 2018 Maartz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var currentValue: Int = 0
	var targetValue: Int = 0
	var score: Int = 0
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
		startNewRound()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	@IBAction func showAlert(){
		
		let difference = abs(targetValue - currentValue)
		let points = 100 - difference
		
		score += points
		
		let message = "You scored \(points) points"
		
		// Create an alert pop up window
		let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
		// Create an alert button action
		let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
		// Add the action button to the alert window
		alert.addAction(action)
		// present the alert to the user
		present(alert, animated: true, completion: nil)
		
		startNewRound()
	}
	
	@IBAction func sliderMoved(_ slider: UISlider){
		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
	}
	
	func startNewRound(){
		targetValue = Int.random(in: 1...100)
		currentValue = 50
		slider.value = Float(currentValue)
		updateLabels()
	}
	
	func updateLabels(){
		targetLabel.text = String(targetValue)
	}
	
}
