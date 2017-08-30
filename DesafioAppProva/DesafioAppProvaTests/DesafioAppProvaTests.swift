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
    
    
    func testGetSearchResultsPage1() {
        GitHubService.getRepositores(page: "1") { (result, error) in
            XCTAssertNil(error)
            XCTAssertEqual(result?.totalCount, 3539417)
            XCTAssertEqual(result?.incompleteStatus, false)
            XCTAssertEqual(result?.repositores[0].description, "RxJava – Reactive Extensions for the JVM – a library for composing asynchronous and event-based programs using observable sequences for the Java VM.")
            XCTAssertEqual(result?.repositores[0].forksCount, 1)
            XCTAssertEqual(result?.repositores[0].stargazersCount, 1)
            XCTAssertEqual(result?.repositores[0].fullName, "ReactiveX/RxJava")
            XCTAssertEqual(result?.repositores[0].name, "RxJava")
            XCTAssertEqual(result?.repositores[0].id, 7508411)
            XCTAssertEqual(result?.repositores[0].htmlUrl, "https://github.com/ReactiveX/RxJava")
            XCTAssertEqual(result?.repositores[0].owner?.id, 6407041)
            XCTAssertEqual(result?.repositores[0].owner?.login, "ReactiveX")
            XCTAssertEqual(result?.repositores[0].owner?.reposUrl, "https://api.github.com/users/ReactiveX/repos")
            XCTAssertEqual(result?.repositores[0].owner?.avatarUrl, "https://avatars1.githubusercontent.com/u/6407041?v=4")
            XCTAssertEqual(result?.repositores[0].owner?.htmlUrl, "https://github.com/ReactiveX")
            XCTAssertEqual(result?.repositores[0].owner?.url, "https://api.github.com/users/ReactiveX")
        }
    }
    
    func testGetPullRequestsRxJava() {
        GitHubService.getPullsRequest(repository: "ReactiveX/RxJava") { (list, error) in
            XCTAssertNil(error)
            XCTAssertEqual(list?[0].id, 137853426)
            XCTAssertEqual(list?[0].title, "Remove unnecessary git command from build instructions")
            XCTAssertEqual(list?[0].body, "Removing line to match wiki instructions and since 2.x is the default branch")
            XCTAssertEqual(list?[0].htmlUrl, "https://github.com/ReactiveX/RxJava/pull/5572")
            XCTAssertEqual(list?[0].state, "closed")
            XCTAssertEqual(list?[0].createdAt, "27-08-2017 20:47:54")
            XCTAssertEqual(list?[0].user?.avatarUrl, "https://avatars0.githubusercontent.com/u/5953895?v=4")
            XCTAssertEqual(list?[0].user?.htmlUrl, "https://github.com/tylerbwong")
            XCTAssertEqual(list?[0].user?.id, 5953895)
            XCTAssertEqual(list?[0].user?.login, "tylerbwong")
            XCTAssertEqual(list?[0].user?.reposUrl, "https://api.github.com/users/tylerbwong/repos")
            XCTAssertEqual(list?[0].user?.url, "https://api.github.com/users/tylerbwong")
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
