//
//  UsersViewModel.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import Foundation


class UsersListViewModel : ObservableObject {
    
    @Published var users : [User] = []
    @Published var loadingState : LoadingState = .none

    
    var getUsers : GetUsersUseCase
    
     init () {
         getUsers = .init(repo: UsersRepositoryImpl(dataSource: UsersAPIImpl()))
         self.fetchUsers()
     }
  
    
    func fetchUsers() {
        loadingState = .loading
        
        getUsers.execute(completion: ) { result in
            switch result {
            case.success(let users) :
                
                DispatchQueue.main.async {
                    
                    self.users = users
                    self.loadingState = .success
                }

            case .failure(let error ) :
                switch error {
                case .networkError :
                    DispatchQueue.main.async {
                        print(error)
                        self.loadingState = .failed(error: "network error")

                    }
                    
                case .decodingError :
                    DispatchQueue.main.async {
                        print(error)
                        self.loadingState = .failed(error: "try again later")

                    }
                    
                    
                }
            }
        }
    }
}


