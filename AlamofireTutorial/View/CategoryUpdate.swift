//
//  CategoryUpdate.swift
//  AlamofireTutorial
//
//  Created by Ertugrul Berber on 24.07.2022.
//

import SwiftUI
import Alamofire

struct CategoryUpdate: View {
    
    var id: Int
    
    @State var category : CategoryModel = CategoryModel()
    
    
    var body: some View {
        VStack{
            TextField("Name: " , text: $category.name)
            
            TextField("Description: " , text: $category.description)
            
            Button("Update") {
                let newCategory : [String: Any] = [
                    "name" : category.name,
                    "description" : category.description
                ]
                let request = AF.request("https://northwind.vercel.app/api/categories/\(id)", method: .put, parameters: newCategory, encoding: JSONEncoding.default)
    
                request.response{ res in
                    if res.response?.statusCode == 200 {
                        print("Update Success!!")
                    }
                    
                }
            }
            
        }.onAppear{
            let request = AF.request("https://northwind.vercel.app/api/categories/\(id)")
            
            request.responseDecodable(of: CategoryModel.self) { response in
                
                category = response.value ?? CategoryModel()
                
            }
        }
    }
}


