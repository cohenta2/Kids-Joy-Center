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
        set_background()
        set_time()
        set_score()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func load_game() {
        if difficulty == 0 {
            
        }
        else if difficulty == 1 {
            
        }
        else if difficulty == 2 {
            
        }
        else {
            unwind(for: <#T##UIStoryboardSegue#>, towardsViewController: <#T##UIViewController#>)
        }
    }

}
