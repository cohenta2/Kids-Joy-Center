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
    var game_dict: [Int : String] = [0 : "memory", 1 : "sorting", 2 : "balloons"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
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
    
    func load_game() {
        let background = UIImage(named: "\(game)")
        let backgroundIV = UIImageView(image: background)
        backgroundIV.contentMode = .scaleAspectFill
//        backgroundIV
        self.view.addSubview(backgroundIV)
    }
}
