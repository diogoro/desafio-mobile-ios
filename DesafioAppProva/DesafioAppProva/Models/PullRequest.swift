//
//  PullRequest.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 27/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class PullRequest {
    
    var id: Int?
    var title: String?
    var body: String?
    var htmlUrl: String?
    var user: Owner?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.title = json["title"].string
        self.body = json["body"].string
        self.htmlUrl = json["html_url"].string
        self.user = Owner(json: json["user"])
        
    }
}
