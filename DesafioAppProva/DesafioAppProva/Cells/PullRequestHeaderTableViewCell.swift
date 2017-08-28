//
//  PullRequestHeaderTableViewCell.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 28/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class PullRequestHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var opened: UILabel!
    @IBOutlet weak var closed: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setValues(opened: Int, closed: Int) {
        self.opened.text = "\(opened) opened"
        self.closed.text = "\(closed) closed"
    }

}
