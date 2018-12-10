//
//  FirstViewController.swift
//  To Do App
//
//  Created by Kalen Hammann on 12/8/18.
//  Copyright © 2018 Human Family. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var toDos: [String] = []
    
    override func viewDidAppear(_ animated: Bool) {
        let toDosObject = UserDefaults.standard.object(forKey: "toDos")
        toDos = toDosObject as? [String] ?? [String]()
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDos.remove(at: indexPath.row)
            UserDefaults.standard.set(toDos, forKey: "toDos")
            table.reloadData()
        }
    }



}

