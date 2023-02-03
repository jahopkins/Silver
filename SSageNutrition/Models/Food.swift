//
//  Food.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/25/23.
///Users/jacquelinehopkins/Desktop/SSage Nutrition Capstone/SSageNutrition/SSageNutrition/Models/MicronutrientAmounts.swift

//data model to model the data I want to display

import Foundation
import FirebaseFirestore
import FirebaseCore


//represents food structure
struct Food: Identifiable {
    var id: String
    var name : String
    var sodium: Double
    var iron: Double
}

struct FoodArray: Codable, Hashable {
    var foods: [Response]
}

struct Response: Codable, Hashable {
    let food_name: String
    let nf_sodium: Double
    let id = UUID()
    let full_nutrients: [Micronutrients]
}

struct Micronutrients: Codable, Hashable {
    let attr_id: Int
    let value: Double
}

