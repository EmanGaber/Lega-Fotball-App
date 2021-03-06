//
//  FavouriteListVC+TableView.swift
//  Football League
//
//  Created by Eman Gaber on 10/24/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

import UIKit

extension FavouriteListVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "TeamTCell", bundle: nil), forCellReuseIdentifier: "TeamTCell")


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.teamsArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return 125

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamTCell", for: indexPath) as! TeamTCell
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = bgColorView
            
            configureTeamCell(cell: cell, for: indexPath.row)
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.didSelectTeam(index: indexPath.row)
        
        
    }
    
    
    func configureTeamCell(cell: TeamTCell, for index: Int) {
        let team = presenter.teamsArray?[index]
        
            cell.logo.downloadedsvg(from:  URL(string: team?.crestUrl ?? "")!)
        
        
        cell.lblName.text = team?.name
        cell.btnWebsite.setTitle(team?.website, for: .normal)
        cell.lblVenu.text = "Venue: \(team?.venue ?? "")"
        cell.lblClubColors.text = "Club Colors: \(team?.clubColors ?? "")"
        cell.lblTxt.text = "Tla: \(team?.tla ?? "" )"
        
        cell.btnWebsite.addTarget(self, action: #selector(OpenWebsiteAction), for: .touchUpInside)
        cell.btnWebsite.tag = index

        cell.btnFav.addTarget(self, action: #selector(FavTeamAction), for: .touchUpInside)
        cell.btnFav.tag = index

            cell.btnFav.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)

        
    }
    
    @objc func OpenWebsiteAction(sender:UIButton)
    {
        let team = presenter.teamsArray?[sender.tag]
        OpenUrl(scheme: team?.website ?? "")
    }
    
    @objc func FavTeamAction(sender:UIButton)
    {
        let team = (presenter.teamsArray?[sender.tag])!
        
            // remove team from fav
        FavTeamDB.RemoveTeamFromFav(teamId: team.id!)
        presenter.teamsArray?.remove(at: sender.tag)
        tableView.reloadData()
        
    }
    
    
     func OpenUrl(scheme: String) {
      if let url = URL(string: scheme) {
         if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:],
              completionHandler: {
                  (success) in
                     print("Open \(scheme): \(success)")
              })
        } else {
            let success = UIApplication.shared.openURL(url)
            print("Open \(scheme): \(success)")
        }
      }
    }

    
}

