//
//  ReviewsTableViewCell.swift
//  MoviesList_Swift
//
//  Created by Mai Alaa on 5/20/19.
//  Copyright © 2019 ITI.MAD. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var contentTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
