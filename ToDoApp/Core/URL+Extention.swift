//
//  URL+Extention.swift
//  ToDoApp
//
//  Created by Reenad gh on 15/06/1444 AH.
//

import Foundation





extension URL {
    
    static func forTasksList(userId : String ) -> URL? {
        return URL(string: "\(Constants.BASE_URL)/users/\(userId)/toDo")
    }
    static func forUsers() -> URL? {
        return URL(string: "\(Constants.BASE_URL)/users")
    }
}
