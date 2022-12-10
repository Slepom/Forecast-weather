
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
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
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
        contentView.addSubview(timeLabel)
        contentView.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([

            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            timeLabel.heightAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: 1),
            timeLabel.bottomAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 10),
            
            cityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            cityLabel.topAnchor.constraint(equalTo: imageView.centerYAnchor),
            cityLabel.rightAnchor.constraint(equalTo: imageView.leftAnchor, constant: -8),
            
            imageView.leftAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            imageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 2),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 2),
            
            temperatureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            temperatureLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 48),
            temperatureLabel.topAnchor.constraint(equalTo: imageView.centerYAnchor)
        
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
        temperatureLabel.text = String(Int(weather.main?.temp ?? 0.0)) + "°"
        timeLabel.text = localTime(region: weather.timezone)
        
        //imageView.image = UIImage(named: weather.weather?.first?.icon ?? " ")
        imageView.image = UIImage(systemName: (weather.weather?.first?.icon ?? " "))
        guard let url = URL(string: "https://openweathermap.org/img/wn/\(weather.weather?.first?.icon ?? " ")@2x.png") else {return}
        imageView.sd_setImage(with: url, completed: nil)
        
        
    }
    
    
}
