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
        set_background()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func set_background() {
        let background = UIImage(named: "\(game)")
        let backgroundIV = UIImageView(image: background)
        let safeGuide = self.view.safeAreaLayoutGuide
        backgroundIV.contentMode = .scaleToFill
        let bar = UIView()
        bar.backgroundColor = .blue
        bar.alpha = 0.3
        self.view.addSubview(bar)
        bar.frame = CGRect(x: 0,y: 0, width: self.view.frame.width, height: self.view.frame.height / 6)
        bar.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        self.view.addSubview(backgroundIV)
        backgroundIV.frame = CGRect(x: 0, y: Int(bar.frame.maxY), width: Int(backgroundIV.superview!.frame.width), height: Int(backgroundIV.superview!.frame.height - bar.frame.height))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
