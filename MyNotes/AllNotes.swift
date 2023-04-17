//
//  TableViewController.swift
//  MyNotes
//
//  Created by Anastasia Lenina on 17.04.2023.
//

import UIKit
import CoreData

protocol newNoteWasEdded {
    func addNote(note: NSManagedObject)
}

class AllNotes: UITableViewController, newNoteWasEdded {
    
    
    /*var allNotes : [Note] = [Note(title: "Liric", body: "The was a sunny day"),
     Note(title: "New dress", body: "Shuld by this cute dress asap"),
     Note(title: "Link to get a job", body: "www.megumethod.com"),
     Note(title: "Friends", body: "Make a bithday app")]*/
    
    var newNoteVC = NewNote()
    var notes: [NSManagedObject] = []
    var titleNote : String?
    var bodyNote  : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        newNoteVC.delegate = self
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext =
        appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
        NSFetchRequest<NSManagedObject>(entityName: "Note")
        
        //3
        do {
            notes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        tableView.reloadData()
        print("Im here")
    }
    
    
    
    
    func addNote(note: NSManagedObject) {
        notes.append(note)
    }
    /* @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
     
     }*/
    
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].value(forKeyPath: "title") as? String
        cell.textLabel?.font = UIFont(name:"Futura-Bold", size: 20.0 )
        //cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        cell.textLabel?.textColor = .darkGray
        cell.detailTextLabel?.text = notes[indexPath.row].value(forKeyPath: "body") as? String
        cell.detailTextLabel?.textColor = .gray
        cell.detailTextLabel?.font = UIFont(name:"Futura", size: 14 )
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let viewNoteVC = ViewNote()
        titleNote = notes[indexPath.row].value(forKey: "title") as? String
        bodyNote = notes[indexPath.row].value(forKey: "body") as? String
  
        print(notes[indexPath.row].value(forKey: "title"))
        self.performSegue(withIdentifier: "viewNoteSeg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewNoteSeg"){
            let viewNoteVC = segue.destination as! ViewNote
            viewNoteVC.titleNote = titleNote
            viewNoteVC.bodyNote = bodyNote
        }
    }
    
}
