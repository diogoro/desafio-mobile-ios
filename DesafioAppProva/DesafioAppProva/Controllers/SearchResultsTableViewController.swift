//
//  SearchResultsTableViewController.swift
//  DesafioAppProva
//
//  Created by Diogo Ribeiro de Oliveira on 27/08/17.
//  Copyright © 2017 Diogo Ribeiro de Oliveira. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    var page: Int = 1
    var repositoryList: [Repository] = []
    var isFinishLoad = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItens()
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
        return self.repositoryList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoryTableViewCell

        let repository = self.repositoryList[indexPath.row]
        cell.setValuesCell(repository: repository)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repositoryName = self.repositoryList[indexPath.row].fullName
        performSegue(withIdentifier: "pullSegue", sender: repositoryName)
    }

    func loadItens() {
        if !isFinishLoad {
            GitHubService.getRepositores(page: "\(self.page)") { (result, error) in
                guard let result = result else {
                    self.isFinishLoad = true
                    // mandar mensagem de aviso
                    return
                }
                self.repositoryList.append(contentsOf: result.repositores)
                self.page = self.page + 1
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pullSegue", let repositoryName = sender as? String {
            let destination = segue.destination as! PullRequestsTableViewController
            destination.repositoryName = repositoryName
        }
        
    }

}
