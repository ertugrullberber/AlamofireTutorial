//
//  CategoryDetail.swift
//  AlamofireTutorial
//
//  Created by Ertugrul Berber on 24.07.2022.
//

import SwiftUI
import Alamofire

struct CategoryDetail: View {
    
    @State var category : CategoryModel = CategoryModel()
    var id : Int
    var body: some View {
        VStack{
            Text("Id: \(category.id)")
                .padding()
            
            Text("Name: \(category.name)")
                .padding()
            
            Text("Description: \(category.description)")
                .padding()
            
        }.onAppear{
            let request = AF.request("https://northwind.vercel.app/api/categories/\(id)")
            
            request.responseDecodable(of: CategoryModel.self) { response in
                
                category = response.value ?? CategoryModel()
                
            }
        }
        
    }
}

