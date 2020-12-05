//
//  TeamDetailsDB.swift
//  Football League
//
//  Created by Eman Gaber on 12/2/20.
//

import Foundation
import RealmSwift
import Realm

class TeamDetailsDB: Object {
    
    @objc dynamic var teamDetailsDB__id: Int = 0
    @objc dynamic var teamDetailsDB__name = ""
    @objc dynamic var teamDetailsDB__shortName = ""
    @objc dynamic var teamDetailsDB__tla = ""
    @objc dynamic var teamDetailsDB__crestUrl = ""
    @objc dynamic var teamDetailsDB__address = ""
    @objc dynamic var teamDetailsDB__phone = ""
    @objc dynamic var teamDetailsDB__website = ""
    @objc dynamic var teamDetailsDB__email = ""
    @objc dynamic var teamDetailsDB__founded = 0
    @objc dynamic var teamDetailsDB__clubColors = ""
    @objc dynamic var teamDetailsDB__venue = ""
    var teamDetailsDB__squad = List<SquadDB>()

    
    func primaryKey () -> String {
        return "teamDetailsDB__id"
    }
    
    class func getTeamDetailsDB (teamID: Int) -> TeamDetailsDB?
    {

        let realm = try! Realm()
        let allItems: Results<TeamDetailsDB> = { realm.objects(TeamDetailsDB.self).filter(NSPredicate.init(format: "teamDetailsDB__id = \(teamID)", argumentArray: []) )}()
        
        if allItems.count > 0
        {
            print(allItems.first!.teamDetailsDB__squad.count)
            return (allItems.first!)

        }else
        {
            return nil
        }

    }
    
    
    class func getTeamDetailsDBWithTeamDetailsObj(team: TeamDetailsModel) -> TeamDetailsDB {
        
        let newObj = TeamDetailsDB()
        newObj.teamDetailsDB__id = team.id!
        newObj.teamDetailsDB__name = team.name ?? ""
        newObj.teamDetailsDB__shortName = team.shortName ?? ""
        newObj.teamDetailsDB__tla = team.tla ?? ""
        newObj.teamDetailsDB__crestUrl = team.crestUrl ?? ""
        newObj.teamDetailsDB__address = team.address ?? ""
        newObj.teamDetailsDB__phone = team.phone ?? ""
        newObj.teamDetailsDB__website = team.website ?? ""
        newObj.teamDetailsDB__email = team.email ?? ""
        newObj.teamDetailsDB__founded = team.founded ?? 0
        newObj.teamDetailsDB__clubColors = team.clubColors ?? ""
        newObj.teamDetailsDB__venue = team.venue ?? ""
       
        let arrayOfSquad = List<SquadDB>()
        
        for squad in team.squad ?? [] {
            
            let squadModel = SquadDB()
            squadModel.SquadDB__id = squad.id!
            squadModel.SquadDB__name = squad.name ?? ""
            squadModel.SquadDB__role = squad.role ?? ""
            squadModel.SquadDB__position = squad.position ?? ""
            squadModel.SquadDB__nationality = squad.name ?? ""
            squadModel.SquadDB__shirtNumber = squad.shirtNumber ?? 0
            squadModel.SquadDB__dateOfBirth = squad.dateOfBirth ?? ""
            squadModel.SquadDB__countryOfBirth = squad.countryOfBirth ?? ""

            arrayOfSquad.append(squadModel)
        }
        
        newObj.teamDetailsDB__squad = arrayOfSquad

        return newObj
    }
    
    class func addOrUpdateTeamDetails(newObj : TeamDetailsDB)
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

