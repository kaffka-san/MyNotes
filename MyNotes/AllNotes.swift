//
//  TableViewController.swift
//  MyNotes
//
//  Created by Anastasia Lenina on 17.04.2023.
//

import UIKit

class AllNotes: UITableViewController {
    var allNotes : [Note] = [Note(title: "Liric", body: "The was a sunny day"),
                    Note(title: "New dress", body: "Shuld by this cute dress asap"),
                    Note(title: "Link to get a job", body: "www.megumethod.com"),
                    Note(title: "Friends", body: "Make a bithday app")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allNotes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = allNotes[indexPath.row].title
        cell.textLabel?.font = UIFont(name:"Futura-Bold", size: 20.0 )
        //cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
       
        cell.textLabel?.textColor = .darkGray
        cell.detailTextLabel?.text = allNotes[indexPath.row].body
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.font = UIFont(name:"Futura", size: 14 )
        // Configure the cell...

        return cell
    }
    


}
