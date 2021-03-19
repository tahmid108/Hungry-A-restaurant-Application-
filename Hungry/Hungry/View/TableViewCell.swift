//
//  TableViewCell.swift
//  Hungry
//
//  Created by kuet on 8/12/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblArtist: UILabel!
    
    @IBOutlet var lblrest: UILabel!
    @IBOutlet var lblTrack: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
