//
//  MicronutrientAmounts.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/26/23.
//

//import Foundation
//
//
//func apiCall () {
//    guard let url = URL(string: "https://trackapi.nutritionix.com/v2/natural/nutrients") else {
//        return
//    }
//    
//    var request = URLRequest(url:url)
//    // method, body, headers
//    
//    request.httpMethod = "POST"
//    request.setValue("ba5c9aa1", forHTTPHeaderField: "x-app-id")
//    request.setValue("8c6d5f8f5521d8f7891a706038ef95f3", forHTTPHeaderField: "x-app-key")
//    request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
//    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
////    request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
////    request.setValue("0", forHTTPHeaderField: "x-remote-user-id")
//    let body: [String: AnyHashable] = ["query": "apple"]
//    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//    //make the request
//    let task = URLSession.shared.dataTask(with: request) { data, _, error in
//        guard let data = data, error == nil else {
//            return
//        }
//        do {
//            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//            print("Success: \(response)")
//        }
//        catch { print(error)
//       
//        }
//        }
//    task.resume()
//    }
//
//    
//    
//    
//    
 


