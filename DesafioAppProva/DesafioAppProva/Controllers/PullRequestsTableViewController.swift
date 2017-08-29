//
//  PullRequestsTableViewController.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 28/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit
import PKHUD

class PullRequestsTableViewController: UITableViewController {

    var repositoryName:String!
    var pullRequestsList: [PullRequest] = []
    var opened = 0
    var closed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()

        self.navigationItem.title = repositoryName
        PKHUD.sharedHUD.contentView = PKHUDProgressView(title: "Carregando ...", subtitle: nil)
        PKHUD.sharedHUD.show()
        GitHubService.getPullsRequest(repository: repositoryName) { (pulls, error) in
            PKHUD.sharedHUD.hide()
            guard let pullsList = pulls else {
                if let err = error {
                    var message = "Erro inesperado ao acessar a api do GitHub"
                    if err.code == 990 {
                        message = String(describing: err.userInfo["MESSAGE_API_ERROR"])
                    } else if err.code == 999 {
                        message = String(describing: err.userInfo["ERROR_INVALID_PARSING"])
                    }
                    let alert = Alert(title: "Erro", message: message)
                    self.present(alert.getAlert(), animated: true, completion: nil)
                }
                return
            }
            self.pullRequestsList.append(contentsOf: pullsList)
            self.calcOpenedClose()
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60
    }

    func calcOpenedClose() {
        for pull in pullRequestsList {
            if pull.state == "open" {
                opened = opened + 1
            } else if pull.state == "closed" {
                closed = closed + 1
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pullRequestsList.count + 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell", for: indexPath) as! PullRequestHeaderTableViewCell
            
            headerCell.setValues(opened: self.opened, closed: self.closed)
            
            return headerCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "pullCell", for: indexPath) as! PullRequestTableViewCell
            let pull = self.pullRequestsList[indexPath.row - 1]
            
            cell.setValuesCell(pullRequest: pull)
            
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullSelect = self.pullRequestsList[indexPath.row]
        guard let pullHtmlUrl = URL(string: pullSelect.htmlUrl ?? "") else {
            let alert = Alert(title: "Erro", message: "Pull Request não possui url para exibição no browser")
            self.present(alert.getAlert(), animated: true, completion: nil)
            return
        }
        if UIApplication.shared.canOpenURL(pullHtmlUrl) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(pullHtmlUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(pullHtmlUrl)
            }
        }
    }
    
}
