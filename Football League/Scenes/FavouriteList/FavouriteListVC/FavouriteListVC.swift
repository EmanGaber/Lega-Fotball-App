//
//  FavouriteListVC.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
import Presentr

class FavouriteListVC: BaseViewController{
   

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblNoFavYet: UILabel!
    
    var presenter: FavouriteListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = FavouriteListPresenter(view: self)
        presenter.getFavTeamListDB()
    }
 
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

