//
//  DetailView.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//
import SDWebImage
import UIKit

protocol DetailViewInterface: AnyObject {
    func prepare()
    var pokemon: Pokemon? {set get}
    func updateView(pokemonResponse: PokemonQueryResponse)
}

final class DetailView: UIViewController {

    private lazy var viewModel = DetailViewModel(view: self,manager: NetworkManager())
    var pokemon: Pokemon?
    //MARK: - Components
    private let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        return contentView
    }()

    private let pokeImage : UIImageView = {
        let pokeImage = UIImageView()
        pokeImage.translatesAutoresizingMaskIntoConstraints = false
        pokeImage.image = UIImage(named: "imagePlaceHolder.png")
        return pokeImage
    }()

    let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let size = UIScreen.main.bounds.width
        layout.itemSize = .init(width: size/6, height: 35)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 5
        collection.backgroundColor = .clear
        collection.register(PokemonTypeCollectionViewCell.self, forCellWithReuseIdentifier: PokemonTypeCollectionViewCell.identifier)
        return collection
    }()

    private let aboutLabel : UILabel = {
        let aboutLabel = UILabel()
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.text = "About"
        aboutLabel.font = FontManager.shared.boldFont(size: 20)
        aboutLabel.textAlignment = .center
        return aboutLabel
    }()

    private let imageWeight : UIImageView = {
        let imageWeight = UIImageView()
        imageWeight.translatesAutoresizingMaskIntoConstraints = false
        imageWeight.image = UIImage(systemName: "scalemass")
        imageWeight.tintColor = .black
        return imageWeight
    }()

    private let weightLabel : UILabel = {
        let weightLabel = UILabel()
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.text = "6.9 kg"
        weightLabel.font = FontManager.shared.regularFont(size: 15)
        return weightLabel
    }()

    private let imageHeight : UIImageView = {
        let imageHeight = UIImageView()
        imageHeight.translatesAutoresizingMaskIntoConstraints = false
        imageHeight.image = UIImage(systemName: "ruler")
        imageHeight.tintColor = .black
        return imageHeight
    }()

    private let heightLabel : UILabel = {
        let heightLabel = UILabel()
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.text = "0.7 m"
        heightLabel.font = FontManager.shared.regularFont(size: 15)
        return heightLabel
    }()

    private let movesLabel : UILabel = {
        let movesLabel = UILabel()
        movesLabel.translatesAutoresizingMaskIntoConstraints = false
        movesLabel.text = "Chlorophyll Overgrow"
        movesLabel.font = FontManager.shared.regularFont(size: 15)
        movesLabel.numberOfLines = 2
        movesLabel.textAlignment = .center
        return movesLabel
    }()

    private let weightLabelText : UILabel = {
        let weightLabelText = UILabel()
        weightLabelText.translatesAutoresizingMaskIntoConstraints = false
        weightLabelText.text = "Weight"
        weightLabelText.textColor = .gray
        weightLabelText.font = FontManager.shared.regularFont(size: 12)
        return weightLabelText
    }()

    private let heightLabelText : UILabel = {
        let heightLabelText = UILabel()
        heightLabelText.translatesAutoresizingMaskIntoConstraints = false
        heightLabelText.text = "Height"
        heightLabelText.textColor = .gray
        heightLabelText.font = FontManager.shared.regularFont(size: 12)
        return heightLabelText
    }()

    private let movesLabelText : UILabel = {
        let movesLabelText = UILabel()
        movesLabelText.translatesAutoresizingMaskIntoConstraints = false
        movesLabelText.text = "Moves"
        movesLabelText.textColor = .gray
                movesLabelText.textAlignment = .center
        movesLabelText.font = FontManager.shared.regularFont(size: 12)
        return movesLabelText
    }()

    private let descriptionLabel : UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger."
        descriptionLabel.font = FontManager.shared.regularFont(size: 15)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()

    private let baseStatsLabel : UILabel = {
        let baseStatsLabel = UILabel()
        baseStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        baseStatsLabel.textColor = UIColor(named: "bulbasourColor")
        baseStatsLabel.text = "Base Stats"
        baseStatsLabel.font = FontManager.shared.boldFont(size: 20)
        baseStatsLabel.textAlignment = .center
        return baseStatsLabel
    }()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemGray
        tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: StatsTableViewCell.identifier)
        tableView.layer.cornerRadius = 10
        return tableView
    }()

    private var loadingView: LoadingView = {
        let loadingView = LoadingView()
        loadingView.view.translatesAutoresizingMaskIntoConstraints = false
        return loadingView
    }()
    //MARK: - Life Cycle

    override func viewDidLoad() {
        viewModel.viewDidLoad()
        super.viewDidLoad()
    }
}

//MARK: - DetailViewViewInterface

