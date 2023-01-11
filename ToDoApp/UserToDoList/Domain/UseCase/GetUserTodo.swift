//
//  GetUserTodo.swift
//  ToDoApp
//
//  Created by Reenad gh on 16/06/1444 AH.
//

import Foundation






enum UseCaseError: Error{
    case networkError, decodingError
}


protocol GetTodos {
    
    func execute(forUserId  userid : String , completion: @escaping (Result<[ToDo], UseCaseError> ) -> Void )
}



struct GetUserToDoUseCase : GetTodos {
    
    var repo : UserTodosRepository
    
    func execute(forUserId userid: String, completion: @escaping (Result<[ToDo], UseCaseError>) -> Void) {
        
        repo.getToDoList(forUserId: userid) { result in
            switch result {
            case.success(let tasks) :
                completion(.success(tasks))
                
            case .failure(let error ) :
                switch error {
                case .decodingError :
                  return  completion(.failure(.decodingError))
                    
                default :
                    return completion(.failure(.networkError))
                }
            }
        }
        
        
    }
    
    
}
