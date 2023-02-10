//
//  GetNutrientsView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/28/23.
//

import SwiftUI

struct GetNutrientsView: View {
//    @ObservedObject var model = ViewModel()
    @State var newFoodAdded = ""
    @State var api = apiCall()
    @State var model = ViewModel()
    @State private var showFoodConfirmation = false
//    @State private var newFoodAdded = ""
   
    
    var body: some View {
        
        VStack (alignment: .leading)
        {
            TextField("Add food", text: $newFoodAdded)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.blue)
//                .textFieldStyle(.roundedBorder)
                .font(.headline)

            Button {
                // add meal
                api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
                    for foood in [FoodArray] {
//                        print(foood.foods[0].food_name)
                        model.addFood(foodName: foood.foods[0].food_name,
                                      sodium: foood.foods[0].nf_sodium,
                                      iron: foood.foods[0].full_nutrients[20].value,
                                      potassium: foood.foods[0].nf_potassium,
                                      magnesium: foood.foods[0].full_nutrients[21].value,
                                      lysine: foood.foods[0].full_nutrients[63].value,
                                      niacin: foood.foods[0].full_nutrients[47].value,
                                      vitaminB12: foood.foods[0].full_nutrients[51].value,
                                      vitaminC: foood.foods[0].full_nutrients[45].value,
                                      folicAcid: foood.foods[0].full_nutrients[55].value,
                                      cholesterol: foood.foods[0].nf_cholesterol,
                                      calcium: foood.foods[0].full_nutrients[19].value
                        )
                        model.addSupplement(nutrient: "sodium", amount: foood.foods[0].nf_sodium)
                        model.addSupplement(nutrient: "iron", amount: foood.foods[0].full_nutrients[0].value)
                        model.addSupplement(nutrient: "potassium", amount: foood.foods[0].nf_potassium)
                        model.addSupplement(nutrient: "magnesium", amount: foood.foods[0].full_nutrients[21].value)
                        model.addSupplement(nutrient: "lysine", amount: foood.foods[0].full_nutrients[63].value)
                        model.addSupplement(nutrient: "niacin", amount: foood.foods[0].full_nutrients[47].value)
                        model.addSupplement(nutrient: "Vitamin B12", amount: foood.foods[0].full_nutrients[51].value)
                        model.addSupplement(nutrient: "Vitamin C", amount: foood.foods[0].full_nutrients[45].value)
                        model.addSupplement(nutrient: "Folic Acid", amount: foood.foods[0].full_nutrients[55].value)
                        model.addSupplement(nutrient: "cholesteol", amount: foood.foods[0].nf_cholesterol)
                        model.addSupplement(nutrient: "Calcium", amount: foood.foods[0].full_nutrients[19].value)
                        
                        
                        // commenting out to try new functions
                        
//                        model.addSupplements(sodium: foood.foods[0].nf_sodium,
//                                             iron: foood.foods[0].full_nutrients[0].value,
//                                             potassium: foood.foods[0].nf_potassium,
//                                             magnesium: foood.foods[0].full_nutrients[21].value,
//                                             lysine: foood.foods[0].full_nutrients[63].value,
//                                             niacin: foood.foods[0].full_nutrients[47].value,
//                                             vitaminB12: foood.foods[0].full_nutrients[51].value,
//                                             vitaminC: foood.foods[0].full_nutrients[45].value,
//                                             folicAcid: foood.foods[0].full_nutrients[55].value,
//                                             cholesterol: foood.foods[0].nf_cholesterol,
//                                             calcium: foood.foods[0].full_nutrients[19].value
//                        )
                        
                       
                        showFoodConfirmation.toggle()
                        newFoodAdded = ""
                        
                        
                        
                    }
                    
                }
                
            }
            
        label: {
                Text("Add Food".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        .alert("Success", isPresented: $showFoodConfirmation ) {
            // add buttons here
        } message: {
            Text("\(newFoodAdded) was successfully added")
        }
            
            
            
            Spacer()
            }
        
        .padding()
//        Button {
//            model.getData()
//        }
//    label: {
//        Text("Add to data")
//    }

//            ApiResultView()
//                .environmentObject(model)
        }
    
    }

struct GetNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        GetNutrientsView()
    }
}




