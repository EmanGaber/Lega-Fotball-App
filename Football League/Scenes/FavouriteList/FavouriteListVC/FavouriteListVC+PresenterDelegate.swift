//
//  FavouriteListVC+PresenterDelegate.swift
//  Football League
//
//  Created by Eman Gaber on 12/3/20.
//

import UIKit

extension FavouriteListVC: FavouriteListView {
    
    func fetchingFavTeamsSuccess() {
        if presenter.teamsArray?.count ?? 0 > 0 {
            lblNoFavYet.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
        }else
        {
            lblNoFavYet.isHidden = false
            
        }
    }
    
    func openTeamDetailsVc(teamId: Int) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TeamDetailsVC") as! TeamDetailsVC
        
        vc.teamID = teamId
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
