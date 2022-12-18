//
//  SecondScreenViewController.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 10.12.22.
//

import UIKit

class SecondScreenViewController: UIViewController, UINavigationBarDelegate {
    
    @IBOutlet weak var heightView: NSLayoutConstraint!
    
    //    private let titleLabel: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.numberOfLines = 0
    //        label.textAlignment = .left
    //        label.textColor = .white
    //        label.text = "CityName"
    //        label.textAlignment = .center
    //        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
    //        return label
    //    }()
    //    private let temperatureLabel: UILabel = {
    //        let label = UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.numberOfLines = 0
    //        label.textAlignment = .left
    //        label.textColor = .white
    //        label.text = "Temp"
    //        label.textAlignment = .center
    //        label.font = UIFont.systemFont(ofSize: 36, weight: .regular)
    //        return label
    //    }()
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var viewHeader: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!{
            didSet {
                        tableView.dataSource = self
                        tableView.delegate = self
                    }
    }
    
    let data = [["1", "2", "3"], ["4", "5"],["6"], ["7", "8"],["9"], ["10", "11"],["12"], ["13", "14"],["15"], ["16", "17"],["18"], ["19", "20", "21"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        //self.navigationController?.isNavigationBarHidden = true

        
        
        //        //let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        
        //        //footer.backgroundColor = .green
        
        //tableView.tableFooterView = footer
        //        tableView.rowHeight = UITableView.automaticDimension
        //        tableView.sectionHeaderHeight = UITableView.automaticDimension
        //        //header.rowHeight = UITableView.automaticDimension
        //        header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        //        header.backgroundColor = .orange
        //        tableView.tableHeaderView = header
       // navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //setupConstrain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
    }
    
    //    private func setupConstrain(){
    //        viewHeader.addSubview(titleLabel)
    //        viewHeader.addSubview(temperatureLabel)
    //
    //        NSLayoutConstraint.activate([
    //            titleLabel.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 0),
    //            titleLabel.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: 0),
    //            titleLabel.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 100),
    //            titleLabel.heightAnchor.constraint(equalToConstant: 30),
    //            temperatureLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
    //            temperatureLabel.leftAnchor.constraint(equalTo: viewHeader.leftAnchor, constant: 0),
    //            temperatureLabel.rightAnchor.constraint(equalTo: viewHeader.rightAnchor, constant: 0),
    //            temperatureLabel.heightAnchor.constraint(equalToConstant: 80)
    //
    //
    //
    //
    //        ])
    //    }
    
    func configureMainView(cityCurrentWeather: CurrentWeatherModel){
        self.cityLabel.text = cityCurrentWeather.name
        self.descriptionLabel.text = cityCurrentWeather.weather?.description
        guard let temperature = cityCurrentWeather.main else {return}
        self.tempLabel.text = String(temperature.temp)
        self.maxTempLabel.text = String(temperature.tempMax)
        self.minTempLabel.text = String(temperature.tempMin)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}



extension SecondScreenViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("check \(scrollView.contentOffset.y)")
        
        
        
        
        if scrollView.contentOffset.y > 0 && heightView.constant > 250{
            heightView.constant +=  (tableView.rowHeight - 2)
            
        }
        if scrollView.contentOffset.y < 10 && heightView.constant < 400{
            heightView.constant -=  (tableView.rowHeight - 2)
        }
        
    }
    
}
func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    return 80
}




extension SecondScreenViewController: UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.backgroundColor = .red
        return cell
    }
    
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //            let rect = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 20)
    //            let footerView = UIView(frame:rect)
    //            footerView.backgroundColor = UIColor.clear
    //            return footerView
    //        }
    //        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //            return 0.0
    //        }
}
