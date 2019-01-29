//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Matthew Jerdidah Hansen on 28/01/2018.
//  Copyright © 2018 Matthew Jerdidah Hansen. All rights reserved.
//

import UIKit

var Titles = [String]()
var Descriptions = [String]()
var Images = [String]()
var Dates = [String]()

class BucketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var BucketListTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredData = [String]()
    var isSearching = false
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        
        return (Titles.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BucketListTableViewCell
        
        if isSearching {
            cell.Title.text = filteredData[indexPath.row]
        } else {
            cell.Title.text = Titles[indexPath.row]
            cell.Description.text = Descriptions[indexPath.row]
            // cell.Date.text = Dates[indexPath.row]
            // cell.ThumbImage.image = UIImage(named: (Images[indexPath.row] + ".png"))
        }
        
        return (cell)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            Titles.remove(at: indexPath.row)
            BucketListTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        searchNavBar()
        // searchBar.delegate = self
        // searchBar.returnKeyType = UIReturnKeyType.done
        
        
//        self.cell.ThumbImage.layer.cornerRadius = ThumbImage.frame.size.height / 2.0
//        self.cell.ThumbImage.clipsToBounds = true
    }
    
    func searchNavBar () {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            
            BucketListTableView.reloadData()
        } else {
            isSearching = true
            filteredData = Titles.filter({$0 == searchBar.text})
            
            BucketListTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        BucketListTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
