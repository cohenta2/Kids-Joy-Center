//
//  MemoryVC.swift
//  Kids Joy Center
//
//  Created by Trevor A Cohen on 3/28/18.
//  Copyright © 2018 Trevor A Cohen. All rights reserved.
//

import UIKit


class MemoryVC: GameVC {
    var start_y = 75
    var card_matrix = [[CardView]]()
    var combo_timer = Timer()
    var combo_seconds = 0
    var matches = 0
    var first_pick: CardView?
    var second_pick: CardView?
    var num_cards: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_game()
        set_background()
        set_time(start_y: start_y)
        set_score(start_y: start_y)
        start_timer()
        build_grid()
        start_combo_timer()
    }
    
    @objc func handleTap(_sender: UITapGestureRecognizer) {
        if let card = _sender.view as? CardView {
            card.toggle_card()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.check_match(card: card)
            }
        }
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
    
    func build_grid() {
        let rows = 3 
        let columns = 2 + difficulty
        num_cards = ((rows + 1) * (columns + 1) / 2) - 1
        
        let view_width = (backgroundIV.frame.width / 8)
        let view_height = (backgroundIV.frame.height / 7)
        let starting_x = ((Int(backgroundIV.frame.width) - (columns * Int(view_width))) / 2) - 60
        let rand_nums: [Int] = get_rand_nums(amount: num_cards!)
        let shuffled_nums: [Int] = shuffle(nums: rand_nums) + shuffle(nums: rand_nums)
        var prev_card_x = CGFloat(starting_x)
        var prev_card_y: CGFloat = 150
        var index = 0
        
        for row in 0...rows {
            card_matrix.append([])
            prev_card_x = CGFloat(starting_x)
            for column in 0...columns {
                let a_card = CardView(frame: CGRect(x: prev_card_x, y: prev_card_y, width: view_width, height: view_width))
                a_card.create_card(num: shuffled_nums[index])
                card_matrix[row].append(a_card)
                set_tap(card: a_card)
                prev_card_x = a_card.frame.maxX
                self.view.addSubview(a_card)
                index += 1
            }
            prev_card_y = card_matrix[row][0].frame.maxY
        }
    }
    
    func get_rand_nums(amount: Int) -> [Int] {
        var rand_array = [Int]()
        for _ in 0...amount {
            var num = Int(arc4random_uniform(10)) + 1
            while rand_array.contains(num) {
                num = Int(arc4random_uniform(10)) + 1
            }
            rand_array.append(num)
        }
        return rand_array
    }
    
    func shuffle(nums: [Int]) -> [Int] {
        var shuffled = [Int]()
        var arr = nums
        for _ in 0...arr.count - 1 {
            let rand = Int(arc4random_uniform(UInt32(arr.count)))
            shuffled.append(arr[rand])
            arr.remove(at: rand)
        }
        return shuffled
    }
    
    func set_tap(card: CardView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_sender:)))
        card.addGestureRecognizer(tap)
    }
    
    func check_match(card: CardView) {
        if first_pick?.value == nil {
            first_pick = card
            first_pick!.isUserInteractionEnabled = false
            return
        }
        else if second_pick?.value == nil {
            second_pick = card
            second_pick!.isUserInteractionEnabled = false
            
            if first_pick!.value == second_pick!.value {
                match()
                check_win()
            }
            else {
                no_match()
            }
        }
    }
    func no_match() {
        boo()
        first_pick!.isUserInteractionEnabled = true
        second_pick!.isUserInteractionEnabled = true
        first_pick?.toggle_card()
        second_pick?.toggle_card()
        first_pick = nil
        second_pick = nil
    }
    
    func match() {
        matches += 1
        cheer()
        calc_score()
        add_score(num: score)
        reset_combo_timer()
        first_pick = nil
        second_pick = nil
        return
    }
    
    override func reset_game() {
        super.reset_game()
        card_matrix = [[CardView]]()
        combo_timer = Timer()
        combo_seconds = 0
        matches = 0
        first_pick = nil
        second_pick = nil
        num_cards = nil
        load_game()
        set_background()
        set_time(start_y: start_y)
        set_score(start_y: start_y)
        start_timer()
        build_grid()
    }
    
    func check_win() {
        if num_cards == matches - 1 {
            let yesAction = UIAlertAction(title: "Yes", style: .default) {
                UIAlertAction in self.reset_game()
            }
            win(yesAction: yesAction)
        }
        else {
            return
        }
    }
    
    func start_combo_timer() {
        combo_timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update_combo_timer),userInfo: nil, repeats: true)
    }
    
    func reset_combo_timer() {
        combo_seconds = 0
    }
    
    @objc func update_combo_timer() {
        combo_seconds += 1
    }
    
    func calc_score() {
        if combo_seconds <= 3 {
            self.score += 5
        }
        else if combo_seconds <= 7 {
            self.score += 4
        }
        else {
            self.score += 3
        }
    }
    
    

}
