//
//  CategoryList.swift
//  AlamofireTutorial
//
//  Created by Ertugrul Berber on 23.07.2022.
//

import SwiftUI
import Alamofire

struct CategoryList: View {
    
    @State var categories : [CategoryModel] = []
    
    var body: some View {
        VStack{
            
            Text("Categories Count: \(categories.count)")
            
            ForEach(categories, id: \.self) {item in
                NavigationLink(destination: CategoryDetail(id: item.id)) {
                    Text(item.name)
                        .padding()
                    
                }
                
                NavigationLink(destination: CategoryUpdate(id: item.id)) {
                    Text("Update")
                        .padding()
                }
               
                
                
                
                Button("Delete"){
                    let request = AF.request("https://northwind.vercel.app/api/categories\(item.id)", method: .delete)
                    
                    request.response {res in
                        if res.response?.statusCode == 200 {
                            print("Success!!")
                            
                            let request = AF.request("https://northwind.vercel.app/api/categories")
                            
                //            request.responseJSON{ (data) in
                //                print(data)
                //            }
                            
                            request.responseDecodable(of: [CategoryModel].self){response in
                                
                                categories = response.value ?? []
                                
                                print(categories)
                                
                            }
                            
                        } else {
                            print("Hata")
                        }
                    }
                }
                
                
            }
            
        }.onAppear{
            let request = AF.request("https://northwind.vercel.app/api/categories")
            
//            request.responseJSON{ (data) in
//                print(data)
//            }
            
            request.responseDecodable(of: [CategoryModel].self){response in
                
                categories = response.value ?? []
                
                print(categories)
                
            }
    }
}
}
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
