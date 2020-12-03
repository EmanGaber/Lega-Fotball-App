//
//  TeamsDataModel.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import Foundation

struct TeamsDataModel: Codable {
    
    var teams:[TeamModel]?
    
    init(response: [String: Any]?) {
        guard let response = response else {
            return
        }
        if let data = try? JSONSerialization.data(withJSONObject: response, options: []) {
            if let response = try? JSONDecoder().decode(TeamsDataModel.self, from: data) {
                self.teams = response.teams
            }
        }
    }
}


struct TeamModel: Codable {
    
    var id:Int?
    var name:String?
    var shortName:String?
    var tla:String?
    var website:String?
    var clubColors:String?
    var venue:String?
    var crestUrl:String?
    
}

