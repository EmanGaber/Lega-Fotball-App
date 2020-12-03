//
//  TeamInteractor.swift
//  Football League
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TeamInteractor {
    
    func GetTeamsApi( competitionCode:String, completionHandler: @escaping (TeamsDataModel?, String?) -> ()){
        
       
        let URL = baseUrl + teamsURL
        
        
        let headers: HTTPHeaders = [.contentType("application/x-www-form-urlencoded"), .accept("application/json"),.init(name: "X-Auth-Token", value: "67939460d0334031b6fe58e3e4c557a2")]
        
        
        AFWrapper.requestGETURL(URL, headers: headers, params: nil,success: { ( response) in
            
            print(response)
            guard let data = response?.data else { return }
            do {
                let result = try JSONDecoder().decode(TeamsDataModel.self, from: data)
                
                completionHandler(result, nil)
                
            } catch let error {
                completionHandler(nil, error.localizedDescription)
                
            }
        }) { (Error) in
            
            completionHandler(nil, Error.localizedDescription)
            
        }
        }
        
    
}
