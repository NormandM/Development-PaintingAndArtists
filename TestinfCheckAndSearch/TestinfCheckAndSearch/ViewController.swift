//
//  ViewController.swift
//  TestinfCheckAndSearch
//
//  Created by Normand Martin on 17-09-12.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var arrayFilter: [Any] = []
    var arrayVerbe: [[String]] = []
    var infinitif: [String] = []
    var infinitifAny: [[Any]] = []
    var transition = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        if let plistPath = Bundle.main.path(forResource: "frenchVerbsList", ofType: "plist"),
            let verbArray = NSArray(contentsOfFile: plistPath){
            arrayVerbe = verbArray as! [[String]]
        }
        for verbe in arrayVerbe {
            if infinitif.contains(verbe[2]){
            }else{
                infinitif.append(verbe[2])
            }
        }
        
        func alpha (_ s1: String, s2: String) -> Bool {
            return s1 < s2
        }
        infinitif = infinitif.sorted(by: alpha)
        var n = 0
        for inf in infinitif {
            
            infinitifAny.append([inf, false, n])
            
            n = n + 1
        }
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // filter array with string that start with searchText
        self.arrayFilter = infinitifAny.filter{
            if let pos = ($0[0] as! String).lowercased().range(of: searchText.lowercased()) {
                return (pos.lowerBound == ($0[0] as! String).startIndex)
            }
            return false
        }
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchBar.text == "" ? self.infinitifAny.count : self.arrayFilter.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let lista = self.searchBar.text == "" ? self.infinitifAny : self.arrayFilter
        let cellAnyArray = lista[indexPath.row] as! [Any]
        let cellText = cellAnyArray[0] as! String
        cell.textLabel?.text = cellText
        // check cell based on second field
        let cellCheck = cellAnyArray[1] as! Bool
        if cellCheck{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var lista = self.searchBar.text == "" ? self.infinitifAny : self.arrayFilter
        let idAnyArray = lista[indexPath.row] as! [Any]
        let id = idAnyArray[2] as! Int
        // invert the value of checked
        self.infinitifAny[id][1] = !(infinitifAny[id][1] as! Bool)
        lista = self.searchBar.text == "" ? self.infinitifAny : self.arrayFilter
        let cellAnyArray = lista[indexPath.row] as! [Any]
        let cellCheck = cellAnyArray[1] as! Bool
        let cell = tableView.cellForRow(at: indexPath)
        if cellCheck{
            cell?.accessoryType = .checkmark
        }else{
            cell?.accessoryType = .none
        }

        self.searchBar.text! = ""
        tableView.reloadData()
        //cell?.accessoryType = .checkmark
        //self.tableView.reloadRows(at: [indexPath], with: .automatic)
        choix()
    }
    func choix() {
        var selection : [Int] = []
        var verbesChoisi: [String] = []
        for element in self.infinitifAny {
            if element[1] as! Bool {
                selection.append(element[2] as! Int)
                verbesChoisi.append(element[0] as! String)
            
            }
        }
        print(selection)
        print(verbesChoisi)

    }
    

}
