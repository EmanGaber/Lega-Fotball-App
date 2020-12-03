//
//  TeamTCell.swift
//  Football League
//
//  Created by Eman Gaber on 12/1/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

import UIKit

class TeamTCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var btnWebsite : UIButton!
    @IBOutlet weak var lblClubColors : UILabel!
    @IBOutlet weak var lblVenu : UILabel!
    @IBOutlet weak var lblTxt : UILabel!
    @IBOutlet weak var btnFav : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
