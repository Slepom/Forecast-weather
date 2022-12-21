//
//  NewViewController.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 21.12.22.
//

import UIKit

class NewViewController: UIViewController {
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var descrLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    var currentWeather: CurrentWeatherModel!
    
    @IBOutlet weak var topView: UIView!
    
   lazy var collectionView: UICollectionView! = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMainView(cityCurrentWeather: self.currentWeather)
        setupCollectionView()

    }
    
    func configureMainView(cityCurrentWeather: CurrentWeatherModel){
        self.cityLabel.text = cityCurrentWeather.name
        self.descrLabel.text = cityCurrentWeather.weather?.first?.weatherDescription
        guard let temperature = cityCurrentWeather.main else {return}
        self.tempLabel.text = String(Int(temperature.temp))
        self.maxTempLabel.text = String(Int(temperature.tempMax))
        self.minTempLabel.text = String(Int(temperature.tempMin))
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
    }
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
    
    private func setupCollectionView(){
        
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.reuseId)
        //collectionSearch.dataSource = self
       // collectionSearch.delegate = self
        collectionView.backgroundColor = .orange
        view.addSubview(collectionView)
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
