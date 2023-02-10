//
//  foodNameListView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 2/3/23.
//

import SwiftUI

struct foodNameListView: View {
    let customColor = Gradient(colors: [Color("ColorSS"), Color("Colorss1")])
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                
                VStack(spacing: 20){
                    
                    Section {
                        
                        
                        List (model.list) { item in
                            Text("\(item.name)").font(.headline)
                            
                                .listRowSeparator(.hidden)
                                .listRowInsets(.init(top:0, leading: 40, bottom: 0, trailing: 40))
                            
                            
                        }
                    }
                header: {
                    Text("\(model.formattedDate)")
                }
                  
                    NavigationLink(destination: GetNutrientsView()
                        .navigationTitle("AddFood")
                                   //                        .onAppear {
                                   //                        model.getData()
                                   //                    }
                    )
                    {
                        //                        Image(systemName: "Plus")
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.black)
                            .font(.title2)
                          
//                                .navigationBarTitleDisplayMode(.inline)
                        
                        
                    }

                
                        
                        
                        
                        .onAppear(perform: { model.getData() })
                        .onAppear(perform: { model.getFomattedDate()})
//                    }
//                    Section {
                        
                        //            header : {
                        //                Text("Foods")
                        //            }
//                    }
                }
                .scrollContentBackground(.hidden)
//                .background(LinearGradient(gradient: customColor, startPoint: .top, endPoint: .bottom))
                //        .edgesIgnoringSafeArea(.all)
                
                
               
            }
            .navigationTitle("Tracked Foods")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}
struct foodNameListView_Previews: PreviewProvider {
    static var previews: some View {
        foodNameListView()
    }
}
