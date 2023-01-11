//
//  UsersAPIImpl.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation


struct UsersAPIImpl : UsersDataSource {
    
    func getUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        guard let url = URL.forUsers() else {
            return completion(.failure(.badURL))  }
        
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                
                return completion(.failure(.noData))
                
            }

            guard let users = try? JSONDecoder().decode([UserEntity].self, from: data) else {
                
                return completion(.failure(.decodingError))
            }

            print (users)
            completion(.success(users.map{ user in
                    User(name: user.name , avatar: user.avatar, mail: user.mail, id: user.id)
            }))
            
        }.resume()
    }
    
    
    
}
