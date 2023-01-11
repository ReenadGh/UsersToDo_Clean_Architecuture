//
//  ToDoListViewModel.swift
//  ToDoApp
//
//  Created by Reenad gh on 15/06/1444 AH.
//

import Foundation




enum LoadingState : Equatable {
    case loading
    case success
    case failed(error: String)
    case none
}



class ToDoListViewModel : ObservableObject {
    
    @Published var userTodosList : [ToDo] = []
    @Published var loadingState : LoadingState = .none

    
    var getUserTodos : GetUserToDoUseCase
    
     init () {
        getUserTodos = .init(repo: UserToDoRepositoryImpl(dataSource: UserTodosAPIImpl()))
         print(" init ")

    }
    
    deinit {
        print("de init ")
    }
    
    func fetchUserTodos(forId userid : String ) {
        loadingState = .loading
        
        getUserTodos.execute(forUserId: userid) { result in
            switch result {
            case.success(let tasks) :
                
                DispatchQueue.main.async {
                    self.userTodosList = tasks
                    self.loadingState = .success
                }

            case .failure(let error ) :
                switch error {
                case .networkError :
                    DispatchQueue.main.async {
                        self.loadingState = .failed(error: "network error")

                    }
                    
                default :
                    DispatchQueue.main.async {
                        self.loadingState = .failed(error: "try again later")

                    }                }
            }
        }
    }
    
//    func countCompletedTodos(forId userId : String ) -> Int {
//        self.fetchUserTodos(forId: userId)
//        return userTodosList.filter({$0.isCompleted}).count
//    }
//
//    func countUnCompletedTodos(forId userId : String ) -> Int {
//        self.fetchUserTodos(forId: userId)
//        return userTodosList.filter({!$0.isCompleted}).count
//    }
}


