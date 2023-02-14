//
//  SingleFoodNutrientView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/10/23.
//

import SwiftUI

struct SingleFoodNutrientView: View {
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {
        VStack{
            

            List (model.list) { item in
                VStack(alignment: .leading) {
                    Text("\(item.sodium)")
                    
                    //                                .listRowSeparator(.hidden)
                        .listRowInsets(.init(top:0, leading: 40, bottom: 0, trailing: 40))
                    
                    
                }
            }
//            Text(model.dateUserId)


//            }
            .onAppear(perform: { model.getData() })
        }
        
    }
}

struct SingleFoodNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        SingleFoodNutrientView()
    }
}
