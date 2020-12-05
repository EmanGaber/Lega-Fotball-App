//
//  TeamPresenter.swift
//  Football League
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation
protocol TeamView: class {
    
    func showIndicator()
    func hideIndicator()
    func fetchingTeamsSuccess()
    func showError(error: String)
    func openTeamDetailsVc(teamId:Int)
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
        view?.showIndicator()
        interactor.GetTeamsApi(competitionCode:competitionCode) { [self] teamsDataModel, error in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error)
            } else {
                self.teamsArray = teamsDataModel?.teams
                
                self.view?.fetchingTeamsSuccess()
                
            }
        }
        }
        else
        {
            self.view?.showError(error: "Internet Connection Not Available!")
            
        }
    }
    
    
    func didSelectTeam(index: Int) {
        guard let teamId = teamsArray?[index].id else {
            return
        }
        
        view?.openTeamDetailsVc(teamId: teamId)
        
    }
    
}


