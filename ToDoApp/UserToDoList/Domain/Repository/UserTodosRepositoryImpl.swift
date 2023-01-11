//
//  UserTodoRepositoryImpl.swift
//  ToDoApp
//
//  Created by Reenad gh on 16/06/1444 AH.
//

import Foundation




struct UserToDoRepositoryImpl : UserTodosRepository {
 
 
    
    var dataSource : UserTodosDataSource
    
    func getToDoList(forUserId userid: String, completion: @escaping (Result<[ToDo], NetworkError>) -> Void) {
        
        dataSource.getToDoList(forUserId: userid) { result in
            
            switch result {
            case .success(let tasksList) :
                completion(.success(tasksList))
                
            case .failure(let error ) :
                completion(.failure(error))
            }
        }
        
        
    }
    
    func deleteUserToDo(userId: String, taskId: String) {
        
    }
    
    func UpdateUserToDo(userId: String, newTask: ToDo) {
        
    }
    
    
    
    
    
}
