//
//  MovieCell.swift
//  Flix_demo_03
//
//  Created by Jetry Dumont on 9/18/18.
//  Copyright © 2018 Wendy Jean. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titlelLabel: UILabel!
    
    
    @IBOutlet weak var overview_Label: UILabel!
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
