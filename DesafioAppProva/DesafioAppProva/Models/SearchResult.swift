//
//  SearchResult.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 25/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

class SearchResult {
    var totalCount: Int?
    var incompleteStatus: Bool?
    var repositores: [Repository] = []
    
    init(json: JSON) {
        self.incompleteStatus = json["incomplete_results"].bool
        self.totalCount = json["total_count"].int
        if let array = json["items"].array {
            for element in array {
                let repo = Repository(json: element)
                self.repositores.append(repo)
            }
        }
    }
    
}
