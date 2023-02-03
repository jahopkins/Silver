//
//  ContentView.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/25/23.
//

import SwiftUI
// tells swift we want to use all functionailty from SwiftUI framework
import Firebase
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
//                ViewModel().getData()
            }
        }
            
    }
        func signUp(email: String, password: String) {
            auth.createUser(withEmail: email, password: password) { [weak self] result, error in
                guard result != nil, error == nil else {
                    return
                }
                //Success
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
                
            }
            
        }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    }

    
    
    // creates a new struct called ContentView and confirms to view protocol
    // view comes from swiftui
    // view is the basic protocol that must be adopted by anything drawn on screen
    
    
struct ContentView: View {
    //        @State var email = ""
    //        @State var password = ""
    @State var newFoodAdded = ""
    @State var api = apiCall()
    //    @State var model = ViewModel()
    @ObservedObject var model = ViewModel()
    @EnvironmentObject var appViewModell: AppViewModel
    @State private var showingFoods = false
    var body: some View {
        //
        TabView {
//        NavigationView {
            
            //whenever pusblished var changes, ui view changes because its binding
            if appViewModell.signedIn {
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                foodView()
                    .tabItem {
                        Label("View Foods", systemImage: "fork.knife")
                    }
                
//                  ListOfFoodsView()
//                Text("You are signed in")
//                model.getData()
//                List (model.list) { item in
//                    Text(item.name)
                // commenting out
//                VStack(spacing: 5) {
////                    ListOfFoodsView()
//                    Button(action: {
//                        model.getData()
//                        NavigationLink(destination: ListOfFoodsView())
//                    }, label: {
//                        Text("View Nutrients")
//                    })
                    
//                    Button(action: {
//                        model.getData()
//                    }, label: {
//                        Text("View Nutrients")
//                    }
//                    )
//
//                    List (model.list) { item in
//                        Text(item.name)
//                    }
//                    TextField("Add food", text: $newFoodAdded)
//                    Button {
//                        // add meal
//                        api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
//                            for foood in [FoodArray] {
//                                print(foood.foods[0].food_name)
//                                model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
//
//                                newFoodAdded = ""
//
//                            }
//                        }
//                    } label: {
//                        Text("Save meal")
//                    }
                // commented out
//                    Button(action: {
//                        appViewModell.signOut()
//                    }, label: {
//                        Text("Sign Out")
//                            .foregroundColor(Color.blue)
//                    })
//
//                }
                    // commented out
                
            }
            else {
                SignInView()
            }
            
        }
        .onAppear{
            appViewModell.signedIn = appViewModell.isSignedIn
            
        }
        // i added this into is signed in
        //            VStack(spacing: 5) {
        //                TextField("Add food", text: $newFoodAdded)
        //                Button {
        //                    // add meal
        //                    api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
        //                        for foood in [FoodArray] {
        //                            print(foood.foods[0].food_name)
        //                            model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
        //
        //                            newFoodAdded = ""
        //
        //                        }
        //                    }
        //                } label: {
        //                    Text("Save meal")
        //                }
        //            }
        //        DataView()
    }
//    init () {
//        model.getData()
//    }
}
//
//
//
//
//
//
//
//        }
        //  @ObservedObject var model = ViewModel()
        ////         defines a new computed proprety called body
        ////         'some view' type means it will return something that confomrs to the view protocol, which is the layout
        ////         view protocol has one requirement: 'body' property that returns some view
        //            var body: some View {
        //                List (model.list) { item in
        //                    Text(item.name)
        //                }
        //            }
        //            init() {
        //                model.getData()
        //            }
        //        }
        //
        //         contnetview_previews struct conforms to the previewprovider protocol
        //         it isnt part of code, it only previews the ui
        
struct SignInView: View {
           
    @State var email = ""
    @State var password = ""
//            @State var newFoodAdded = ""
//            @State var api = apiCall()
//            //    @State var model = ViewModel()
//            @ObservedObject var model = ViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
//                List (model.list) { item in
//                    Text(item.name)
//                }
        //        Button {
        //            // add meal
        //            api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
        //                for foood in [FoodArray] {
        //                    print(foood.foods[0].food_name)
        //                    model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
        //
        //                    newFoodAdded = ""
        //
        //                }
        //            }
        //        } label: {
        //            Text("Save meal")
        //        }
//                Divider()
            VStack{
                // Image("logo")
                VStack {
                    TextField("Enail Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        appViewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                    
                    
                }
                .padding()
                
                Spacer()
                
                
            }
            .navigationTitle("Sign In")
            
            
        }
    }

struct SignUpView: View {
           
    @State var email = ""
    @State var password = ""
//            @State var newFoodAdded = ""
//            @State var api = apiCall()
//            //    @State var model = ViewModel()
//            @ObservedObject var model = ViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
//                List (model.list) { item in
//                    Text(item.name)
//                }
        //        Button {
        //            // add meal
        //            api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
        //                for foood in [FoodArray] {
        //                    print(foood.foods[0].food_name)
        //                    model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
        //
        //                    newFoodAdded = ""
        //
        //                }
        //            }
        //        } label: {
        //            Text("Save meal")
        //        }
//                Divider()
            VStack{
                // Image("logo")
                VStack {
                    TextField("Enail Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        appViewModel.signUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    
                    
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Create Account")
            
            
        }
    }


struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.pink
                VStack(spacing: 20){
                    Text("Ja's Nutrients")
                    NavigationLink("View Daily Nutrients", destination: Text("Nutrients"))
                        .foregroundStyle(.white)
                }
            }
            .navigationTitle("Ja's Nutrients")
        }
    }
}

struct foodView: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                List (model.list) { item in
                    Text(item.name)
                    Text("\(item.sodium)")
                    Spacer()
                }

                Color.blue
                VStack(spacing: 20) {
                    Text("Add Foods")
                    NavigationLink(destination: ListOfFoodsView()) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                }
            }
            .navigationTitle("All foods")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        
    


