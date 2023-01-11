//
//  UsersRepositoryImpl.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation

struct UsersRepositoryImpl : UsersRepository {
    
    var dataSource : UsersDataSource

    
    func getUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
      
        
        dataSource.getUsers { result in
            
            switch result {
            case .success(let users) :
                completion(.success(users))
                
            case .failure(let error ) :
                completion(.failure(error))
            }
        }

    }
    
 
 
    
    
  
  
    
    
    
    
    
}
