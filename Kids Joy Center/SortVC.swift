//
//  SortVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class SortVC: GameVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
        set_background()
        set_time()
        set_score()
        start_timer()
        // Do any additional setup after loading the view.
    }   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func set_background() {
        let background = UIImage(named: "\(game)")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.contentMode = .scaleToFill
        let bar = UIView()
        bar.backgroundColor = .blue
        bar.alpha = 0.3
        self.view.addSubview(bar)
        bar.frame = CGRect(x: 0,y: 0, width: self.view.frame.width, height: self.view.frame.height / 6)
        self.view.addSubview(backgroundIV)
        backgroundIV.frame = CGRect(x: 0, y: Int(bar.frame.maxY), width: Int(backgroundIV.superview!.frame.width), height: Int(backgroundIV.superview!.frame.height - bar.frame.height))
    }
    
    func load_game() {
        if difficulty == 0 {
            self.seconds = 60
        }
        else if difficulty == 1 {
            self.seconds = 45
        }
        else if difficulty == 2 {
            self.seconds = 30
        }
    }

}
