//
//  BalloonVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class BalloonVC: GameVC {
    var start_y = 75

    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
        set_background()
        set_time(start_y: start_y)
        set_score(start_y: start_y)
        start_timer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
