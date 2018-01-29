//
//  BucketListViewController.swift
//  BucketList
//
//  Created by Matthew Jerdidah Hansen on 28/01/2018.
//  Copyright © 2018 Matthew Jerdidah Hansen. All rights reserved.
//

import UIKit

var Titles = ["Buy Rolex", "Nike Roshe 2", "Spiritual"]
var Descriptions = ["My firts description goint in here", "My second description goint in here", "My third description goint in here"]
let Images = ["ghost", "ghost", "ghost"]
var Dates = ["25/01/2018", "25/01/2018", "25/01/2018"]

class BucketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var BucketListTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Titles.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BucketListTableViewCell
        cell.Title.text = Titles[indexPath.row]
        cell.Description.text = Descriptions[indexPath.row]
        // cell.Date.text = Dates[indexPath.row]
        // cell.ThumbImage.image = UIImage(named: (Images[indexPath.row] + ".png"))
        
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
    }
    
    func searchNavBar () {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        
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
