

import UIKit
import SDWebImage

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = "HourlyCell"
    
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
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
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstrainToContentView()
    }
    
    private func setupConstrainToContentView(){
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            timeLabel.heightAnchor.constraint(equalTo: timeLabel.widthAnchor, multiplier: 1)

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
        convertDateFormatter.dateFormat = "HH"
        
        return convertDateFormatter.string(from: oldDate!)
    }
    
    func configure(with weather: ListHourly){
        timeLabel.text = currentTime(inputDate: weather.dtTxt)
        //timeLabel.text = currentTime(inputDate: weather.dtTxt)
        print(timeLabel.text!)
        //
        //        imageView.image = UIImage(systemName: (weather.weather.first?.icon.rawValue ?? " "))
        //        guard let url = URL(string: "https://openweathermap.org/img/wn/\(weather.weather.first?.icon.rawValue ?? " ")@2x.png") else {return}
        //        imageView.sd_setImage(with: url, completed: nil)
        
    }
    
}
