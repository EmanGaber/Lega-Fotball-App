//
//  HomeVC+PresenterDelegate.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
extension HomeVC: TeamView {
    
    
    func ShowIndicator() {
        self.loading()
    }
    
    func HideIndicator() {
        self.killLoading()
    }
    
    func FetchingTeamsSuccess() {
       
        GetFavTeams()

        btnTryConnect.isHidden = true
        tableView.isHidden = false
        SaveTeamsIDatabase()
    }
  
    func GetFavTeams()
    {
        let favTeamsDbArray = FavTeamDB.GetAllTeams()
        if favTeamsDbArray.count > 0
        {
            var isFav = false
            for team in presenter.teamsArray ?? []
            {
                isFav = false
                for teamFavDB in favTeamsDbArray
                {
                    if team.id == teamFavDB.id
                    {
                        isFav = true
                    }
                    
                }
                favArray.append(isFav)

            }
            

        }else
        {
            for _ in presenter.teamsArray ?? []
            {
                favArray.append(false)
            }
        }
        
        tableView.reloadData()
        
    }
    func SaveTeamsIDatabase()
    {
        for team in presenter.teamsArray ?? [] {
            
            let newObj :TeamDB = TeamDB.GetTeamDBWithTeamObj(team: team)
            
            TeamDB.AddOrUpdateTeam(newObj: newObj)
            
        }
        print("teams saved in db successfully")
        let teamsArray  = TeamDB.GetAllTeams() //check if save successfully
        print(teamsArray.count)
    }
    
    func OpenTeamDetailsVc(teamId: Int) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamDetailsVC") as! TeamDetailsVC
        
        vc.teamID = teamId
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func ShowError(error: String) {
        self.showMessage(msg: error, type: .notification)
        tableView.isHidden = true
        
    }
    
    
}


