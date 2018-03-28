//
//  ViewController.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/22/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var game_button_array: [UIButton]!
    @IBOutlet var difficulty_button_array: [UIButton]!
    
    
    var chosen_game: Int = 3
    var chosen_difficulty: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play_game" {
            if let dest = segue.destination as? GameVC {
                dest.game = chosen_game
                dest.difficulty = chosen_difficulty
            }
        }
    }
    
    @IBAction func game_selection(_ sender: Any) {
        for game in game_button_array {
            game.isSelected = false
        }
        if let game = sender as? UIButton{
            let origImage = game.currentImage
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            game.setImage(tintedImage, for: .selected)
            game.tintColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
            game.isSelected = true
            chosen_game = game_button_array.index(of: game)!
//            print(chosen_game)
        }
        else {
            chosen_game = 3
        }
    }
    
    @IBAction func difficulty_selection(_ sender: Any) {
        for difficulty in difficulty_button_array {
            difficulty.isSelected = false
        }
        if let difficulty = sender as? UIButton{
            let origImage = difficulty.currentImage
            let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
            difficulty.setImage(tintedImage, for: .selected)
            difficulty.tintColor = UIColor(displayP3Red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5)
            difficulty.isSelected = true
            chosen_difficulty = difficulty_button_array.index(of: difficulty)!
//            print(chosen_difficulty)
        }
        else {
            chosen_difficulty = 3
        }
    }
    
    @IBAction func play(_ sender: Any) {
        if chosen_game == 3 {
            let alert = UIAlertController(title: "No game selected", message: "Please select a game to play", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        else if chosen_difficulty == 3 {
            let alert = UIAlertController(title: "No dificulty selected", message: "Please select a difficulty to play", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        if let play_button = sender as? UIButton {
            performSegue(withIdentifier: "play_game", sender: play_button)
        }
    }
    
    
}

