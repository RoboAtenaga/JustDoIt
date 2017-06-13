//
//  Task.swift
//  JustDoIt
//
//  Created by Ogheneorobo on 6/13/17.
//  Copyright © 2017 Ogheneorobo. All rights reserved.
//

import Foundation

class Task {
    var name = ""
    var isImportant = false
    
    //constructor equivalent, called initializers
    init(name: String, isImportant: Bool) {
        self.name = name
        self.isImportant = isImportant
    }
}
