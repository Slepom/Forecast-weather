//
//  SecondScreenViewController.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 10.12.22.
//

import UIKit

class SecondScreenViewController: UIViewController {

    
    
    
    @IBOutlet weak var tableViewHeader: UIView!
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
                    tableView.dataSource = self
                    tableView.delegate = self
                }
    }
    
    let data = [["apples", "oranges", "grape"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
//        //let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
//        header.backgroundColor = .orange
//        //footer.backgroundColor = .green
        //tableView.tableHeaderView = header
        //tableView.tableFooterView = footer
      
        
       
    }
    

 

}



extension SecondScreenViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("check \(scrollView.contentOffset.y)")
        print(tableView.sectionHeaderHeight)
        tableView.sectionHeaderHeight = 100.0 + scrollView.contentOffset.y
        ///self.tableViewHeader.bounds.height = self.tableViewHeader.bounds.height - scrollView.contentOffset.y
        
    }
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
