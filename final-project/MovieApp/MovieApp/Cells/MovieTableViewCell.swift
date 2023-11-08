//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Şule Kaptan on 7.11.2023.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let movieImage : UIImageView = {
            let movieImage = UIImageView()
            movieImage.layer.cornerRadius = 4
            movieImage.contentMode = .scaleToFill
            movieImage.backgroundColor = .clear
            movieImage.translatesAutoresizingMaskIntoConstraints = false
            movieImage.layer.borderWidth = 0
            movieImage.layer.shadowColor = UIColor(named: "secondColor")?.cgColor
            movieImage.layer.shadowOffset = CGSize(width: 1, height: 1)
            movieImage.layer.shadowRadius = 4
            movieImage.layer.shadowOpacity = 2 
            return movieImage
        }()
    
    let movieName : UILabel = {
        let movieName = UILabel()
        movieName.textAlignment = .left
        movieName.translatesAutoresizingMaskIntoConstraints = false
        return movieName
    }()
    
    let movieYear : UILabel = {
        let movieYear = UILabel()
        movieYear.textColor = .black
        movieYear.font = UIFont.systemFont(ofSize: 13)
        movieYear.textAlignment = .center
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        return movieYear
    }()
    
    private func setupViews(){
        
        backgroundColor = .clear
        
        addSubview(movieImage)
        addSubview(movieName)
        addSubview(movieYear)
        
        NSLayoutConstraint.activate([
        
            movieImage.topAnchor.constraint(equalTo: topAnchor,constant: 20),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -250),
            movieImage.heightAnchor.constraint(equalToConstant: 160),
                            
            movieName.topAnchor.constraint(equalTo: topAnchor,constant: 70),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 30),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                            
            movieYear.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 15),
            movieYear.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 30),
        ])
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
