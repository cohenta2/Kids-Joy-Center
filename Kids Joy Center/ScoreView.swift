//
//  ScoreView.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    var nums: Numbers
    var tens: UIImageView
    var ones: UIImageView
    
    override init(frame: CGRect) {
        self.nums = Numbers()
        self.tens = UIImageView()
        self.ones = UIImageView()
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func build_score() {
        let num_width = self.frame.width / 2
        let num_height = self.frame.height
        set_tens(num: 0)
        set_ones(num: 0)
        self.tens.frame = CGRect(x:0, y:0, width: num_width, height: num_height)
        self.ones.frame = CGRect(x: self.tens.frame.maxX, y: 0, width: num_width, height: num_height)
        self.backgroundColor = .white
        self.addSubview(self.tens)
        self.addSubview(self.ones)
    }
    
    func set_tens(num: Int) {
        tens.image = nums.get_number(num: num)
    }
    
    func set_ones(num: Int) {
        ones.image = nums.get_number(num: num)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
