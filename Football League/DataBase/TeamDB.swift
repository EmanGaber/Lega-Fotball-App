//
//  TeamDB.swift
//  Football League
//
//  Created by Eman Gaber on 12/2/20.
//


import Foundation
import RealmSwift

class TeamDB: Object {
    
    @objc dynamic var teamDB__id: Int = 0
    @objc dynamic var teamDB__name = ""
    @objc dynamic var teamDB__shortName = ""
    @objc dynamic var teamDB__tla = ""
    @objc dynamic var teamDB__website = ""
    @objc dynamic var teamDB__clubColors = ""
    @objc dynamic var teamDB__venue = ""
    @objc dynamic var teamDB__crestUrl = ""
    
    func primaryKey () -> String {
        return "teamDB__id"
    }
    
    class func GetAllTeams() -> [TeamModel]
    {
        
        let realm = try! Realm()
        let allItems: Results<TeamDB> = { realm.objects(TeamDB.self) }()
        
        var Items  : [TeamModel] = []
        
        for i in 0 ..< allItems.count
        {
            var newObj = TeamModel()
            
            newObj.id = allItems[i].teamDB__id
            newObj.name = allItems[i].teamDB__name
            newObj.shortName = allItems[i].teamDB__shortName
            newObj.website = allItems[i].teamDB__website
            newObj.tla = allItems[i].teamDB__tla
            newObj.venue = allItems[i].teamDB__venue
            newObj.crestUrl = allItems[i].teamDB__crestUrl
            
            Items.append(newObj)            
        }
        
        return Items
        
        
    }
    
    class func GetTeamDBWithTeamObj(team: TeamModel) -> TeamDB {
        
        let newObj = TeamDB()
        newObj.teamDB__id = team.id!
        newObj.teamDB__name = team.name ?? ""
        newObj.teamDB__shortName = team.shortName ?? ""
        newObj.teamDB__website = team.website ?? ""
        newObj.teamDB__tla = team.tla ?? ""
        newObj.teamDB__venue = team.venue ?? ""
        newObj.teamDB__crestUrl = team.crestUrl ?? ""
        
        return newObj
    }
    
    class func AddOrUpdateTeam(newObj : TeamDB)
    {
        let realm = try! Realm()
        
        do {
            realm.beginWrite()
            realm.add(newObj)
            
            try realm.commitWrite() // This seems to fail sometimes
            print("adding object successfully")
            
        } catch {
            print("Error while adding object")
        }
        
    }
    
    
    
    
}
