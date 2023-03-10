//
//  MicronutrientResultsModel.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/26/23.
//
//


import Foundation
import Firebase
import SwiftUI

class apiCall: ObservableObject {
    @Published var allNutrients = [FoodArray]()
    @State var model = ViewModel()
    @Published var apiStatus = ""
    // added completion handler
    func fetchData (userMeal: String, completionHandler: @escaping (FoodArray) -> Void) {
        guard let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients") else {
            return
        }
        
        var request = URLRequest(url:url)
        // method, body, headers
        
        request.httpMethod = "POST"
        request.setValue("ba5c9aa1", forHTTPHeaderField: "x-app-id")
        request.setValue("8c6d5f8f5521d8f7891a706038ef95f3", forHTTPHeaderField: "x-app-key")
        request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.setValue("", forHTTPHeaderField: "Content-Length")
        //    request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
        //    request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
        //        let userMeal = readLine()
        let body: [String: AnyHashable] = ["query": userMeal]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        //make the request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            // guard let data = data, error == nil else {
            guard let data = data else {
                return
            }
            do {
                let results = try JSONDecoder().decode(FoodArray.self, from: data)
                
                
                DispatchQueue.main.async {
                    completionHandler(results)
                    self.allNutrients = [results]
                }
                
                //                DispatchQueue.main.async {
                //                    completion(foodDescription)
                //                }
                
                
                //                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                //                DispatchQueue.main.async {
                //                    for item in response.foods{
                //                        self.foodDescription = item.foodDescription
                //                    }
                //                }
                
                //                print("Success: \(foodDescription)")
            }
            //            catch { print(error) this was all i had
            catch {
                let error = error
                self.apiStatus = "Could not locate data"
                print(error.localizedDescription)
                
            }
            
        }
        task.resume()
    }
    
//    func addFood(foodName: String, sodium: Double) {
//        let db = Firestore.firestore()
//        db.collection("foods").addDocument(data: ["name": foodName, "sodium": sodium]) { error in
////        ref.setData(["name": foodName, "sodium": sodium]) { error in
//            if error == nil {
//                // no errors
//                self.getData()
//            }
//            else {
//                // handle error
//            }
//        }
//    }
    
}
