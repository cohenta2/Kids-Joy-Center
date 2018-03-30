//
//  GameVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/27/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit
import AVFoundation

class GameVC: UIViewController {
    var player: AVAudioPlayer?
    var game: Int = 3
    var difficulty: Int = 3
    var seconds: Int = 0
    var timer = Timer()
    var score = 0
    var pointsIV = ScoreView()
    var clockIV = ClockView()
    var backgroundIV = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func set_time(start_y: Int) {
        let time = UIImage(named: "time")
        let timeIV = UIImageView(image: time)
        self.view.addSubview(timeIV)
        timeIV.frame = CGRect(x: 0, y: start_y, width: 170, height: 30)
        timeIV.superview?.bringSubview(toFront: timeIV)
        clockIV = ClockView(frame: CGRect(x: 185, y: start_y, width: 170, height: 30))
        clockIV.build_clock(min: minutes_left(), tenth: tens_digit(num: seconds_left()), sec: ones_digit(num: seconds_left()))
        self.view.addSubview(clockIV)
        clockIV.superview?.bringSubview(toFront: timeIV)
    }
    
    func set_score(start_y: Int) {
        let score = UIImage(named: "score")
        let scoreIV = UIImageView(image: score)
        self.view.addSubview(scoreIV)
        scoreIV.frame = CGRect(x: 750, y: start_y, width: 170, height: 30)
        scoreIV.superview?.bringSubview(toFront: scoreIV)
        pointsIV = ScoreView(frame: CGRect(x: 935, y: start_y, width: 85, height: 30))
        pointsIV.build_score()
        self.view.addSubview(pointsIV)
        pointsIV.superview?.bringSubview(toFront: scoreIV)
    }
    
    func add_score(num: Int) {
        self.pointsIV.set_tens(num: tens_digit(num: num))
        self.pointsIV.set_ones(num: ones_digit(num: num))
    }
    
    func set_background() {
        let background = UIImage(named: "\(game)")
        backgroundIV = UIImageView(image: background)
        backgroundIV.contentMode = .scaleToFill
        self.view.addSubview(backgroundIV)
        backgroundIV.frame = (backgroundIV.superview?.frame)!
    }
    
    func start_timer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update_timer), userInfo: nil, repeats: true)
    }
    
    
    func minutes_left() -> Int {
        return Int(seconds) / 60 % 60
    }
    
    func seconds_left() -> Int {
        return Int(seconds) % 60
    }
    
    func tens_digit(num: Int) -> Int {
        return Int(num) / 10
    }
    
    func ones_digit(num: Int) -> Int {
        return Int(num) % 10
    }
    
    @objc func update_timer() {
        if seconds <= 0 {
            self.timer.invalidate()
            gameOver()
            return
        }
        seconds -= 1
        self.clockIV.set_min(num: minutes_left())
        self.clockIV.set_tenths(num: tens_digit(num: seconds_left()))
        self.clockIV.set_secs(num: ones_digit(num: seconds_left()))
    }
    
    func popToRoot() {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    func win(yesAction: UIAlertAction) {
        self.timer.invalidate()
        let alert = UIAlertController(title: "You Win!", message: "You beat the game!", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .default) {
            UIAlertAction in self.popToRoot()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    func gameOver() {
        let alert = UIAlertController(title: "Game Over!", message: "You ran out of time! Would you like to play again?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in self.loadView()
        }
        let noAction = UIAlertAction(title: "No", style: .default) {
            UIAlertAction in self.popToRoot()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true)
    }
    
    func reset_game() {
        seconds = 0
        timer = Timer()
        pointsIV = ScoreView()
        clockIV = ClockView()
    }
    
    func cheer() {
        if let soundURL = Bundle.main.url(forResource: "applause6", withExtension: "mp3") {
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: soundURL)
                if let thePlayer = player {
                    thePlayer.prepareToPlay()
                    thePlayer.play()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func boo() {
        if let soundURL = Bundle.main.url(forResource: "boo2", withExtension: "mp3") {
            
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
                try AVAudioSession.sharedInstance().setActive(true)
                player = try AVAudioPlayer(contentsOf: soundURL)
                if let thePlayer = player {
                    thePlayer.prepareToPlay()
                    thePlayer.play()
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    
}
