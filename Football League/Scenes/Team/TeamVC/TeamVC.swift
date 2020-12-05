//
//  HomeVC.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
import Presentr

class HomeVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnTryConnect: UIButton!
    var presenter: TeamPresenter!
    var favArray:[Bool] = []
    let compCode = "2021"
    
    override func viewWillAppear(_ animated: Bool) {
        favArray.removeAll()
        getFavTeams()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = TeamPresenter(view: self)
        
        if Reachability.isConnectedToNetwork(){
            btnTryConnect.isHidden = true
            callTeamsApi(competitionCode: compCode)
        }
        else
        {
            
            // get saved data
            presenter.teamsArray = TeamDB.getAllTeams()
            if presenter.teamsArray?.count ?? 0 > 0 {
                btnTryConnect.isHidden = true
                tableView.isHidden = false
                tableView.reloadData()
            }else
            {
                btnTryConnect.isHidden = false
                showError(error: "Internet Connection Not Available!")
                
            }
            
            
        }
        
    }
    
    
    func callTeamsApi(competitionCode:String){
        //call api
        presenter.GetTeamsApi(competitionCode: competitionCode)
    }
    
    
    @IBAction func tryConnect()
    {
        callTeamsApi(competitionCode: compCode)
    }
    
    @IBAction func openFavListVC()
    {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "FavouriteListVC") as! FavouriteListVC
        
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }
}

