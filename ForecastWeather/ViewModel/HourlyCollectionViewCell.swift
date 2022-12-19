

import UIKit
import SDWebImage

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "HourlyCell"

    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        return label
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
        NSLayoutConstraint.activate([
      
            
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.1),
            timeLabel.heightAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: 1),
            timeLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            
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
    
    func currentTime(inputDate: String)->String{
        let olDateFormatter = DateFormatter()
           olDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

           let oldDate = olDateFormatter.date(from: inputDate)

           let convertDateFormatter = DateFormatter()
           convertDateFormatter.dateFormat = "HH:mm"

           return convertDateFormatter.string(from: oldDate!)
    }
    
    func configure(with weather: ListHourly){
        timeLabel.text = currentTime(inputDate: weather.dtTxt)
//
//        imageView.image = UIImage(systemName: (weather.weather.first?.icon.rawValue ?? " "))
//        guard let url = URL(string: "https://openweathermap.org/img/wn/\(weather.weather.first?.icon.rawValue ?? " ")@2x.png") else {return}
//        imageView.sd_setImage(with: url, completed: nil)
        
    }
    
}
