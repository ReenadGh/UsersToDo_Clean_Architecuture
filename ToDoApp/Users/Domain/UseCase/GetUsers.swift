//
//  GetUsers.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation


protocol GetUsers {
   func execute( completion: @escaping (Result<[User], UseCaseError> ) -> Void)
}



struct GetUsersUseCase : GetUsers {
    
    var repo : UsersRepository

    func execute(completion: @escaping (Result<[User], UseCaseError>) -> Void) {
        repo.getUsers{ result in
            switch result {
            case.success(let users) :
                completion(.success(users))
                
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
