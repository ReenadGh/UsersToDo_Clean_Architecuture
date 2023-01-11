//
//  ContentView.swift
//  ToDoApp
//
//  Created by Reenad gh on 13/06/1444 AH.
//

import SwiftUI

struct ToDoUserList: View {
    var userId : String
  @StateObject var  vm =  ToDoListViewModel()
 
    
    var body: some View {
     
        NavigationView{
        ZStack {
            
            if (vm.loadingState == .loading) {
                ProgressView()
                    .scaleEffect(2)
            }
            else {
            List {
                
                ForEach (vm.userTodosList ){ todo in
                    ToDoView(todo : todo)
                    
                }
            }

            }
            
            
        }
        
        .onAppear{
            vm.fetchUserTodos(forId: userId)
        }
        .navigationTitle("To Do :")


       
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoUserList(userId: "1")
    }
}

struct ToDoView : View {
    let todo : ToDo
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle" :  "circle" )
                .imageScale(.large)
                .foregroundColor(todo.isCompleted ? .green : .gray)
            Text(todo.title)
        }
    }
}
