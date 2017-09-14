//
//  TableViewController.swift
//  TestinfCheckAndSearch
//
//  Created by Normand Martin on 17-09-12.
//  Copyright © 2017 Normand Martin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var okbutton: UIButton!
    var array = [["Swift", false, 0], ["teste", false, 1], ["linguagem", false, 2], ["objectivec", false, 3]]
    var arrayFilter: [Any] = []
    
    
    
    @IBAction func okButton(_ sender: Any) {
        var selection : [Int] = []
        for element in self.array {
            if element[1] as! Bool {
                selection.append(element[2] as! Int)
            }
        }
        print(selection)
    }
    
    

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // filter array with string that start with searchText
        print("changed")
        self.arrayFilter = array.filter{
            if let pos = ($0[0] as! String).lowercased().range(of: searchText.lowercased()) {
                return (pos.lowerBound == ($0[0] as! String).startIndex)
            }
            return false
        }
        tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

         searchBar.delegate = self as? UISearchBarDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchBar.text == "" ? self.array.count : self.arrayFilter.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let lista = self.searchBar.text == "" ? self.array : self.arrayFilter
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ok")
        let lista = self.searchBar.text == "" ? self.array : self.arrayFilter
        let idAnyArray = lista[indexPath.row] as! [Any]
        let id = idAnyArray[2] as! Int
        print(array[id][1])
        // invert the value of checked
        self.array[id][1] = !(array[id][1] as! Bool)
        self.searchBar.text = ""
        tableView.reloadData()
    }
 



}
