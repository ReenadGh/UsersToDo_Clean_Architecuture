//
//  UserTodoRepository.swift
//  ToDoApp
//
//  Created by Reenad gh on 16/06/1444 AH.
//

import Foundation


protocol UserTodosRepository {
    
    func getToDoList(forUserId  userid : String , completion: @escaping (Result<[ToDo], NetworkError>) -> Void)

    func deleteUserToDo(userId : String , taskId : String )
    
    func UpdateUserToDo(userId : String , newTask : ToDo )


}
