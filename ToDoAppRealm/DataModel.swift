//
//  DataModel.swift
//  ToDoAppRealm
//
//  Created by Akash Belekar on 20/04/23.
//

import Foundation
class DataModel{
    var fisrtName:String
    var lastName:String
    
    init(fisrtName: String? = nil, lastName: String? = nil) {
        self.fisrtName = fisrtName!
        self.lastName = lastName!
    }
    
}
