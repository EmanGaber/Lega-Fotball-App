//
//  FavTeamsTest.swift
//  Football LeagueTests
//
//  Created by Eman Gaber on 12/3/20.
//

import XCTest
@testable import Football_League

class FavTeamsTest: XCTestCase {
    var presenter: FavouriteListPresenter?
    weak var favView: FavouriteListView?
    
    override func setUpWithError() throws {
        
        presenter = FavouriteListPresenter(view: favView)
    }
    
    override func tearDownWithError() throws {
        presenter = nil
    }

    func testFavCount()
    {
        presenter?.getFavTeamListDB()
        
        XCTAssertEqual(presenter?.teamsArray?.count, 2)

        
    }
    
    func testDidSelect()
    {
        presenter?.getFavTeamListDB()
        presenter?.didSelectTeam(index: 0)
        
        XCTAssertEqual(presenter?.teamsArray?[0].id , 4)
    }

}
