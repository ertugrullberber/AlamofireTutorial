//
//  ContentView.swift
//  AlamofireTutorial
//
//  Created by Ertugrul Berber on 24.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            CategoryList()
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
