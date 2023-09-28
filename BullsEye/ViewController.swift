//
//  ViewController.swift
//  BullsEye
//
//  Created by Ray Wenderlich on 6/13/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

  override func viewDidLoad() {
    super.viewDidLoad()
      let roundedValue = slider.value.rounded()
      currentValue = Int(slider.value)
      startNewGame()

    
  }
  
  @IBAction func showAlert() {
      
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference
      
      score += points
      
      let title: String
      if difference == 0 {
          title = "Perfect! You get 100 bonus points!"
          points += 100
      }else if difference == 1 {
            title = "\(currentValue)! Wow one off! You get 50 bonus points!"
          points += 50
      } else if difference < 5 {
          title = "\(currentValue)! You almost had it!"
      } else if difference < 10 {
          title = "\(currentValue) was pretty good!"
      } else {
          title = "\(currentValue)! Not even close!"
      }
      

      
      let message = "You scored \(points) points!"
      
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
      let action = UIAlertAction(title: "OK", style: .default, handler: {
          action in self.startNewRound()
      })
      
      alert.addAction(action)
      
      present(alert, animated: true, completion: nil)
  }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        _ = slider.value.rounded()
        currentValue = Int(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
        
    
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
}

