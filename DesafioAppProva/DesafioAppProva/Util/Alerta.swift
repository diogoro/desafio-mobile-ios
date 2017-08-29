//
//  Alerta.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 28/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class Alert {
    
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.alert)
    
    init(title:String, message:String) {
        alert.title = title
        alert.message = message
        let doneButton = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(doneButton)
    }
    
    func getAlert() -> UIAlertController {
        return alert
    }
}
