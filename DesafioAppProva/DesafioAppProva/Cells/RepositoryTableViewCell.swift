//
//  RepositoryTableViewCell.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 28/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit
import AlamofireImage

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptionR: UILabel!
    @IBOutlet weak var fork: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
    @IBOutlet weak var nameOwner: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setValuesCell(repository: Repository) {
        self.name.text = repository.fullName
        self.descriptionR.text = repository.description
        self.fork.text = "\(repository.forksCount ?? 0)"
        self.stars.text = "\(repository.stargazersCount ?? 0)"
        self.nameOwner.text = repository.owner?.login
        guard let urlImage = URL(string: repository.owner?.avatarUrl ?? "") else {
            return
        }

        ownerImage.af_setImage(withURL: urlImage, placeholderImage: nil, filter: CircleFilter(), progress: nil, progressQueue: DispatchQueue.main, imageTransition: UIImageView.ImageTransition.crossDissolve(1.0), runImageTransitionIfCached: true, completion: nil)
    }

}
