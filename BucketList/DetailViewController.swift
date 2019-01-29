//
//  DetailViewController.swift
//  BucketList
//
//  Created by Matthew Jerdidah Hansen on 06/02/2018.
//  Copyright © 2018 Matthew Jerdidah Hansen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var getTitle = String()
    var getImage = UIImage()
    var getDescription = String()
    
    @IBOutlet weak var ThumbImage: UIImageView!
    @IBOutlet weak var Description: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ThumbImage.image = getImage
        Description.text = getDescription
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
