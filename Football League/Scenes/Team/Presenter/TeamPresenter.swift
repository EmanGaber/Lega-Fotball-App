//
//  TeamPresenter.swift
//  Football League
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol TeamView: class {
    
    func ShowIndicator()
    func HideIndicator()
    func FetchingTeamsSuccess()
    func ShowError(error: String)
    func OpenTeamDetailsVc(teamId:Int)
}



class TeamPresenter {
    
    private weak var view: TeamView?
    private let interactor = TeamInteractor()
    var teamsArray: [TeamModel]?
    
    
    init(view: TeamView?) {
        self.view = view
    }
    
    
    
    // MARK: Api
    func GetTeamsApi(competitionCode:String) {
        
        if Reachability.isConnectedToNetwork(){
        view?.ShowIndicator()
        interactor.GetTeamsApi(competitionCode:competitionCode) { [self] teamsDataModel, error in
            
            self.view?.HideIndicator()
            if let error = error {
                self.view?.ShowError(error: error)
            } else {
                self.teamsArray = teamsDataModel?.teams
                
                self.view?.FetchingTeamsSuccess()
                
            }
        }
        }
        else
        {
            self.view?.ShowError(error: "Internet Connection Not Available!")
            
        }
    }
    
    
    func didSelectTeam(index: Int) {
        guard let teamId = teamsArray?[index].id else {
            return
        }
        
        view?.OpenTeamDetailsVc(teamId: teamId)
        
    }
    
}


