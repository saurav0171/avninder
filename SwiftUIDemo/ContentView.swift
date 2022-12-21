//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Avninder Singh on 12/01/21.
//  Copyright © 2021 Avninder Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    let header = [Header(name: "First"),
                  Header(name: "Second")]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(header) { title in
                    Section(header: Text(title.name)) {
                        ForEach(1...3, id: \.self) { index in
                            
                            NavigationLink(destination: NewVC()) {
                                ItemRow(value: index)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: Identifiable {
    let id = UUID()
    let name: String
}
