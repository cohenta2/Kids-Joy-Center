//
//  GameVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/27/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    var game: Int = 3
    var difficulty: Int = 3
    var seconds: Int = 0
    var timer = Timer()
    var timer_is_running = false
    var pointsIV = ScoreView()
    var clockIV = ClockView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("The chosen game was \(game) and the chosen difficulty was \(difficulty)")
        // Do any additional setup after loading the view.
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
    
    func set_time() {
        let time = UIImage(named: "time")
        let timeIV = UIImageView(image: time)
        self.view.addSubview(timeIV)
        timeIV.frame = CGRect(x: 0, y: 75, width: 170, height: 30)
        timeIV.superview?.bringSubview(toFront: timeIV)
        clockIV = ClockView(frame: CGRect(x: 185, y: 75, width: 170, height: 30))
        clockIV.build_clock(min: minutes_left(), tenth: tens_left(), sec: ones_left())
        self.view.addSubview(clockIV)
        clockIV.superview?.bringSubview(toFront: timeIV)
    }
    
    func set_score() {
        let score = UIImage(named: "score")
        let scoreIV = UIImageView(image: score)
        self.view.addSubview(scoreIV)
        scoreIV.frame = CGRect(x: 600, y: 75, width: 170, height: 30)
        scoreIV.superview?.bringSubview(toFront: scoreIV)
        pointsIV = ScoreView(frame: CGRect(x: 785, y: 75, width: 85, height: 30))
        pointsIV.build_score()
        self.view.addSubview(pointsIV)
        pointsIV.superview?.bringSubview(toFront: scoreIV)
    }
    
    func set_background() {
        let background = UIImage(named: "\(game)")
        let backgroundIV = UIImageView(image: background)
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
    
    func tens_left() -> Int {
        let seconds_remain = seconds_left()
        return Int(seconds_remain) / 10
    }
    
    func ones_left() -> Int {
        let seconds_remain = seconds_left()
        return Int(seconds_remain) % 10
    }
    
    @objc func update_timer() {
        if seconds <= 0 {
            self.timer.invalidate()
            gameOver()
            return
        }
        seconds -= 1
        self.clockIV.set_min(num: minutes_left())
        self.clockIV.set_tenths(num: tens_left())
        self.clockIV.set_secs(num: ones_left())
    }
    
    func popToRoot() {
        self.navigationController!.popToRootViewController(animated: true)
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
}
