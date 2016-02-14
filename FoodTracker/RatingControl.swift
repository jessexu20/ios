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
    
    var rating = 0{
        didSet {
            setNeedsLayout()
        }
    }
    var stars = 6
    var spacing = 5
    var ratingButtons = [UIButton]()
    let filledStar = UIImage(named: "filledStar")
    let emptyStar = UIImage(named: "emptyStar")
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<stars{
            let button = UIButton()
//            button.backgroundColor = UIColor.blueColor()
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Selected,.Highlighted])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            
            
        }
    }
    // MARK: Initialization
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize , height: buttonSize)
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat((buttonSize+spacing) * index)
            button.frame = buttonFrame
            updateButtonSelectionStates()
        }
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
}
