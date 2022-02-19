//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation
//at the very top after UIKit
import Foundation


class ViewController: UIViewController {

    var randomNumber = 0
    var range = 100
    var level = 1
    var high = 0
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                // We should hide resultLabel since it's a new round!
                resultLabel.isHidden = true

            } else {
                // Make sure to move this line of code to this else statement so we can only show "Play Again" when the user loses
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        } else {
            if randomNumber == (Int(numSlider.value)) {
                resultLabel.text = "You were right on point! Bullseye!"

                // The code below is exactly the same as the code above ^.^
                
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                
                level += 1
                currentLevel.text = String(level)
                
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            }
            else {
                playAgainButton.isHidden = false
                resultLabel.text = "Whoops! You missed! Try again later"
            }
        }
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true //must reappear next time it is checked ^
        playAgainButton.isHidden = true
        if high < level {
            if level != 1 {
                high = level
                highScore.text = String(high)
            }
        }
                
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
                
        level = 1
        currentLevel.text = String(level)
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        //numLabel.text = "\(Int(numSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        // Exercise 2E
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(high)
    }

}

