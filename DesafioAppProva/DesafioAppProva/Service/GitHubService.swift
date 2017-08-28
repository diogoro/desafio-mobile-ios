//
//  GitHubService.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 25/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let kUrlBase = "https://api.github.com/"

class GitHubService {
    
    // "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1" Url de exemplo para o primeiro metodo
    class func getRepositores(page: String, completion: @escaping (_ data: SearchResult?, _ error: NSError?)-> ()) {
        Alamofire.request(kUrlBase + "search/repositories?q=language:Java&sort=stars&page=\(page)", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            
            guard let data = dataResponse.data, dataResponse.response?.statusCode == 200 else {
                if dataResponse.response?.statusCode == 204 {
                    completion(nil,nil)
                } else if dataResponse.response?.statusCode != 204 && dataResponse.response?.statusCode != 200{
                    let error = NSError(errorData: dataResponse.data)
                    completion(nil, error)
                } else {
                    let error = dataResponse.error as NSError?
                    completion(nil, error)
                }
                return
            }
            
            let results = SearchResult(json: JSON(data))
            completion(results, nil)
        }

    }
    
    // "https://api.github.com/repos/ReactiveX/RxJava/pulls" Url de exemplo para o segundo metodo
    class func getPullsRequest(repository: String, completion: @escaping (_ pulls: [PullRequest]?, _ error: NSError?)->()) {
        Alamofire.request(kUrlBase + "repos/\(repository)/pulls", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            guard let data = dataResponse.data, dataResponse.response?.statusCode == 200 else {
                if dataResponse.response?.statusCode == 204 {
                    completion(nil,nil)
                } else if dataResponse.response?.statusCode != 204 && dataResponse.response?.statusCode != 200{
                    let error = NSError(errorData: dataResponse.data)
                    completion(nil, error)
                } else {
                    let error = dataResponse.error as NSError?
                    completion(nil, error)
                }
                return
            }
            
            var pulls: [PullRequest] = []
            let array = JSON(data).array
            if let arrayAux = array {
                for element in arrayAux {
                    let pull = PullRequest(json: element)
                    pulls.append(pull)
                }
            }
            completion(pulls, nil)
        }
    }

}
