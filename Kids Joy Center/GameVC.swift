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
        let clockIV = ClockView(frame: CGRect(x: 185, y: 75, width: 170, height: 30))
        clockIV.build_clock(min: 1, tenth: 5, sec: 0)
        self.view.addSubview(clockIV)
        clockIV.superview?.bringSubview(toFront: timeIV)
    }
    
    func set_score() {
        let score = UIImage(named: "score")
        let scoreIV = UIImageView(image: score)
        self.view.addSubview(scoreIV)
        scoreIV.frame = CGRect(x: 600, y: 75, width: 170, height: 30)
        scoreIV.superview?.bringSubview(toFront: scoreIV)
        let pointsIV = ScoreView(frame: CGRect(x: 785, y: 75, width: 85, height: 30))
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
}
