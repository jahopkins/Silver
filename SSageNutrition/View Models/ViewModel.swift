//
//  ViewModel.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/25/23.
//

import Foundation
import Firebase
import SwiftUI

class ViewModel: ObservableObject {
    @Published var list = [Food] ()
    @Published var nutrientList = [FoodArray] ()
    let userID = Auth.auth().currentUser?.uid
    
    
    func getData() {
        // accessing user id
        // Get a reference to the database
        if userID != nil {
            
            let db = Firestore.firestore()
            
            //        db.collection("foods").getDocuments { snapshot, error in
            db.collection("Users").document(userID!).collection("foods").getDocuments { snapshot, error in
                // check for errors
                if error == nil {
                    //no errors
                    
                    if let snapshot = snapshot {
                        print("made it")
                        //update list property in main thread
                        DispatchQueue.main.async {
                            self.list = snapshot.documents.map { d in
                                // crEATE food item for each document returned
                                return Food(id: d.documentID,
                                            name: d["name"] as? String ?? "",
                                            sodium: d["sodium"] as? Double ?? 0.00000,
                                            iron: d["iron"] as? Double ?? 0.00000)
                                
                            }
                            print(self.list)
                        }
                        // get all documents and create foods
                        
                    }
                    else {
                        // handle error
                        
                    }
                }
            }
        }
        else {
            print("Add an Item to View a list")
        }
    }
    
//    func findTotals(list) {
        // create an empty interger
        //add each number to that interger
//    }
    
 
    func addFood(foodName: String, sodium: Double, iron: Double) {
        let db = Firestore.firestore()
        // ask ansel how would i solve this problem without using the exclamation point
        // i used it without but i got an error
        // i was sstuck for a while because all thr
        // the if statement was pointless because the id wil never be nill, i
        // have to find a way to check if it is in the database or use merge
//        if userID == nil {
        db.collection("Users").document(userID!).setData([:]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
//        }
        
        db.collection("Users").document(userID!).collection("foods").addDocument(data: ["name": foodName, "sodium": sodium, "iron": iron]){ error in
//        ref.setData(["name": foodName, "sodium": sodium]) { error in
            if error == nil {
                // no errors
                self.getData()
                print("retrieving Data")
            }
            else {
                // handle error
            }
        }
    }
       
}


