//
//  UserTodoAPIImpl.swift
//  ToDoApp
//
//  Created by Reenad gh on 16/06/1444 AH.
//

import Foundation


class UserTodosAPIImpl : UserTodosDataSource {
    
    
    
    func getToDoList(forUserId  userid : String , completion: @escaping (Result<[ToDo], NetworkError>) -> Void) {

        guard let url = URL.forTasksList(userId: userid ) else {
            return completion(.failure(.badURL))  }
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
                
            }

            guard let todos = try? JSONDecoder().decode([ToDoEntity].self, from: data) else {
                
                return completion(.failure(.decodingError))
            }
            
            completion(.success(todos.map({ todo in
                ToDo(isCompleted: todo.completed, title: todo.title, id: todo.id, userID: todo.userID)})))
            
        }.resume()
        
    }

}
