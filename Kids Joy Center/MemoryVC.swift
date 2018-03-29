//
//  MemoryVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class MemoryVC: GameVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
        set_background()
        set_time()
        set_score()
        start_timer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func load_game() {
        if difficulty == 0 {
            self.seconds = 120
        }
        else if difficulty == 1 {
            self.seconds = 105
        }
        else if difficulty == 2 {
            self.seconds = 90
        }
    }

}
