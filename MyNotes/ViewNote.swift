//
//  ViewNote.swift
//  MyNotes
//
//  Created by Anastasia Lenina on 17.04.2023.
//

import UIKit

class ViewNote: UIViewController {
    var titleNote: String?
    var bodyNote: String?
    
    @IBOutlet weak var titleTextField: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sdasdas")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("tuta")
        print(titleNote)
       if let safeTitle = titleNote, let safeBody = bodyNote{
            print("___")
            //print(safeTitle)
            titleTextField.text = safeTitle
            bodyTextView.text = safeBody
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
