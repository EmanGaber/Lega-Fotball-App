//
//  HomeVC+PresenterDelegate.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
extension HomeVC: TeamView {
    
    
    func showIndicator() {
        self.loading()
    }
    
    func hideIndicator() {
        self.killLoading()
    }
    
    func fetchingTeamsSuccess() {
        
        getFavTeams()
        
        btnTryConnect.isHidden = true
        tableView.isHidden = false
        saveTeamsIDatabase()
    }
    
    func getFavTeams()
    {
        let favTeamsDbArray = FavTeamDB.getAllTeams()
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
    
    func saveTeamsIDatabase()
    {
        for team in presenter.teamsArray ?? [] {
            
            let newObj :TeamDB = TeamDB.getTeamDBWithTeamObj(team: team)
            
            TeamDB.addOrUpdateTeam(newObj: newObj)
            
        }
        print("teams saved in db successfully")
        let teamsArray  = TeamDB.getAllTeams() //check if save successfully
        print(teamsArray.count)
    }
    
    func openTeamDetailsVc(teamId: Int) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamDetailsVC") as! TeamDetailsVC
        
        vc.teamID = teamId
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func showError(error: String) {
        self.showMessage(msg: error, type: .notification)
        tableView.isHidden = true
        
    }
    
    
}


