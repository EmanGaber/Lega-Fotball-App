//
//  SquadTCell.swift
//  Football League
//
//  Created by Eman Gaber on 12/1/20.
//

import UIKit

class SquadTCell: UITableViewCell {

    @IBOutlet var tshirt: UIImageView!
    @IBOutlet var teamLogo: UIImageView!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblTshirtNumber : UILabel!
    @IBOutlet weak var lblTshirtName : UILabel!
    @IBOutlet weak var lblPosition : UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblNationality: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
