//
//  TeamDetailsVC.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class TeamDetailsVC: BaseViewController {
    
    @IBOutlet weak var btnTryConnect: UIButton!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var teamDate: UILabel!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlayerList: UILabel!
    
    var teamID = 0
    var presenter: TeamDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = TeamDetailsPresenter(view: self)
        
        if Reachability.isConnectedToNetwork(){
            GetApi()
        }
        else
        {
            
            // get saved data
            let detailsObj = TeamDetailsDB.GetTeamDetailsDB(teamID: teamID)
            
            if detailsObj != nil
            {
                var teamsDetails = TeamDetailsModel()
                teamsDetails.id = detailsObj?.teamDetailsDB__id
                teamsDetails.name = detailsObj?.teamDetailsDB__name
                teamsDetails.shortName = detailsObj?.teamDetailsDB__shortName
                teamsDetails.tla = detailsObj?.teamDetailsDB__tla
                teamsDetails.crestUrl = detailsObj?.teamDetailsDB__crestUrl
                teamsDetails.address = detailsObj?.teamDetailsDB__address
                teamsDetails.phone = detailsObj?.teamDetailsDB__phone
                teamsDetails.website = detailsObj?.teamDetailsDB__website
                teamsDetails.email = detailsObj?.teamDetailsDB__email
                teamsDetails.founded = detailsObj?.teamDetailsDB__founded
                teamsDetails.clubColors = detailsObj?.teamDetailsDB__clubColors
                teamsDetails.venue = detailsObj?.teamDetailsDB__venue
                
                var squadArray:[SquadModel] = []
                
                if detailsObj?.teamDetailsDB__squad.count ?? 0 > 0{
                    for index in 0 ..< (detailsObj?.teamDetailsDB__squad.count)!
                {
                    let squadDB = detailsObj?.teamDetailsDB__squad[index]
                    
                    var newSquadModel = SquadModel()
                    newSquadModel.id = squadDB?.SquadDB__id
                    newSquadModel.name = squadDB?.SquadDB__name
                    newSquadModel.position = squadDB?.SquadDB__position
                    newSquadModel.dateOfBirth = squadDB?.SquadDB__dateOfBirth
                    newSquadModel.countryOfBirth = squadDB?.SquadDB__countryOfBirth
                    newSquadModel.nationality = squadDB?.SquadDB__nationality
                    newSquadModel.shirtNumber = squadDB?.SquadDB__shirtNumber
                    newSquadModel.role = squadDB?.SquadDB__role
                    
                    
                    squadArray.append(newSquadModel)
                }
                }
                
                teamsDetails.squad = squadArray
                
                presenter.teamsDetailsObj = teamsDetails
                
                SetViewData()
                
                btnTryConnect.isHidden = true
                tableView.isHidden = false
                lblName.isHidden = false
                teamImg.isHidden = false
                lblPlayerList.isHidden = false
            }else
            {
                btnTryConnect.isHidden = false
                tableView.isHidden = true
                lblName.isHidden = true
                teamImg.isHidden = true
                lblPlayerList.isHidden = true
                
            }
        }
        
    }
    
    func GetApi(){
        //call api
        presenter.GetTeamDetailsApi(teamID:teamID )
        
    }
    
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TryConnect()
    {
        GetApi()
    }
}
