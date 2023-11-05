//
//  PokeCell.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import SDWebImage
import UIKit

final class PokeCell: UICollectionViewCell {

    private enum ViewMetrics {
        static let pokeCellFontSize: CGFloat = 16.0
        static let directionalMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
    }

    static let reuseID = "PokeCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let pokeNameLabel   = pokeTitleLabel(textAlignment: .center, fontSize: 16)

    let secondBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(pokemon: Pokemon) {
        pokeNameLabel.text = pokemon.name?.capitalized
        if let url = pokemon.url {
            if let id = ImageManager.extractNumberFromURL(url) {
                let imageUrl = ImageManager.createPokemonImageURL(number: id)
                avatarImageView.sd_setImage(with: URL(string: imageUrl))
            }
        }
    }

    private func configure() {
        contentView.directionalLayoutMargins = ViewMetrics.directionalMargins
        addSubview(secondBackground)
        secondBackground.addSubview(avatarImageView)
        secondBackground.addSubview(pokeNameLabel)

        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5),

            pokeNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5),
            pokeNameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            pokeNameLabel.widthAnchor.constraint(equalTo: widthAnchor),

            secondBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondBackground.leftAnchor.constraint(equalTo: leftAnchor),
            secondBackground.rightAnchor.constraint(equalTo: rightAnchor),
            secondBackground.heightAnchor.constraint(equalToConstant: 60)
        ])
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 4.0
    }
}
