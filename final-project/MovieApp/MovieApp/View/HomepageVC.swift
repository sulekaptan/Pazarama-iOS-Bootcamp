//
//  ViewController.swift
//  MovieApp
//
//  Created by Şule Kaptan on 6.11.2023.
//

import UIKit

class HomepageVC: UIViewController{
    
    var movies = [Movie]()

    let navigationBar : UINavigationBar = {
       let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.barTintColor = .systemGray5
        navigationBar.tintColor = .black
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = false
        return navigationBar
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "Batman"
        searchBar.layer.cornerRadius = 100
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()

    let tableView : UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = true
//        tableView.separatorStyle = .none
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
//
//        let movie1 = Movie(title: "Batman Begins", movieImage: "batman", year: 2005, actors: "Christian Bale, Michael Kaine, Ken Watanabe", movieLocation: "United States, United Kingdom", movieRating: "8.2", movieDirector: "Christopher Nolan")
//        movies.append(movie1)
//        movies.append(movie1)
//        movies.append(movie1)
//        movies.append(movie1)
//        movies.append(movie1)
        
        tableView.dataSource = self
        tableView.delegate = self

    }

    func setupViews(){
        view.backgroundColor = .systemGray5
        view.addSubview(navigationBar)
        view.addSubview(searchBar)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
//            tableView.heightAnchor.constraint(equalToConstant: 800)
        ])
       
        
        let navigationItem = UINavigationItem(title: "Movie App")
        let bookmarks = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookmarksButtonClicked))
        navigationItem.rightBarButtonItem = bookmarks
        navigationBar.setItems([navigationItem], animated: false)
        
    }
    
    func addViews() {
        view.addSubview(navigationBar)
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    @objc func bookmarksButtonClicked() {
       
    }

}

extension HomepageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movieImage.image = UIImage(named: movie.poster)
        cell.movieName.text = movie.title
        cell.movieYear.text = String(movie.year)
        let movieNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Helvetica-Bold", size: 20)!,
            .foregroundColor: UIColor.black
        ]
        cell.movieName.attributedText = NSAttributedString(string: movie.title, attributes: movieNameAttributes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let detailVC = DetailVC(movie: movie)
        detailVC.movieName.text = "Name: \(movie.title)"
        detailVC.backgroundImageView.image = UIImage(named: movie.poster)
        detailVC.movieYear.text = String("Year: \(movie.year)")
        detailVC.movieActors.text = "Actors: \(movie.actors)"
        detailVC.movieDirector.text = "Director: \(movie.director)"
        detailVC.movieLocation.text = "Location: \(movie.plot)"
        detailVC.movieRating.text = "IMDB Rating: \(movie.imdbRating)"
        detailVC.movieImage.image = UIImage(named: movie.poster)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    
}

