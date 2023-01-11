//
//  ToDoEntity.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation


struct ToDoEntity : Codable  {
    let completed: Bool
    let title, id, userID: String
    
    enum CodingKeys: String, CodingKey {
        case completed, title, id
        case userID = "userId"
    }
}
