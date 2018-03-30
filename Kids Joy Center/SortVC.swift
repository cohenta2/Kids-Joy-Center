//
//  SortVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class SortVC: GameVC {
    let start_y = 725
    var num_images: Int?
    var sort_objects = [(Int, UIImageView)]()
    var land_view1 = UIView()
    var land_view2 = UIView()
    var sea_view1 = UIView()
    var sea_view2 = UIView()
    var air_view = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
        set_background()
        set_time(start_y: start_y)
        set_score(start_y: start_y)
        start_timer()
        num_images = 8 + (difficulty * 2)
        build_objects()
        build_location_views()
        display_objects()
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
        bar.frame = CGRect(x: 0,y: 0, width: self.view.frame.width, height: self.view.frame.height / 5)
        self.view.addSubview(backgroundIV)
        backgroundIV.frame = CGRect(x: 0, y: Int(bar.frame.maxY), width: Int(backgroundIV.superview!.frame.width), height: Int(backgroundIV.superview!.frame.height - bar.frame.height))
    }
    
    func build_location_views() {
        land_view1.frame = CGRect(x: 475,y: 637, width: 550, height: 137)
        land_view1.backgroundColor = .brown
        land_view1.alpha = 0.5
        self.view.addSubview(land_view1)
        land_view2.frame = CGRect(x: 715,y: 500, width: 305, height: 137)
        land_view2.backgroundColor = .brown
        land_view2.alpha = 0.5
        self.view.addSubview(land_view2)
        sea_view1.frame = CGRect(x: 0, y: 500, width: 720, height: 137)
        sea_view1.alpha = 0.5
        sea_view1.backgroundColor = .blue
        self.view.addSubview(sea_view1)
        sea_view2.frame = CGRect(x: 0, y: 637, width: 500, height: 137)
        sea_view2.alpha = 0.5
        sea_view2.backgroundColor = .blue
        self.view.addSubview(sea_view2)
        air_view.frame = CGRect(x: 0, y:153, width: self.view.frame.width, height: 348)
        air_view.backgroundColor = .purple
        air_view.alpha = 0.5
        self.view.addSubview(air_view)
    }
    
    @objc func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
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
    
    func build_objects() {
        for i in 1...3 {
            for j in 1...5 {
                let object = UIImageView(image: UIImage(named: "\(i)-\(j)"))
                sort_objects.append((i,object))
            }
        }
    }
    
    func get_rand_nums(amount: Int) -> [Int] {
        var rand_array = [Int]()
        for _ in 1...amount {
            var num = Int(arc4random_uniform(15))
            while rand_array.contains(num) {
                num = Int(arc4random_uniform(15))
            }
            rand_array.append(num)
        }
        return rand_array
    }
    
    func display_objects() {
        var prev_x = 0
        let arr = get_rand_nums(amount: num_images!)
        for i in 0...arr.count - 1 {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(gestureRecognizer:)))
            sort_objects[arr[i]].1.frame = CGRect(x: prev_x , y:75, width: 75, height: 75)
            sort_objects[arr[i]].1.isUserInteractionEnabled = true
            sort_objects[arr[i]].1.addGestureRecognizer(pan)
            self.view.addSubview(sort_objects[arr[i]].1)
            prev_x = Int(sort_objects[arr[i]].1.frame.maxX)
        }
    }

}
