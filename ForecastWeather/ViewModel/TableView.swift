//
//  TableView.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 11.12.22.
//

import UIKit

class TableView: UITableView {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let header = tableHeaderView else {return}
        let offsetY = -contentOffset.y
        header.clipsToBounds = offsetY <= 0
    }
    
}
