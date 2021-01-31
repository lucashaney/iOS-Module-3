// Lucas Haney
// ID: 2407823

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    // Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        
        // Images for slider
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    // Action for Hit Me button
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        // Different title names and points depending on how well the user did
        let title: String
        if (difference == 0) {
            title = "Perfect!"
            points += 100
        } else if (difference < 5) {
            title = "You almost had it!"
            if (difference == 1) {
                points += 50
            }
        } else if (difference < 10) {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        // Displays how many points the user got
        let message = "You scored \(points) points"
        
        // Properties for the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Alert action and what happens when it's closed
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Function for when slider is moved
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    // Starts new round
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    // Updates labels with the new values
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    // Completely start a new game
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }


}

