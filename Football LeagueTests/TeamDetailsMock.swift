//
//  TeamDetailsMock.swift
//  Football LeagueTests
//
//  Created by Eman Gaber on 12/3/20.
//


import Foundation
@testable import Football_League

class TeamDetailsMock {
    
     func getTeamDetails() -> [TeamDetailsModel]
     {
        let response = """
                        [
                                {
                                    "id": 68,
                                    "name": "Dani Ceballos",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1996-08-07T00:00:00Z",
                                    "countryOfBirth": "Spain",
                                    "nationality": "Spain",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 110,
                                    "name": "Thomas Partey",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1993-06-13T00:00:00Z",
                                    "countryOfBirth": "Ghana",
                                    "nationality": "Ghana",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 137,
                                    "name": "Sokratis Papastathopoulos",
                                    "position": "Defender",
                                    "dateOfBirth": "1988-06-09T00:00:00Z",
                                    "countryOfBirth": "Greece",
                                    "nationality": "Greece",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3174,
                                    "name": "Bernd Leno",
                                    "position": "Goalkeeper",
                                    "dateOfBirth": "1992-03-04T00:00:00Z",
                                    "countryOfBirth": "Germany",
                                    "nationality": "Germany",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3180,
                                    "name": "Mesut Özil",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1988-10-15T00:00:00Z",
                                    "countryOfBirth": "Germany",
                                    "nationality": "Germany",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3230,
                                    "name": "Willian",
                                    "position": "Attacker",
                                    "dateOfBirth": "1988-08-09T00:00:00Z",
                                    "countryOfBirth": "Brazil",
                                    "nationality": "Brazil",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3244,
                                    "name": "Cédric",
                                    "position": "Defender",
                                    "dateOfBirth": "1991-08-31T00:00:00Z",
                                    "countryOfBirth": "Germany",
                                    "nationality": "Portugal",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3477,
                                    "name": "Granit Xhaka",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1992-09-27T00:00:00Z",
                                    "countryOfBirth": "Switzerland",
                                    "nationality": "Switzerland",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3755,
                                    "name": "Mohamed El Neny",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1992-07-11T00:00:00Z",
                                    "countryOfBirth": "Egypt",
                                    "nationality": "Egypt",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 3827,
                                    "name": "Rúnar Alex Rúnarsson",
                                    "position": "Goalkeeper",
                                    "dateOfBirth": "1995-02-18T00:00:00Z",
                                    "countryOfBirth": "Iceland",
                                    "nationality": "Iceland",
                                    "shirtNumber": 1,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7647,
                                    "name": "Pablo Marí",
                                    "position": "Defender",
                                    "dateOfBirth": "1993-08-31T00:00:00Z",
                                    "countryOfBirth": "Spain",
                                    "nationality": "Spain",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7779,
                                    "name": "Matt Macey",
                                    "position": "Goalkeeper",
                                    "dateOfBirth": "1994-09-09T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7783,
                                    "name": "Héctor Bellerín",
                                    "position": "Defender",
                                    "dateOfBirth": "1995-03-19T00:00:00Z",
                                    "countryOfBirth": "Spain",
                                    "nationality": "Spain",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7784,
                                    "name": "Rob Holding",
                                    "position": "Defender",
                                    "dateOfBirth": "1995-09-20T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7785,
                                    "name": "Shkodran Mustafi",
                                    "position": "Defender",
                                    "dateOfBirth": "1992-04-17T00:00:00Z",
                                    "countryOfBirth": "Germany",
                                    "nationality": "Germany",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7786,
                                    "name": "Sead Kolašinac",
                                    "position": "Defender",
                                    "dateOfBirth": "1993-06-20T00:00:00Z",
                                    "countryOfBirth": "Germany",
                                    "nationality": "Bosnia and Herzegovina",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7787,
                                    "name": "Calum Chambers",
                                    "position": "Defender",
                                    "dateOfBirth": "1995-01-20T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7792,
                                    "name": "Ainsley Maitland-Niles",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1997-08-29T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7797,
                                    "name": "Alexandre Lacazette",
                                    "position": "Attacker",
                                    "dateOfBirth": "1991-05-28T00:00:00Z",
                                    "countryOfBirth": "France",
                                    "nationality": "France",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7798,
                                    "name": "Joe Willock",
                                    "position": "Midfielder",
                                    "dateOfBirth": "1999-08-20T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7799,
                                    "name": "Reiss Nelson",
                                    "position": "Attacker",
                                    "dateOfBirth": "1999-12-10T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7800,
                                    "name": "Eddie Nketiah",
                                    "position": "Attacker",
                                    "dateOfBirth": "1999-05-30T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7801,
                                    "name": "Pierre-Emerick Aubameyang",
                                    "position": "Attacker",
                                    "dateOfBirth": "1989-06-18T00:00:00Z",
                                    "countryOfBirth": "France",
                                    "nationality": "Gabon",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 7805,
                                    "name": "David Luiz",
                                    "position": "Defender",
                                    "dateOfBirth": "1987-04-22T00:00:00Z",
                                    "countryOfBirth": "Brazil",
                                    "nationality": "Brazil",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 8412,
                                    "name": "Nicolas Pépé",
                                    "position": "Attacker",
                                    "dateOfBirth": "1995-05-29T00:00:00Z",
                                    "countryOfBirth": "France",
                                    "nationality": "Côte d’Ivoire",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 11619,
                                    "name": "Arteta",
                                    "position": null,
                                    "dateOfBirth": "1982-03-26T00:00:00Z",
                                    "countryOfBirth": "Spain",
                                    "nationality": "Spain",
                                    "shirtNumber": null,
                                    "role": "COACH"
                                },
                                {
                                    "id": 15615,
                                    "name": "Kieran Tierney",
                                    "position": "Defender",
                                    "dateOfBirth": "1997-06-05T00:00:00Z",
                                    "countryOfBirth": "Isle of Man",
                                    "nationality": "Scotland",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 23128,
                                    "name": "Gabriel",
                                    "position": "Defender",
                                    "dateOfBirth": "1997-12-19T00:00:00Z",
                                    "countryOfBirth": "Brazil",
                                    "nationality": "Brazil",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 61450,
                                    "name": "Martinelli",
                                    "position": "Attacker",
                                    "dateOfBirth": "2001-06-18T00:00:00Z",
                                    "countryOfBirth": "Brazil",
                                    "nationality": "Brazil",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 80171,
                                    "name": "William Saliba",
                                    "position": "Defender",
                                    "dateOfBirth": "2001-03-24T00:00:00Z",
                                    "countryOfBirth": "France",
                                    "nationality": "France",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 85570,
                                    "name": "Emile Smith Rowe",
                                    "position": "Midfielder",
                                    "dateOfBirth": "2000-07-28T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 99813,
                                    "name": "Bukayo Saka",
                                    "position": "Attacker",
                                    "dateOfBirth": "2001-09-05T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 131040,
                                    "name": "Folarin Balogun",
                                    "position": "Attacker",
                                    "dateOfBirth": "2001-07-03T00:00:00Z",
                                    "countryOfBirth": "England",
                                    "nationality": "England",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                },
                                {
                                    "id": 153843,
                                    "name": "Karl Jakob Hein",
                                    "position": "Goalkeeper",
                                    "dateOfBirth": "2002-04-13T00:00:00Z",
                                    "countryOfBirth": "Estonia",
                                    "nationality": "Estonia",
                                    "shirtNumber": null,
                                    "role": "PLAYER"
                                }
                            ]
                        """
        return decodeJSONResponse(responseJSON: response)
     }
    
   private func decodeJSONResponse<T: Decodable>(responseJSON: String) -> [T] {
        if let jsonData = responseJSON.data(using: .utf8) {
            do {
                let response = try JSONDecoder().decode([T].self, from: jsonData)
                return response
            } catch {
                return []
            }
        }

        return []
    }

}
