//
//  SquadDB.swift
//  Football League
//
//  Created by Eman Gaber on 12/2/20.
//

import Foundation
import RealmSwift

class SquadDB: Object {
    
    @objc dynamic var SquadDB__id: Int = 0
    @objc dynamic var SquadDB__name = ""
    @objc dynamic var SquadDB__position = ""
    @objc dynamic var SquadDB__dateOfBirth = ""
    @objc dynamic var SquadDB__countryOfBirth = ""
    @objc dynamic var SquadDB__nationality = ""
    @objc dynamic var SquadDB__shirtNumber = 0
    @objc dynamic var SquadDB__role = ""
    
    
    func primaryKey () -> String {
        return "SquadDB__id"
    }
}

