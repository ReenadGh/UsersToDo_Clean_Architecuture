//
//  UsersDataSource.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation


protocol UsersDataSource {
    
   func getUsers( completion: @escaping (Result<[User], NetworkError>) -> Void)
    
}
