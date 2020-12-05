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
    
    func showIndicator() {
        self.loading()
    }
    
    func hideIndicator() {
        self.killLoading()
    }
    
    func fetchingTeamDetailsSuccess() {
        setViewData()
        saveTeamDetailsInDatabase()
    }
    
    func fetchingTeamDetailsDBSuccess() {
        setViewData()
    }
    
    func setViewData()
    {
        tableView.isHidden = false
        lblName.isHidden = false
        teamImg.isHidden = false
        lblPlayerList.isHidden = false
        
        if presenter.teamsDetailsObj?.crestUrl != nil {
            teamImg.downloadedsvg(from:  URL(string: presenter.teamsDetailsObj?.crestUrl ?? "")!)
            
        }
        
        lblName.text = presenter.teamsDetailsObj?.name
        guard let value = presenter.teamsDetailsObj?.founded! else {
            return
        }
        teamDate.text = "\(value)"
        tableView.reloadData()
        
        tableViewHeight.constant = CGFloat((presenter.teamsDetailsObj?.squad!.count)! * 150)
        viewHeight.constant += (tableViewHeight.constant - 543)
        self.view.layoutIfNeeded()
        
    }
    
    
    func saveTeamDetailsInDatabase()
    {
        
        let newObj :TeamDetailsDB = TeamDetailsDB.getTeamDetailsDBWithTeamDetailsObj(team:  presenter.teamsDetailsObj!)
        
        TeamDetailsDB.addOrUpdateTeamDetails(newObj: newObj)
        
        
    }
    
    func showError(error: String) {
        self.showMessage(msg: error, type: .notification)
        
        btnTryConnect.isHidden = false
        tableView.isHidden = true
        lblName.isHidden = true
        teamImg.isHidden = true
        lblPlayerList.isHidden = true
    }
    
    
}


