//
//  ExploreTableViewCell.swift
//  S7_Airbnb
//
//  Created by MAC06 on 25/11/21.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
 
    @IBOutlet weak var imageExplore: UIImageView!
    @IBOutlet weak var lblCountRating: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageExplore.layer.cornerRadius = 12
        imageExplore.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
