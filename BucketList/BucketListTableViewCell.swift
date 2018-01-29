//
//  BucketListTableViewCell.swift
//  BucketList
//
//  Created by Matthew Jerdidah Hansen on 28/01/2018.
//  Copyright © 2018 Matthew Jerdidah Hansen. All rights reserved.
//

import UIKit

class BucketListTableViewCell: UITableViewCell {

    @IBOutlet weak var ThumbImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
