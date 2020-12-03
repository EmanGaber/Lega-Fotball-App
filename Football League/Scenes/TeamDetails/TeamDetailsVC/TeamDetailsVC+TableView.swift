//
//  TeamDetailsVC+TableView.swift
//  Football League
//
//  Created by Eman Gaber on 12/1/20.
//

import UIKit

extension TeamDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "SquadTCell", bundle: nil), forCellReuseIdentifier: "SquadTCell")


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.teamsDetailsObj?.squad?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        return 150

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "SquadTCell", for: indexPath) as! SquadTCell
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = bgColorView
            
            configureSquadCell(cell: cell, for: indexPath.row)
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //presenter.didSelectTeam(index: indexPath.row)
        
        
    }
    
    
    func configureSquadCell(cell: SquadTCell, for index: Int) {
        let squad = presenter.teamsDetailsObj?.squad?[index]
        
        cell.lblName.text = squad?.name ?? ""
        let nameArray = squad?.name?.split(separator: " ")
        
        cell.lblTshirtName.text = "\(nameArray?.first ?? "")"
        cell.lblPosition.text = "Position: \(squad?.position  ?? "")"
        cell.lblNationality.text = "Nationality: \(squad?.nationality ?? "")"

        cell.teamLogo.downloadedsvg(from:  URL(string: presenter.teamsDetailsObj?.crestUrl ?? "")!)

        
        let birthdayArray = squad?.dateOfBirth!.split(separator: "T")
        let age = presenter.GetPlayerAgeFromHisBirthday(BirthDay: String(birthdayArray?.first ?? ""))
        cell.lblAge.text = "Age: \(age) Years"

        
        let clubColorsArray = presenter.teamsDetailsObj?.clubColors?.split(separator: "/")
        
        let clubColorsArray2 = clubColorsArray!.first!.split(separator: " ")
        
        cell.tshirt.tintColor = "\(clubColorsArray2.first ?? "White")".ColorName
        

            let clubColors = clubColorsArray![1].split(separator: " ")

            cell.lblTshirtName.textColor = "\(clubColors.first ?? "White")".ColorName
            cell.lblTshirtNumber.textColor = "\(clubColors.first ?? "White" )".ColorName

        if squad?.shirtNumber == nil || squad?.shirtNumber  == 0
        {
            cell.lblTshirtNumber.text = "\(index + 1 )"
        }else
        {
            cell.lblTshirtNumber.text = "\(squad?.shirtNumber ?? 0)"

        }
    }
    
    

}

