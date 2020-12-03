//
//  TeamDetailsModel.swift
//  Football League
//
//  Created by Eman Gaber on 11/30/20.
//

import Foundation

struct TeamDetailsModel: Codable {
    
    var id:Int?
    var name:String?
    var shortName:String?
    var tla:String?
    var crestUrl:String?
    var address:String?
    var phone:String?
    var website:String?
    var email:String?
    var founded:Int?
    var clubColors:String?
    var venue:String?
    var squad:[SquadModel]?
    
//    init(response: [String: Any]?) {
//        guard let response = response else {
//            return
//        }
//        if let data = try? JSONSerialization.data(withJSONObject: response, options: []) {
//            if let response = try? JSONDecoder().decode(TeamDetailsModel.self, from: data) {
//                self.id = response.id
//                self.name = response.name
//                self.shortName = response.shortName
//                self.tla = response.tla
//                self.crestUrl = response.crestUrl
//                self.address = response.address
//                self.phone = response.phone
//                self.website = response.website
//                self.email = response.email
//                self.clubColors = response.clubColors
//                self.venue = response.venue
//                self.founded = response.founded
//                self.squad = response.squad
//            }
//        }
//    }
}


struct SquadModel: Codable {
    var id:Int?
    var name:String?
    var position:String?
    var dateOfBirth:String?
    var countryOfBirth:String?
    var nationality:String?
    var shirtNumber:Int?
    var role:String?
}
