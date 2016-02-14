//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Jesse on 2/13/16.
//  Copyright © 2016 Jesse. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    //Mark: Properties
    
    var rating = 0
    var ratingButtons = [UIButton]()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<5{
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.backgroundColor = UIColor.blueColor()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            
        }
    }
    // MARK: Initialization
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat((44+5) * index)
            button.frame = buttonFrame
        }
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
}
