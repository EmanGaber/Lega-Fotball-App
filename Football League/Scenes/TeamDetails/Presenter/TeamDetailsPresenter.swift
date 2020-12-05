//
//  TeamDetailsPresenter.swift
//  Football League
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol TeamDetailsView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingTeamDetailsSuccess()
    func showError(error: String)
    
}

class TeamDetailsPresenter {
    
    private weak var view: TeamDetailsView?
    private let interactor = TeamDetailsInteractor()
    var teamsDetailsObj :TeamDetailsModel?
    
    init(view: TeamDetailsView?) {
        self.view = view
    }
   
    
    // MARK: Api
    func GetTeamDetailsApi(teamID:Int) {
        if Reachability.isConnectedToNetwork(){
        view?.showIndicator()
        interactor.GetTeamDetailsApi( teamID:teamID) { [self] teamDetailsModel, error in
            
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error)
            } else {
                self.teamsDetailsObj = teamDetailsModel
                
                self.view?.fetchingTeamDetailsSuccess()
                
            }
        }
        }
    else
        {
            self.view?.showError(error: "Internet Connection Not Available!")
           
        }

    }
    
    func GetPlayerAgeFromHisBirthday(BirthDay:String) -> String
    {
        let dateFormatter : DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                formatter.locale = Locale(identifier: "en_US_POSIX")
                return formatter
            }()

        let birthday = dateFormatter.date(from: BirthDay)
       guard let timeInterval = birthday?.timeIntervalSinceNow else
       {
        return ""
        
       }
        let age = abs(Int(timeInterval / 31556926.0))
        
        return "\(age)"
    }
}


