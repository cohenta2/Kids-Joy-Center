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
    
    override init(frame: CGRect) {
        self.back = UIImageView(image: UIImage(named: "question"))
        self.front = UIImageView()
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
