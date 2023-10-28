//
//  UserViewModel.swift
//  ProtocolOrientedProject
//
//  Created by Şule Kaptan on 28.10.2023.
//

import Foundation

class UserViewModel {
    //dependency injection
    //delegate pattern
    
    
    //dependency injection: userview model çalışmak için userservice ihtiyaç duyuyor.
    private let userService : UserService
    
    //delegate pattern: o protocolu direkt
    var delegate : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers(){
        userService.fetchUser { result in
            switch result {
            case .success(let user):
                self.delegate?.updateView(name: user.name, username: user.username, email: user.email)
            case .failure(_):
                self.delegate?.updateView(name: "No user", username: "", email: "")

            }
        }
    }
}
