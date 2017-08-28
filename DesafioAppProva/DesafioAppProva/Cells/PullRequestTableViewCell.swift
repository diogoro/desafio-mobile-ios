//
//  PullRequestTableViewCell.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 28/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit
import AlamofireImage

class PullRequestTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var decriptionP: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setValuesCell(pullRequest: PullRequest) {
        self.title.text = pullRequest.title
        self.decriptionP.text = pullRequest.body
        self.username.text = pullRequest.user?.login
        self.date.text = pullRequest.createdAt
        guard let urlImage = URL(string: pullRequest.user?.avatarUrl ?? "") else {
            return
        }
        
        ownerImage.af_setImage(withURL: urlImage, placeholderImage: nil, filter: CircleFilter(), progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(1.0), runImageTransitionIfCached: true, completion: nil)
    }
    

}
