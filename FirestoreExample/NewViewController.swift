//
//  NewViewController.swift
//  FirestoreExample
//
//  Created by admin on 14/03/22.
//

import UIKit
import FirebaseFirestore
import Firebase

class NewViewController: UIViewController {
    var ref: DocumentReference? = nil
    
    @IBOutlet weak var tfTitle: UITextField!
    
    @IBOutlet weak var tfDetails: UITextField!
    
    @IBOutlet weak var lblDisplayTask: UILabel!
   // var docRef: DocumentReference!
    let database = Firestore.firestore()
  //  var ref: DocumentReference? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let docRef = database.document("Info/Tasklist")
        docRef.addSnapshotListener { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
//            guard let titletext = data["Title"] as? String else {
//                return
//            }
//            guard let detailtext = data["Detail"] as? String else {
//                return
//            }
            guard let titleText = self!.tfTitle.text, !titleText.isEmpty else { return }
            guard let detailText = self!.tfDetails.text, !detailText.isEmpty else { return }
            DispatchQueue.main.async {
                self?.lblDisplayTask.text = titleText
            }
        }
}
    @IBAction func btnSaveAction(_ sender: Any) {
//       guard let titleText = tfTitle.text, !titleText.isEmpty else { return }
//        guard let detailText = tfDetails.text, !detailText.isEmpty else { return }
//        let dataToSave: [String: Any] = ["Title": titleText, "Detail": detailText]
//        docRef.setData(dataToSave) {
//            (error) in
//            if let error = error {
//                print("Error Occured\(error.localizedDescription)")
//            }else{
//                print("Data has not saved")
//            }
//        }
        
        if let text = tfTitle.text, !text.isEmpty {
            saveData(text: text)
        }
        return true
    }
        let docRef = database.document("Info/Tasklist")
        docRef.setData(["Title" : titleText, "Details" : detailText])
    }
    



}
