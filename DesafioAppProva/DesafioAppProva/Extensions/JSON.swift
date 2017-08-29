//
//  JSON.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 29/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    public var dateTimeISO8601: String? {
        get {
            switch self.type {
            case .string:
                return formatterDateTimeISO8601(dateISO8601: self.object as! String)
            default:
                return nil
            }
        }
    }
    
    private func formatterDateTimeISO8601(dateISO8601: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateISO8601) else {
            return dateISO8601
        }
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