extension DetailView: DetailViewInterface {
    func updateView(pokemonResponse: PokemonQueryResponse) {

        DispatchQueue.main.async {
            if let moves = pokemonResponse.moves?.first?.move?.name{
                self.movesLabel.text = moves
            }
            self.heightLabel.text = pokemonResponse.height?.description
            self.weightLabel.text = pokemonResponse.weight?.description

            if let type = self.viewModel.pokemonResponse?.types?.first?.type?.name {
                let color =  getColor(for: PokemonTypeColor(rawValue: type) ?? .ghost)
                self.view.backgroundColor = color
                self.aboutLabel.textColor = color
                self.baseStatsLabel.textColor = color
            }
            self.tableView.reloadData()
            self.mainCollectionView.reloadData()
            if let url = self.pokemon?.url {
                if let id = ImageManager.extractNumberFromURL(url) {
                    let imageUrl = ImageManager.createPokemonImageURL(number: id)
                    self.pokeImage.sd_setImage(with: URL(string: imageUrl))
                    self.loadingView.view.isHidden = true
                }
            }
        }
    }
//MARK: - prepare
    func prepare() {
        self.navigationController?.navigationBar.backgroundColor = .clear
        tableView.dataSource = self
        mainCollectionView.dataSource = self
        view.backgroundColor = .blue
        view.addSubview(contentView)
        view.addSubview(pokeImage)
        view.addSubview(aboutLabel)
        view.addSubview(weightLabel)
        view.addSubview(heightLabel)
        view.addSubview(movesLabel)
        view.addSubview(weightLabelText)
        view.addSubview(heightLabelText)
        view.addSubview(movesLabelText)
        view.addSubview(descriptionLabel)
        view.addSubview(tableView)
        view.addSubview(baseStatsLabel)
        view.addSubview(imageWeight)
        view.addSubview(imageHeight)
        view.addSubview(mainCollectionView)
        view.addSubview(loadingView.view)
        let width = UIScreen.main.bounds.width
        if let pokemon = pokemon {
            if let name = pokemon.name {
                viewModel.queryPokemon(pokemonName: name)
            }
        }

        NSLayoutConstraint.activate([
            pokeImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pokeImage.centerYAnchor.constraint(equalTo: contentView.topAnchor),
            pokeImage.widthAnchor.constraint(equalToConstant: 200),
            pokeImage.heightAnchor.constraint(equalToConstant: 180),

            aboutLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            aboutLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 70),
            aboutLabel.widthAnchor.constraint(equalToConstant: 80),
            imageWeight.topAnchor.constraint(equalTo: weightLabel.topAnchor),
            imageWeight.heightAnchor.constraint(equalToConstant: 12),
            imageWeight.widthAnchor.constraint(equalToConstant: 12),
            imageWeight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            imageWeight.trailingAnchor.constraint(equalTo: weightLabel.leadingAnchor, constant: -9),

            weightLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 30),
            weightLabel.leadingAnchor.constraint(equalTo: imageWeight.trailingAnchor, constant: 30),
            weightLabel.widthAnchor.constraint(equalToConstant: 100),
            imageHeight.topAnchor.constraint(equalTo: heightLabel.topAnchor),
            imageHeight.heightAnchor.constraint(equalToConstant: 12),
            imageHeight.widthAnchor.constraint(equalToConstant: 12),
            imageHeight.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor, constant: 90),
            imageHeight.trailingAnchor.constraint(equalTo: heightLabel.leadingAnchor, constant: -9),

            heightLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 30),
            heightLabel.leadingAnchor.constraint(equalTo: imageHeight.trailingAnchor, constant: 20),
            heightLabel.widthAnchor.constraint(equalToConstant: 100),

            movesLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 20),
            movesLabel.leadingAnchor.constraint(equalTo: heightLabel.trailingAnchor),
            movesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),

            weightLabelText.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            weightLabelText.leadingAnchor.constraint(equalTo: imageWeight.trailingAnchor),
            weightLabelText.widthAnchor.constraint(equalToConstant: 100),

            heightLabelText.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20),
            heightLabelText.leadingAnchor.constraint(equalTo: imageHeight.trailingAnchor),
            heightLabelText.widthAnchor.constraint(equalToConstant: 100),

            movesLabelText.centerXAnchor.constraint(equalTo: movesLabel.centerXAnchor),
            movesLabelText.widthAnchor.constraint(equalToConstant: 100),
            movesLabelText.bottomAnchor.constraint(equalTo: heightLabelText.bottomAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: weightLabelText.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            baseStatsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            baseStatsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            baseStatsLabel.widthAnchor.constraint(equalToConstant: 200),

            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            tableView.topAnchor.constraint(equalTo: baseStatsLabel.bottomAnchor,constant: 4),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            mainCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 20),
            mainCollectionView.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 4),
            mainCollectionView.bottomAnchor.constraint(equalTo: aboutLabel.topAnchor,constant: 8),
            mainCollectionView.widthAnchor.constraint(equalToConstant: width / 2 ),

            loadingView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.view.heightAnchor.constraint(equalToConstant: 100),
            loadingView.view.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

}
//MARK: - UITableViewDataSource
extension DetailView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.pokemonResponse?.stats?.count ?? 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatsTableViewCell.identifier, for: indexPath)  as? StatsTableViewCell else {
            return UITableViewCell()
        }
        let stat =  viewModel.pokemonResponse?.stats?[indexPath.row]
        if let type = self.viewModel.pokemonResponse?.types?.first?.type?.name {
            cell.color = getColor(for: PokemonTypeColor(rawValue: type) ?? .dark)
        }
        cell.stat = stat
        return cell
    }
    
}
//MARK: - UICollectionViewDataSource
extension DetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.typeStrings.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonTypeCollectionViewCell.identifier, for: indexPath) as? PokemonTypeCollectionViewCell else { return UICollectionViewCell() }
        cell.typeNameLabel.text = viewModel.typeStrings[indexPath.row].type?.name?.capitalized
        cell.layer.cornerRadius = 20
        if let type = self.viewModel.pokemonResponse?.types?.first?.type?.name {
        cell.backgroundColor = getColor(for: PokemonTypeColor(rawValue: type) ?? .dark)
        }
        return cell
    }
}
