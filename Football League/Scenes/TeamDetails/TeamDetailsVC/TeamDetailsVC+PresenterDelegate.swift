//
//  TeamDetailsVC+PresenterDelegate.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import Foundation
import Kingfisher
import SVGKit

extension TeamDetailsVC: TeamDetailsView {
   
    func ShowIndicator() {
        self.loading()
    }
    
    func HideIndicator() {
       self.killLoading()
    }
    
    func FetchingTeamDetailsSuccess() {
                
        SetViewData()
        SaveTeamDetailsInDatabase()
    }
    
    func FetchingTeamDetailsDBSuccess() {
        SetViewData()
    }
    
    func SetViewData()
    {
        tableView.isHidden = false
        lblName.isHidden = false
        teamImg.isHidden = false
        lblPlayerList.isHidden = false

        if presenter.teamsDetailsObj?.crestUrl != nil {
            teamImg.downloadedsvg(from:  URL(string: presenter.teamsDetailsObj?.crestUrl ?? "")!)
            
        }
        
        lblName.text = presenter.teamsDetailsObj?.name
        
        tableView.reloadData()

        tableViewHeight.constant = CGFloat((presenter.teamsDetailsObj?.squad!.count)! * 150)
        viewHeight.constant += (tableViewHeight.constant - 543)
        self.view.layoutIfNeeded()
        
    }
    
    
    func SaveTeamDetailsInDatabase()
    {
                   
        let newObj :TeamDetailsDB = TeamDetailsDB.GetTeamDetailsDBWithTeamDetailsObj(team:  presenter.teamsDetailsObj!)
            
        TeamDetailsDB.AddOrUpdateTeamDetails(newObj: newObj)
                  

    }
    
    func ShowError(error: String) {
     self.showMessage(msg: error, type: .notification)

        btnTryConnect.isHidden = false
        tableView.isHidden = true
        lblName.isHidden = true
        teamImg.isHidden = true
        lblPlayerList.isHidden = true
    }
    
    
}


