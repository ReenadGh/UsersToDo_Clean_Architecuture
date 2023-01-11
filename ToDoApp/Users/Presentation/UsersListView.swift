//
//  UsersListView.swift
//  ToDoApp
//
//  Created by Reenad gh on 17/06/1444 AH.
//

import SwiftUI

struct UsersListView: View {
    
    @StateObject var  vm =  UsersListViewModel()

    var body: some View {
        NavigationView {
            
            ZStack {
                
                switch vm.loadingState {
                case .loading :
                    ProgressView()
                case .success :
                    List {
                        ForEach ($vm.users){ $user in
                            NavigationLink{
                                ToDoUserList(userId: user.id)
                            } label : {
                                UserCardView(user: $user)
                            }
                        }
                        
                    }
                case .failed(error: let error ) :
                    Text(error)
                        .foregroundColor(.red)
                default:
                    Text("")
                }
                
             
            }
            .navigationTitle("Users")
        }
            
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}

struct UserCardView: View {
    
    @Binding var user : User
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .foregroundColor(.gray)
                .imageScale(.large)
            VStack {
                Text(user.name)
//                UserToDoCountView(user: $user)
                
            }
        }
    }
}

//struct UserToDoCountView : View {
//    @Binding var user : User
//    @State var vm : ToDoListViewModel = ToDoListViewModel()
//    var body: some View {
//        HStack{
//            HStack {
//                Image(systemName: "circle")
//                Text("\(vm.countCompletedTodos(forId: user.id))")
//            }
//
//            HStack {
//                Image(systemName: "checkmark.circle")
//                Text("\(vm.countCompletedTodos(forId: user.id))")
//            }
//
//        }
//    }
//}
