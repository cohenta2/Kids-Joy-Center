//
//  NumberTimeView.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class Numbers {
    
    var zero: UIImage
    var one: UIImage
    var two: UIImage
    var three: UIImage
    var four: UIImage
    var five: UIImage
    var six: UIImage
    var seven: UIImage
    var eight: UIImage
    var nine: UIImage
    
    var numbers: [Int : UIImage]
    
    func get_number(num: Int) -> UIImage {
        return numbers[num]!
    }
    
    init() {
        self.zero = UIImage(named: "cartoon-number-0")!
        self.one = UIImage(named: "cartoon-number-1")!
        self.two = UIImage(named: "cartoon-number-2")!
        self.three = UIImage(named: "cartoon-number-3")!
        self.four = UIImage(named: "cartoon-number-4")!
        self.five = UIImage(named: "cartoon-number-5")!
        self.six = UIImage(named: "cartoon-number-6")!
        self.seven = UIImage(named: "cartoon-number-7")!
        self.eight = UIImage(named: "cartoon-number-8")!
        self.nine = UIImage(named: "cartoon-number-9")!
        self.numbers = [0 : zero, 1 : one, 2 : two, 3 : three, 4 : four, 5 : five, 6 : six, 7 : seven, 8 : eight, 9 : nine]
    }

}
