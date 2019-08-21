//
//  ViewController.swift
//  BallsEye
//
//  Created by Sanasar Janjughazyan on 8/19/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentVal = 0;
    var targetVal = 0
    var totalScore = 0
    var totalRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVal = Int(slider.value.rounded())
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thubImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thubImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert() {
        let diff = abs(targetVal - currentVal)
        var points = 100 - diff
        
        let title: String
        if diff == 0 {
            points += 100
            title = "Perfect!"
        } else if diff < 5 {
            if diff == 1 {
                points += 50
            }
            title = "You almost had it!"
        } else if diff < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        totalScore += points
        
        let alert = UIAlertController(title: title, message: "You scored \(points) points\nYou got \(currentVal)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated:true, completion:nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentVal = Int(slider.value.rounded())
    }
    
    @IBAction func startNewGame() {
        totalRound = 0
        totalScore = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetVal = Int.random(in: 1...100)
        totalRound += 1
        currentVal = 50
        slider.value = 50.0
        updateLabels()
    }
    
    func updateLabels() {
        target.text = String(targetVal)
        score.text = String(totalScore)
        round.text = String(totalRound)
    }
}

