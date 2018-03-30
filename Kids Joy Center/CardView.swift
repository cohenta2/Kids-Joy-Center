//
//  CardView.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit

class CardView: UIImageView {
    
    var front: UIImageView
    var back: UIImageView
    var value: Int
    var images: [Int: UIImage]
    var one: UIImage
    var two: UIImage
    var three: UIImage
    var four: UIImage
    var five: UIImage
    var six: UIImage
    var seven: UIImage
    var eight: UIImage
    var nine: UIImage
    var ten: UIImage
    
    override init(frame: CGRect) {
        self.back = UIImageView(image: UIImage(named: "question"))
        self.front = UIImageView()
        self.value = 0
        self.one = UIImage(named: "card1")!
        self.two = UIImage(named: "card2")!
        self.three = UIImage(named: "card3")!
        self.four = UIImage(named: "card4")!
        self.five = UIImage(named: "card5")!
        self.six = UIImage(named: "card6")!
        self.seven = UIImage(named: "card7")!
        self.eight = UIImage(named: "card8")!
        self.nine = UIImage(named: "card9")!
        self.ten = UIImage(named: "card10")!
        self.images = [1: one, 2 : two, 3 : three, 4 : four, 5 : five, 6 : six, 7 : seven, 8 : eight, 9 : nine, 10 : ten]
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set_card_image(num: Int) {
        self.value = num
        self.front.image = images[num]
    }
    
    func create_card(num: Int) {
        let height = self.frame.height
        let width = self.frame.width
        set_card_image(num: num)
        self.front.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.back.frame = CGRect(x: 0, y: 0, width: width, height: height)
        interact_true()
        self.addSubview(self.front)
        self.addSubview(self.back)
        toggle_view(card: self.front)
    }
    
    func toggle_view(card: UIView) {
        card.alpha = card.alpha == 1 ? 0 : 1
    }
    
    func toggle_card() {
        toggle_view(card: self.front)
        toggle_view(card: self.back)
    }
    
    func interact_false() {
        self.isUserInteractionEnabled = false
    }
    
    func interact_true() {
        self.isUserInteractionEnabled = true
    }
}
