//
//  ListOfFoodsView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/1/23.
//

import SwiftUI

struct ListOfFoodsView: View {
    
    @ObservedObject var model = ViewModel()
    @State var api = apiCall()
    @State var newFoodAdded = ""
    
    var body: some View {
        VStack(spacing: 5) {
//            Button(action: {
//                model.getData()
//            }, label: {
//                Text("View Nutrients")
//            }
//            )

//            List (model.list) { item in
//                Text(item.name)
//                Text("\(item.sodium)")
//                Spacer()
//            }
//            
            TextField("Add food", text: $newFoodAdded)
            Button {
                // add meal
                api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
                    for foood in [FoodArray] {
                        print(foood.foods[0].food_name)
                        model.addFood(foodName: foood.foods[0].food_name,
                                      sodium: foood.foods[0].nf_sodium,
                                      iron: foood.foods[0].full_nutrients[0].value)

                        newFoodAdded = ""

                    }
                }
            } label: {
                Text("Save meal")
            }
            
        }
    }
}

struct ListOfFoodsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfFoodsView()
    }
}
