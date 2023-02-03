//
//  DataView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/27/23.
//

import SwiftUI

struct DataView: View {
    @ObservedObject var model = ViewModel()
    @State private var showPopup = false
    // new
    @StateObject var api = apiCall()
    
    //         defines a new computed proprety called body
    //         'some view' type means it will return something that confomrs to the view protocol, which is the layout
    //         view protocol has one requirement: 'body' property that returns some view
    var body: some View {
        VStack
        {
            Divider()
//            TextField("Add food", text: $newFoodAdded)

            Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showPopup) {
//                AddMealView()
                GetNutrientsView()
            }
            
                        
                
            
        // new
//            List {
//                ForEach(api.allNutrients, id: \.self) { nutrient in
//                    HStack {
//                        Text("\(nutrient.foods)" as String)
//                            .bold()
//                    }
//                }
            // addd this twice because i get an error once i remove it
//            List (model.list) { item in
//                Text(item.name)
//
//            }
//            .onAppear {
//                GetNutrientsView()
//            }
//            .navigationTitle("Foods")
//            .navigationBarItems(trailing: Button(action: {
//                showPopup.toggle()
//            }, label: {
//                Image(systemName: "plus")
//            }))
//            .sheet(isPresented: $showPopup) {
////                AddMealView()
//                GetNutrientsView()
//            }
            
        }
    }
//    init() {
//        model.getData()
//    }
    
    
    struct DataView_Previews: PreviewProvider {
        static var previews: some View {
            DataView()
        }
    }
}
