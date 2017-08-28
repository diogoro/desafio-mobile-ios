//
//  NSErrorExtension.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 27/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

extension NSError {
    
    convenience init(errorData: Data?) {
        guard let error = errorData else {
            self.init(domain: "ErrorParsingError", code: 999, userInfo: ["ERROR_INVALID_PARSING":"Não foi possível fazer o parsing do erro"])
            return
        }
        let errorJson = JSON(error)
        var userInfo: [AnyHashable : Any] = [:]
        userInfo["MESSAGE_API_ERROR"] = errorJson["message"].stringValue
        userInfo["URL_API_DOCUMENTATION"] = errorJson["documentation_url"].stringValue
        self.init(domain: "ApiError", code: 990, userInfo: userInfo)
    }
}
