//
//  SwiftUIView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/5/23.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {
        VStack{

//            List (model.nutList) { item in
//                Text(item.name)
            Text(model.dateUserId)


//            }
            .onAppear(perform: { model.getUserId() })
        }
        
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
