//
//  HTTPClient.swift
//  ToDoApp
//
//  Created by Reenad gh on 15/06/1444 AH.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

protocol UserTodosDataSource {
    
   func getToDoList(forUserId  userid : String , completion: @escaping (Result<[ToDo], NetworkError>) -> Void)
    
}
