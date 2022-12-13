//
//  SecondScreenViewController.swift
//  ForecastWeather
//
//  Created by Полина Жарова on 10.12.22.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var heightView: NSLayoutConstraint!
    
    @IBOutlet weak var viewHeader: UIView!
    var offsetY: CGFloat! = 200.0
    var header = UIView()
    
    @IBOutlet weak var tableViewHeader: UIView!
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
                    tableView.dataSource = self
                    tableView.delegate = self
                }
    }
    
    let data = [["apples", "oranges", "grape"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["apples", "oranges", "grape"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"], ["fruit", "kivi"],["tomato"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        //let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
       
//        //footer.backgroundColor = .green
        
        //tableView.tableFooterView = footer
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.sectionHeaderHeight = UITableView.automaticDimension
//        //header.rowHeight = UITableView.automaticDimension
//        header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
//        header.backgroundColor = .orange
//        tableView.tableHeaderView = header
        
       
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
                
    }

}



extension SecondScreenViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("check \(scrollView.contentOffset.y)")
        if heightView.constant > 250{
            heightView.constant +=  tableView.rowHeight
        }
        if heightView.constant < 299 && scrollView.contentOffset.y < 0 {
            heightView.constant +=  -(tableView.rowHeight)

        }
        // -97 ...20
        // 20 ..
        
//        heightView.constant = scrollView.contentInset.top
//        offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        //heightView.constant = offsetY >= 0 ? 0 : -offsetY / 2
        //heightView.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
        
        
        
//        while self.heightView.constant <= 100{
//            self.heightView.constant += tableView.rowHeight
//        }
        
//        if scrollView.contentOffset.y <= 45{
//            self.heightView.constant += tableView.rowHeight
//        } else {return}
//        repeat {
//            self.heightView.constant += tableView.rowHeight
//        } while self.heightView.constant == cons
        
   
//            if (scrollView.contentOffset.y > self.offsetY) {
//                self.tableView.tableHeaderView = nil
//            } else {
//                self.tableView.tableHeaderView = self.header
//            }
//            self.offsetY = scrollView.contentOffset.y
        }
//        if scrollView.contentOffset.y < 0{
//                    self.header.frame.origin.y = scrollView.contentOffset.y
//                    self.header.frame.size.height -= scrollView.contentOffset.y
//                }else{
//                    self.header.frame.size.height =   self.header.frame.size.height -  scrollView.contentOffset.y
//                    print(self.header.frame.size.height)
//                }
        
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
