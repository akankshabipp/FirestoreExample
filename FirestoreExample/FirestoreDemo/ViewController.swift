//
//  ViewController.swift
//  FirestoreExample
//
//  Created by admin on 11/03/22.
//

import UIKit
import FirebaseFirestore
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFieldMessage: UITextField!
    
    @IBOutlet weak var lblMessageDisplay: UILabel!
    let database = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldMessage.delegate = self
        let docRef = database.document("Info/userMessage")
        docRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let text = data["text"] as? String else {
                return
            }
            DispatchQueue.main.async {
                self?.lblMessageDisplay.text = text
            }
        }
        
    }
        func saveData(text: String) {
            let docRef = database.document("Info/userMessage")
            docRef.setData(["text": text])
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool{
            if let text = txtFieldMessage.text, !text.isEmpty {
                saveData(text: text)
            }
            return true
        }
    


}

