//
//  ViewController.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 8.12.22.
//

import UIKit

class FirstScreenViewController: UIViewController {
 
    
    
    
    // test
    
    var weather: CurrentWeatherModel!
    var firstScreenViewModel = FirstScreenViewModel()
    var searchViewModel = SearchViewModel()
    var arrayWeather: [CurrentWeatherModel] = []
    var arraySearch: [CurrentWeatherModel] = []
    
    
    var search: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Search"
        search.searchBar.searchBarStyle = .minimal
        search.tabBarItem.badgeColor = .black

        return search
    }()
    
    lazy var collectionSearch: UICollectionView = {
        let collectionSearch = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionSearch.translatesAutoresizingMaskIntoConstraints = false
        return collectionSearch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstScreenViewModel.createDataForFirstScreen { [weak self] array in
            guard let self = self, let array = array else {return}
            self.arrayWeather = array
            self.collectionSearch.reloadData()
        }
        
        navigationItem.searchController = search
        navigationItem.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        definesPresentationContext = true
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.hidesSearchBarWhenScrolling = false
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        setupCollectionView()
    }

    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.4))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/7))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            collectionSearch.topAnchor.constraint(equalTo: view.topAnchor),
            collectionSearch.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionSearch.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionSearch.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupCollectionView(){
        
        
        collectionSearch.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseId)
        collectionSearch.dataSource = self
        collectionSearch.delegate = self
        collectionSearch.backgroundColor = .black
        view.addSubview(collectionSearch)
    }
    

}

extension FirstScreenViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
         guard let text = searchController.searchBar.text else {return}
        if text.isEmpty{
          self.arraySearch.removeAll()
          self.collectionSearch.reloadData()
        }

        searchController.showsSearchResultsController =  true
    
        searchViewModel.searchWeather(city: text.trimmingCharacters(in: .whitespaces)){ data in
                self.arraySearch = data
                DispatchQueue.main.async {
                    self.collectionSearch.reloadData()

                }
            }
        

        
       
    }
  
}
extension FirstScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.search.isActive{
        case true: return self.arraySearch.count
        case false: return self.arrayWeather.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var weather: CurrentWeatherModel!
        switch self.search.isActive{
        case true: weather = self.arraySearch[indexPath.row]
        case false: weather = self.arrayWeather[indexPath.row]
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.reuseId, for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(with: weather)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        var weather: CurrentWeatherModel!
//        switch self.search.isActive{
//        case true: weather = self.arraySearch[indexPath.row]
//        case false: weather = self.arrayWeather[indexPath.row]
//        }
//
//        //let vc = SecondScreenViewController()
//        //self.navigationController?.pushViewController(vc, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "secondNav")
//        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
