//
//  SingleNutrientView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/2/23.
//
//
//import SwiftUI
//
//struct SingleNutrientView: View {
//    @ObservedObject var model = ViewModel()
//    @State var EnteredNutrient = ""
//    
//    var body: some View {
//        VStack{
//            Text("\(model.PotTot)")
//            Text("\(model.IronTot)")
//            Text("\(model.SodiumTot)")
////            List (model.list) { item in
////                Text(item.name)
////                Text("\(item.sodium)")
////            }
//            .onAppear(perform: { model.getData() })
//        }
//        Button(action: model.findPot) {
//            Text("Find Daily Potassium")
//        }
//        Button(action: model.findIron) {
//            Text("Find Daily Potassium")
//        }
//        Button(action: model.findSodium) {
//            Text("Find Daily Sodium")
//        }
//        TextField("Nutrientt", text: $EnteredNutrient)
//        
//    }
//}
//
//struct SingleNutrientView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleNutrientView()
//    }
//}
