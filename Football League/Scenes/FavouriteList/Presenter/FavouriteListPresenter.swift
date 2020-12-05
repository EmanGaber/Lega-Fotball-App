//
//  FavouriteListPresenter.swift
//  Football League
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol FavouriteListView: class {
    func fetchingFavTeamsSuccess()
    func openTeamDetailsVc(teamId:Int)
}


class FavouriteListPresenter {
    
    private weak var view: FavouriteListView?
    private let interactor = FavouriteListInteractor()
    var teamsArray :[TeamModel]?
    
    init(view: FavouriteListView?) {
        self.view = view
    }
    
    func getFavTeamListDB()
    {
        // get saved data
        teamsArray = FavTeamDB.getAllTeams()
        view?.fetchingFavTeamsSuccess()
    }
    
    func didSelectTeam(index: Int) {
        view?.openTeamDetailsVc(teamId:teamsArray?[index].id ?? 0)
        
    }
    
}



