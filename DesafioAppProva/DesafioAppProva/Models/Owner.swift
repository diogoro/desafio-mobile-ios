//
//  Owner.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 25/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class Owner {
    
    var login: String?
    var id: Int?
    var avatarUrl: String?
    var url: String?
    var htmlUrl: String?
    var reposUrl: String?
    
    init(json: JSON) {
        self.login = json["login"].string
        self.id = json["id"].int
        self.avatarUrl = json["avatar_url"].string
        self.url = json["url"].string
        self.htmlUrl = json["html_url"].string
        self.reposUrl = json["repos_url"].string
    }
}
