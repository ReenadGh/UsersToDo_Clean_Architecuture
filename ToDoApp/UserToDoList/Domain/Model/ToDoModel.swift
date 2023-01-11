//
//  Model.swift
//  ToDoApp
//
//  Created by Reenad gh on 15/06/1444 AH.
//

import Foundation


struct ToDo :  Identifiable {
    let isCompleted: Bool
    let title, id, userID: String
}
