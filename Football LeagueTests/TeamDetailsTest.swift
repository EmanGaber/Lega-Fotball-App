//
//  TeamDetailsTest.swift
//  Football LeagueTests
//
//  Created by Eman Gaber on 12/3/20.
//

import XCTest
@testable import Football_League

class TeamDetailsTest: XCTestCase {
    var presenter: TeamDetailsPresenter?
    weak var teamView: TeamDetailsView?
    
    
    override func setUpWithError() throws {
        
        presenter = TeamDetailsPresenter(view: teamView)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testTeamArrayNotEqualNull()
    {
        let testTeamsMock = TeamDetailsMock()
        let response = testTeamsMock.getTeamDetails()
        
              XCTAssertEqual(response.count, 34)
        
        let squadArray = response
        XCTAssertNotNil(squadArray)
        
    }

    func testGetPlayerAgeFromHisBirthday()
    {
       let age = presenter?.GetPlayerAgeFromHisBirthday(BirthDay: "1993-06-13")
        
        XCTAssertEqual(age , "27")
    }

    
    
    
    }
