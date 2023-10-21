//
//  ViewController.swift
//  ProgrammaticUI
//
//  Created by Şule Kaptan on 21.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUITableView()
    }
    
    func setupUITableView() {
        view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.rowHeight = 200

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let simpson = simpsons[indexPath.row]
        cell.simpsonImageView.image = UIImage(named: simpson.imageName)
        cell.nameLabel.text = simpson.name
        cell.jobLabel.text = simpson.job
        return cell
    }
    
}

