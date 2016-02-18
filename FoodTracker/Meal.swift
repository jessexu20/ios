//
//  Meal.swift
//  FoodTracker
//
//  Created by Jesse on 2/14/16.
//  Copyright © 2016 Jesse. All rights reserved.
//

import UIKit


class Meal: NSObject, NSCoding{
    var name: String
    var rating: Int
    var photo: UIImage?
    var time: String
    init?(name:String,time:String, rating: Int, photo: UIImage?){

        self.name = name
        self.rating = rating
        self.photo = photo
        self.time = time
        super.init()
        if name.isEmpty || rating < 0{
            return nil
        }
        
    }
    
    //Mark Types
    struct PropertyKey {
        static let nameKey = "name"
        static let timeKey = "time"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(time, forKey: PropertyKey.timeKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        // Because photo is an optional property of Meal, use conditional cast.
        let time = aDecoder.decodeObjectForKey(PropertyKey.timeKey) as! String ?? ""
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        // Must call designated initilizer.
        self.init(name: name,time:time, rating: rating, photo: photo)
    }
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
}


