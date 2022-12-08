//
//  SearchCollectionViewCell.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 8.12.22.
//

import UIKit
import SDWebImage

class SearchCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "SearchCell"
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        return label
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()

        
    }
    private func setupConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(subtitle)
        contentView.addSubview(timeLabel)
        contentView.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.5),
            
            temperatureLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            temperatureLabel.rightAnchor.constraint(equalTo: cityLabel.leftAnchor, constant: -8),
            temperatureLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            cityLabel.leftAnchor.constraint(equalTo: temperatureLabel.rightAnchor, constant: 4),
            cityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            cityLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            subtitle.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            subtitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            subtitle.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8),
            
            timeLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            timeLabel.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func localTime(region: Int)->String{
        let dayFormatter = DateFormatter()
        dayFormatter.timeZone = .current
        dayFormatter.dateFormat = "HH:mm"
        let newDate = Date(timeIntervalSinceNow: TimeInterval(region))
   
        return dayFormatter.string(from: newDate)
    }

    
    func configure(with weather: CurrentWeatherModel){
        
        cityLabel.text = weather.name
        temperatureLabel.text = String(Int(weather.main?.temp ?? 0.0)) + "\u{2103}"
        timeLabel.text = localTime(region: weather.timezone)
        
        //imageView.image = UIImage(named: weather.weather?.first?.icon ?? " ")
        imageView.image = UIImage(systemName: (weather.weather?.first?.icon ?? " "))
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(weather.weather?.first?.icon ?? " ")@2x.png") else {return}
        imageView.sd_setImage(with: url, completed: nil)
        
        
    }
    
    
}
