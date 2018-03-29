//
//  ClockView.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class ClockView: UIView {
    var nums: Numbers
    var min: UIImageView
    var tenths: UIImageView
    var secs: UIImageView
    var colon: UIImageView
    
    override init(frame: CGRect) {
        self.nums = Numbers()
        self.min = UIImageView()
        self.tenths = UIImageView()
        self.secs = UIImageView()
        self.colon = UIImageView(image: UIImage(named: "colon"))
        super.init(frame: frame)
    }
    
    func build_clock(min: Int, tenth: Int, sec: Int) {
        let num_width = self.frame.width / 4
        let num_height = self.frame.height
        set_min(num: min)
        set_tenths(num: tenth)
        set_secs(num: sec)
        self.min.frame = CGRect(x: 0, y: 0, width: num_width, height: num_height)
        self.colon.frame = CGRect(x: (self.min.frame.maxX - 10) , y: 0, width: num_width, height: num_height)
        self.tenths.frame = CGRect(x: (self.colon.frame.maxX - 10), y:0, width: num_width, height: num_height)
        self.secs.frame = CGRect(x: self.tenths.frame.maxX, y:0, width: num_width, height: num_height)
        self.backgroundColor = .white
        self.addSubview(self.min)
        self.addSubview(self.tenths)
        self.addSubview(self.secs)
        self.addSubview(self.colon)
//        self.sizeToFit()
    }
    
    func set_min(num: Int) {
        self.min.image = nums.get_number(num: num)
    }
    
    func set_tenths(num: Int) {
        self.tenths.image = nums.get_number(num: num)
    }
    
    func set_secs(num: Int) {
        self.secs.image = nums.get_number(num: num)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
