//
//  DetailVC.swift
//  MovieApp
//
//  Created by Şule Kaptan on 8.11.2023.
//

import UIKit

class DetailVC: UIViewController {
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = UIImage(named: "batman")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.25
        return backgroundImageView
    }()
    
    let movieImage : UIImageView = {
        let movieImage = UIImageView()
        movieImage.layer.cornerRadius = 4
        movieImage.contentMode = .scaleToFill
        movieImage.backgroundColor = .clear
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.layer.borderWidth = 0
        movieImage.layer.shadowColor = UIColor.black.cgColor
        movieImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        movieImage.layer.shadowRadius = 4
        movieImage.layer.shadowOpacity = 1
        return movieImage
        }()
    
    let movieName : UILabel = {
        let movieName = UILabel()
        movieName.textAlignment = .left
        movieName.font = UIFont.boldSystemFont(ofSize: 15)
        movieName.textColor = .black
        movieName.numberOfLines = 0
        movieName.translatesAutoresizingMaskIntoConstraints = false
        return movieName
    }()
    
    let movieActors : UILabel = {
        let movieActors = UILabel()
        movieActors.textAlignment = .left
        movieActors.font = UIFont.boldSystemFont(ofSize: 15)
        movieActors.textColor = .black
        movieActors.numberOfLines = 0
        movieActors.translatesAutoresizingMaskIntoConstraints = false
        return movieActors
    }()
    
    let movieLocation : UILabel = {
        let movieLocation = UILabel()
        movieLocation.textAlignment = .left
        movieLocation.font = UIFont.boldSystemFont(ofSize: 15)
        movieLocation.textColor = .black
        movieLocation.numberOfLines = 0
        movieLocation.translatesAutoresizingMaskIntoConstraints = false
        return movieLocation
    }()
    
    let movieDirector : UILabel = {
        let movieDirector = UILabel()
        movieDirector.numberOfLines = 0
        movieDirector.font = UIFont.boldSystemFont(ofSize: 15)
        movieDirector.textAlignment = .left
        movieDirector.textColor = .black
        movieDirector.translatesAutoresizingMaskIntoConstraints = false
        return movieDirector
    }()
    
    let movieRating : UILabel = {
        let movieRating = UILabel()
        movieRating.textAlignment = .left
        movieRating.textColor = .black
        movieRating.numberOfLines = 0
        movieRating.font = UIFont.boldSystemFont(ofSize: 15)
        movieRating.translatesAutoresizingMaskIntoConstraints = false
        return movieRating
    }()
    
    let movieYear : UILabel = {
        let movieYear = UILabel()
        movieYear.textColor = .black
        movieYear.font = UIFont.boldSystemFont(ofSize: 15)
        movieYear.textAlignment = .left
        movieYear.numberOfLines = 0
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        return movieYear
    }()
    
    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
  
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()

    }
    
    func setupViews(){
        view.backgroundColor = UIColor.systemGray5
        view.insertSubview(backgroundImageView, at: 0)
        
        view.addSubview(movieName)
        view.addSubview(movieYear)
        view.addSubview(movieImage)
        view.addSubview(movieActors)
        view.addSubview(movieRating)
        view.addSubview(movieLocation)
        view.addSubview(movieDirector)
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor),
            
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            movieImage.heightAnchor.constraint(equalToConstant: 300),
            movieImage.widthAnchor.constraint(equalToConstant: 200),
            
            movieName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 100),
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            movieYear.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieYear.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 30),
            movieYear.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieYear.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            movieActors.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieActors.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 30),
            movieActors.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieActors.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            movieLocation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieLocation.topAnchor.constraint(equalTo: movieActors.bottomAnchor, constant: 30),
            movieLocation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieLocation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            movieDirector.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieDirector.topAnchor.constraint(equalTo: movieLocation.bottomAnchor, constant: 30),
            movieDirector.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieDirector.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            movieRating.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieRating.topAnchor.constraint(equalTo: movieDirector.bottomAnchor, constant: 30),
            movieRating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            movieRating.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
}
