//
//  practice.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/2/23.
//

import SwiftUI

struct practice: View {
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {
        NavigationView {
//            Text("Tracked Nutrients")
//                .navigationBarTitleDisplayMode(.inline)
            
        
        VStack{
            Section {
                
                
                
                    List (model.nutList) { item in
                        VStack(alignment: .leading) {
                            Text(item.id).font(.title)
                            let formattedAmount =  String(format:"%.2f", item.amount)
                            Text("\(formattedAmount)").font(.headline)
                            NavigationLink(destination: Charts()
                                .navigationTitle("look at chart")
                                           //                        .onAppear {
                                           //                        model.getData()
                                           //                    }
                            )
                            {
        //                        Image(systemName: "Plus")
                                Text("Compare to Daily Recommend Values")
                                    .foregroundStyle(.black)
                                    .font(.footnote)
                              
                                
                                   
                                
                            }
                            
                            
                            
                        }
                    
                    
                    
                    
                    
                }
            } header: {
                Text("\(model.formattedDate)")
            }
                
            
//            model.nutList.forEach {
//                item in
//                Text("\(item)")
//            }
//            Text(model.nutList.replacingOccurrences(of: "[", with: ""))
            //
            //
            ////            }
                .onAppear(perform: { model.getAllNutrients() })
                .onAppear {
                    model.getFomattedDate()
                }
            //        }
            //
        }
        .navigationTitle("Tracked Nutrients")
        .navigationBarTitleDisplayMode(.inline)
//        .environment(.defaultMinListRowHeight, 20)
    }
    }
}

struct practice_Previews: PreviewProvider {
    static var previews: some View {
        practice()
    }
}
