//
//  MainView.swift
//  SwiftUIDemo
//
//  Created by Avninder Singh on 12/04/21.
//  Copyright © 2021 Avninder Singh. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            NewVC()
                .padding()
                .tabItem { Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "42.circle") }
                ) }

            Text("Second View")
                .padding()
                .tabItem { Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "42.circle") }
                ) }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
