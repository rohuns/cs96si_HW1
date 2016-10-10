//
//  HealthFinderTableViewCell.swift
//  HealthFinder
//
//  Created by Rohun Saxena on 10/8/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit

class HealthFinderTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backgroundImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
