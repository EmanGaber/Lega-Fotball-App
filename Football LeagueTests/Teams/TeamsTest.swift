//
//  Football_LeagueTests.swift
//  Football LeagueTests
//
//  Created by Eman Gaber on 12/1/20.
//

import XCTest
@testable import Football_League

class TeamsTest: XCTestCase {
    var presenter: TeamPresenter?
    weak var teamView: TeamView?
    
    
    override func setUpWithError() throws {
        
        presenter = TeamPresenter(view: teamView)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testTeamArrayNotEqualNull()
    {
        let testTeamsMock = TeamsMock()
        let response = testTeamsMock.getTeams()
        
        //  XCTAssertEqual(response.count, 20)
        
        presenter?.teamsArray = response
        XCTAssertNotNil(presenter?.teamsArray)
        
    }
    
    func testTeamCount()
    {
        let testTeamsMock = TeamsMock()
        let response = testTeamsMock.getTeams()
        
        XCTAssertEqual(response.count, 20)
        
    }
    
    func testDidSelect()
    {
        
        let testTeamsMock = TeamsMock()
        let response = testTeamsMock.getTeams()
        
        presenter?.teamsArray = response
        presenter?.didSelectTeam(index: 1)
        
        XCTAssertEqual(presenter?.teamsArray?[1].name , "Aston Villa FC" ,"name not equal Aston Villa FC")
    }
    
    
    
    func testDidSelectTeamIdEqualNull()
    {
        
        let testTeamsMock = TeamsMock()
        let response = testTeamsMock.getTeams()
        
        
        presenter?.teamsArray = response
        
        presenter?.didSelectTeam(index: 0)
        
        XCTAssertNotNil(presenter?.teamsArray?[0].id)
        
    }
}
