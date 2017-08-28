//
//  DesafioAppProvaTests.swift
//  DesafioAppProvaTests
//
//  Created by Diogo Ribeiro de Oliveira on 25/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import XCTest
@testable import DesafioAppProva

class DesafioAppProvaTests: XCTestCase {
    
    
    func testExample() {
        GitHubService.getRepositores(page: "1") { (result, error) in
             XCTAssertNil(error)
        }
    }
    
    func testFinalListSearch() {
        GitHubService.getRepositores(page: "35") { (result, error) in
            XCTAssertEqual(String(describing: error?.userInfo["MESSAGE_API_ERROR"]), "Only the first 1000 search results are available")
            XCTAssertEqual(String(describing: error?.userInfo["URL_API_DOCUMENTATION"]), "https://developer.github.com/v3/search/")
            XCTAssertNil(result)
        }
    }
    
    func testPullResquestNoRepository() {
        GitHubService.getPullsRequest(repository: "diogoro/Teste") { (pulls, error) in
            XCTAssertEqual(String(describing: error?.userInfo["MESSAGE_API_ERROR"]), "Not Found")
            XCTAssertEqual(String(describing: error?.userInfo["URL_API_DOCUMENTATION"]), "https://developer.github.com/v3/search/")
            XCTAssertNil(pulls)
        }
    }
    
    
    
}
