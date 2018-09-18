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
	var round: Int = 0
	
	@IBOutlet weak var slider: UISlider!
	@IBOutlet weak var targetLabel: UILabel!
	@IBOutlet weak var userScore: UILabel!
	@IBOutlet weak var userRound: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
		startNewGame()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	@IBAction func showAlert(){
		
		
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
		// Create an alert pop up window
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		// Create an alert button action
		let action = UIAlertAction(title: "Awesome", style: .default, handler: {
			action in
			self.startNewRound()
		})
		// Add the action button to the alert window
		alert.addAction(action)
		// present the alert to the user
		present(alert, animated: true, completion: nil)
		
	}
	
	@IBAction func sliderMoved(_ slider: UISlider){
		let roundedValue = slider.value.rounded()
		currentValue = Int(roundedValue)
	}
	
	func startNewRound(){
		targetValue = Int.random(in: 1...100)
		currentValue = 50
		slider.value = Float(currentValue)
		round += 1
		updateLabels()
	}
	
	func updateLabels(){
		targetLabel.text = String(targetValue)
		userScore.text = String(score)
		userRound.text = String(round)
	}
	
	@IBAction func startNewGame(){
		score = 0
		round = 0
		startNewRound()
	}
	
}
