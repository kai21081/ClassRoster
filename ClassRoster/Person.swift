//
//  Person.swift
//  ClassRoster
//
//  Created by Jung Kim on 2/19/15.
//  Copyright (c) 2015 JHK. All rights reserved.
//

import UIKit

class Person{
    
    var firstName = "John"
    var lastName = "Doe"
    var image :  UIImage?
    
    init(firstName : String, lastName : String){
        
        self.firstName = firstName
        self.lastName = lastName
    }
}