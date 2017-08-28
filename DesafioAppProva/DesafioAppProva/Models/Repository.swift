//
//  Repository.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 25/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repository {
    var id: Int?
    var name: String?
    var fullName: String?
    var owner: Owner?
    var description: String?
    var htmlUrl: String?
    var forksCount: Int?
    var stargazersCount: Int?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.name = json["name"].string
        self.fullName = json["full_name"].string
        self.forksCount = json["forks_count"].int
        self.owner = Owner(json: json["owner"])
        self.stargazersCount = json["stargazers_count"].int
        self.description = json["description"].string
        self.htmlUrl = json["html_url"].string
    }
}
