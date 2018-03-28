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
        set_background()
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
        
    }
    
    func set_background() {
        let background = UIImage(named: "\(game)")
        var backgroundIV = UIImageView(image: background)
        let safeGuide = self.view.safeAreaLayoutGuide
        backgroundIV.contentMode = .scaleToFill
        if game == 1 {
            let bar = UIView()
            bar.backgroundColor = .yellow
            self.view.addSubview(bar)
            bar.frame = CGRect(x: 0,y: 0, width: self.view.frame.width, height: self.view.frame.height / 4)
            bar.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
            self.view.addSubview(backgroundIV)
            backgroundIV.frame = CGRect(x: 0, y: Int(bar.frame.maxY), width: Int(backgroundIV.superview!.frame.width), height: Int(backgroundIV.superview!.frame.height - bar.frame.height))
        }
        else {
            self.view.addSubview(backgroundIV)
            backgroundIV.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
            backgroundIV.frame = (backgroundIV.superview?.frame)!
        }
    }
}
