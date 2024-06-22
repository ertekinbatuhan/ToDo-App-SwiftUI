//
//  ToDo.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 22.06.2024.
//

import Foundation
import SwiftData

@Model
class ToDo  : Hashable{
    var task : String
    var date : Date
 
    init(task: String, date: Date) {
        self.task = task
        self.date = date
       
    }
        
}
