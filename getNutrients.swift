//
//  getNutrients.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/10/23.
//
// this view was my function that was refactored
import SwiftUI

//
//func getNutrientTotals() {
//
//    self.getUserId()
//
//
//        let db = Firestore.firestore()
////            db.collection("Users").document(userID!).collection("nutrients").setData([:]) { err in
////                if let err = err {
////                    print("Error writing document: \(err)")
////                } else {
////                    print("Document successfully written!")
////                }
////            }
//    // changed to dateuserid
//    // db.collection("Users").document(userID).collection("nutrients").document("GVPjoRry0l8cmSHLgi3s").getDocument{ (document,
//    db.collection("Users").document(dateUserId).setData([:]) { err in
//        if let err = err {
//            print("Error writing document: \(err)")
//        } else {
//            print("error")
//        }
//    }
//
//        //        db.collection("foods").getDocuments { snapshot, error in
////        let docRef = db.collection("Users").document(dateUserId).collection("nutrients").document(dateUserId)
//////        docRef.getDocument(as: AllNutrients.self) { result in
//////            switch result {
//////            case .success(let nutList):
//////                self.nutList = nutList
//////                self.errorMessage = nil
//////            case .failure(let erorr):
//////                self.errorMessage = "Erorr decoding document"
//////
//////            }
//////        }
////        docRef.getDocument { document, error in
////            if let error = error as NSError? {
////                print(error.localizedDescription)
////            }
////            else {
////                if let document = document {
////                    do {
////                        self.nutList = document.data() ?? ["Nutrient" : "Unavailable"]
////                    }
////                    catch {
////                        print(error)
////                    }
////            }
////
////        }
//    db.collection("Users").document(dateUserId).collection("nutrients").document(dateUserId).getDocument{ (document, error) in
//            // check for errors
//            if let document = document, document.exists {
//////                    let dataDict = document.data()
//////                    for key in dataDict! {
//////                        print(key)
//////                    }
////                    DispatchQueue.main.async {
////                        self.nutList = document.data().map { d in
////                            return AllNutrients(
////                                                 sodium: d["sodium"] as? Double ?? 0.00000,
////                                                 iron: d["iron"] as? Double ?? 0.00000,
////                                                 potassium: d["potassium"] as? Double ?? 0.00000,
////                                                 magnesium: d["magnesium"] as? Double ?? 0.00000,
////                                                 lysine: d["lysine"] as? Double ?? 0.00000,
////                                                 niacin: d["niacin"] as? Double ?? 0.00000,
////                                                 vitaminB12: d["vitaminB12"] as? Double ?? 0.00000,
////                                                 vitaminC: d["vitaminC"] as? Double ?? 0.00000,
////                                                 folicAcid: d["folicAcid"] as? Double ?? 0.00000,
////                                                 cholesterol: d["cholesterol"] as? Double ?? 0.00000,
////                                                 calcium: d["calcium"] as? Double ?? 0.00000)
////                        }
////                    }
//                self.nutList = document.data().map(String.init(describing:)) ?? "nil"
////                    print("Document data: \(self.nutList)")
//            } else {
//                print("Document does not exist")
//            }
//        }
//        //                if let document = document, document.exists {
//        //                    self.nutList = document.data().map { doc in
//        //                        return AllNutrients(id: doc.documentID,
//        //                                    sodium: doc["sodium"] as? Double ?? 0.00000,
//        //                                    iron: doc["iron"] as? Double ?? 0.00000,
//        //                                    potassium: doc["potassium"] as? Double ?? 0.00000)
//        //
//        //                    }
//        //                    print(self.nutList)
//        //                }
//        //                else {
//        //                    // handle error
//        //
//        //                }
//        //            }
//        //        }
//        //    else {
//        //        print("Figuring it out")
//        //    }
//        //
//        //
//        //
//}
