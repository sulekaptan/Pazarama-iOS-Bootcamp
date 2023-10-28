//
//  ViewController.swift
//  ProtocolOrientedProject
//
//  Created by Şule Kaptan on 28.10.2023.
//

import UIKit

class ViewController: UIViewController, UserViewModelOutput{
    func updateView(name: String, username: String, email: String) {
        self.usernameLabel.text = username
        self.nameLabel.text = name
        self.emailLabel.text = email
    }
    
    
    private let viewModel : UserViewModel

   
    
    init?(viewModel: UserViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        //fetchUsers()
        self.viewModel.fetchUsers()
        
    }
    
//    private func fetchUsers(){
//
//        APIManager().fetchUser { result in
//            switch result{
//            case .success(let user):
//                DispatchQueue.main.async {
//                    self.nameLabel.text = user.name
//                    self.emailLabel.text = user.email
//                    self.usernameLabel.text = user.username
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    

    private func setupViews(){
        view.backgroundColor = .lightGray
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 70),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 70),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 50),
        ])
    }

}

