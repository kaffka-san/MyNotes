//
//  NewNote.swift
//  MyNotes
//
//  Created by Anastasia Lenina on 17.04.2023.
//

import UIKit
import CoreData
class NewNote: UIViewController {

    var delegate : newNoteWasEdded?
    
    @IBOutlet weak var tittleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tittleTextField.delegate = self
        bodyTextField.delegate = self
        self.dismissKeyboard()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
       
        guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
           return
         }
       
        let context = appDelegate.persistentContainer.viewContext
       
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)!
        let note = NSManagedObject(entity: entity, insertInto: context)
        if let safeTitle = tittleTextField.text, let safeBody = bodyTextField.text{
            note.setValue(safeTitle, forKey: "title")
            note.setValue(safeBody, forKey: "body")

            do{
                try context.save()
                delegate?.addNote(note: note)
                print(note)
                print("saved")
                
            }catch {
                print("error saving note \(error)")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITextfiled functionality
extension NewNote : UITextFieldDelegate{
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}

//MARK: - UITextView functionality
extension NewNote : UITextViewDelegate{
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if(text == "\n") {
                textView.resignFirstResponder()
                return false
            }
            return true
        }
   

    
}

extension UIViewController {
func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}
