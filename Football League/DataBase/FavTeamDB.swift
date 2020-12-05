//
//  FavFavTeamDB.swift
//  Football League
//
//  Created by Eman Gaber on 12/2/20.
//


import Foundation
import RealmSwift

class FavTeamDB: Object {
    
    @objc dynamic var favTeamDB__id: Int = 0
    @objc dynamic var favTeamDB__name = ""
    @objc dynamic var favTeamDB__shortName = ""
    @objc dynamic var favTeamDB__tla = ""
    @objc dynamic var favTeamDB__website = ""
    @objc dynamic var favTeamDB__clubColors = ""
    @objc dynamic var favTeamDB__venue = ""
    @objc dynamic var favTeamDB__crestUrl = ""
    
    func primaryKey () -> String {
        return "favTeamDB__id"
    }
    
    class func getAllTeams() -> [TeamModel]
    {
        
        let realm = try! Realm()
        let allItems: Results<FavTeamDB> = { realm.objects(FavTeamDB.self) }()
        
        var Items  : [TeamModel] = []
        
        for i in 0 ..< allItems.count
        {
            var newObj = TeamModel()
            
            newObj.id = allItems[i].favTeamDB__id
            newObj.name = allItems[i].favTeamDB__name
            newObj.shortName = allItems[i].favTeamDB__shortName
            newObj.website = allItems[i].favTeamDB__website
            newObj.tla = allItems[i].favTeamDB__tla
            newObj.venue = allItems[i].favTeamDB__venue
            newObj.crestUrl = allItems[i].favTeamDB__crestUrl
            
            Items.append(newObj)
        }
        
        return Items
        
        
    }
    
    class func GetFavTeamDBWithTeamObj(team: TeamModel) -> FavTeamDB {
        
        let newObj = FavTeamDB()
        newObj.favTeamDB__id = team.id!
        newObj.favTeamDB__name = team.name ?? ""
        newObj.favTeamDB__shortName = team.shortName ?? ""
        newObj.favTeamDB__website = team.website ?? ""
        newObj.favTeamDB__tla = team.tla ?? ""
        newObj.favTeamDB__venue = team.venue ?? ""
        newObj.favTeamDB__crestUrl = team.crestUrl ?? ""
        
        return newObj
    }
    class func addOrUpdateTeamToFav(newObj : FavTeamDB)
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
    
    class func RemoveTeamFromFav(teamId : Int)
    {
        
        let realm = try! Realm()
        let allItems: Results<FavTeamDB> = { realm.objects(FavTeamDB.self).filter(NSPredicate.init(format: "favTeamDB__id = \(teamId)", argumentArray: []) )}()
        
        if allItems.count > 0
        {
            do {
                realm.beginWrite()
                realm.delete(allItems.first!)
                
                try realm.commitWrite() // This seems to fail sometimes
                print("deleting object successfully")
                
            }
            catch {
                print("Error while deleting object")
            }
        }
        
    }
}
