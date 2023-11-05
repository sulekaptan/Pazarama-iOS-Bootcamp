//
//  MainPageView.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import UIKit

protocol MainPageViewInterface: AnyObject {
    func prepare()
    func updateData()
}

final class MainPageView: UIViewController {
    
    private lazy var viewModel = MainPageViewModel(view: self, manager: NetworkManager())

    //MARK: - Components
    var collectionView: UICollectionView!
    private let searchBar = UISearchController(searchResultsController: nil)
    var filteredPokemons: [Pokemon] = []

    //MARK: - Life Cycle

    override func viewDidLoad() {
        viewModel.viewDidLoad()
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: - MainPageViewViewInterface

extension MainPageView: MainPageViewInterface {

    func prepare() {
        configureCollectionView()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        navigationItem.searchController = searchBar
        view.backgroundColor = ColorPalette.background
        searchBar.searchBar.searchTextField.backgroundColor = .white
        searchBar.searchBar.delegate = self
        viewModel.fetchPokemons()
        self.navigationController?.navigationBar.backgroundColor = ColorPalette.background
        let logoImageView = UIImageView(image: UIImage(named: "Title.png"))
        logoImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = logoImageView
    }

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(PokeCell.self, forCellWithReuseIdentifier: PokeCell.reuseID)
    }

    func updateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension MainPageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVc = DetailView()
        detailVc.pokemon = viewModel.poke[indexPath.row]
        self.navigationController?.pushViewController(detailVc, animated: false)
    }
}

extension MainPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.poke.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCell.reuseID, for: indexPath) as? PokeCell else { return UICollectionViewCell() }
        cell.set(pokemon: viewModel.poke[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if indexPath.row == viewModel.poke.count - 5 {
            viewModel.fetchPokemons()
        }
    }
}
extension MainPageView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.isEmpty else {return }
        viewModel.queryPokemon(pokemonName: text)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.listingPokemonCount = 0
        viewModel.fetchPokemons()
    }
}
