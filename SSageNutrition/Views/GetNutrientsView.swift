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
//    @State private var newFoodAdded = ""
   
    
    var body: some View {
        
        VStack (alignment: .leading)
        {
            TextField("Add food", text: $newFoodAdded)

            Button { 
                // add meal
                api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
                    for foood in [FoodArray] {
                        print(foood.foods[0].food_name)
                        model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium, iron: foood.foods[0].full_nutrients[0].value)
                        
                        newFoodAdded = ""
                        
                    }
                }
            } label: {
                Text("Save meal")
            }
            
                
            }
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




