//
//  ViewController.swift
//  TabelViewWithSearchBar
//
//  Created by mac on 4/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    var data = ["Cat","Bat","Rat","Sat","Lat","Mat","Zat","Ironman","Lion","Tiger","Pokemon","Digimon","Joker"]
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchingNames = [String]()
    var searching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingNames.count
            
        }else{
            return data.count
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if searching {
            cell?.textLabel?.text = searchingNames[indexPath.row ]
            
        }else{
            cell?.textLabel?.text = data[indexPath.row]

            
        }
        return cell!
    }
    
    
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = data.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
    }
}

