//
//  APIManager.swift
//  ProtocolOrientedProject
//
//  Created by Şule Kaptan on 28.10.2023.
//

import Foundation

protocol UserService {
    // test yazarken bu protocol sayesinde api mock yaptığımızda birebir aynısı kullandığımızdan emin oluruz.
    //
    func fetchUser(completion: @escaping (Result<User,Error>) -> () )
    
}


class APIManager:UserService {
    
    //singleton
//    static let shared = APIManager()
//    private init (){}
    
    func fetchUser(completion: @escaping (Result<User,Error>) -> () ){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).last {
                    completion(.success(user))
                }else{
                    completion(.failure(NSError()))
                }
            }
            
        }.resume()
    }
}
