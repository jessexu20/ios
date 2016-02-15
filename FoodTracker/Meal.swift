//
//  Meal.swift
//  FoodTracker
//
//  Created by Jesse on 2/14/16.
//  Copyright © 2016 Jesse. All rights reserved.
//

import UIKit


class Meal{
    var name: String
    var rating: Int
    var photo: UIImage?
    init?(name:String, rating: Int, photo: UIImage?){

        self.name = name
        self.rating = rating
        self.photo = photo
        
        if name.isEmpty || rating < 0{
            return nil
        }
        
    }
}
