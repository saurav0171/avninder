//
//  ItemRow.swift
//  SwiftUIDemo
//
//  Created by Avninder Singh on 11/04/21.
//  Copyright © 2021 Avninder Singh. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var value = 0
    
    var body: some View {
        HStack() {
            Image("img")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 100, height: 100, alignment: .center)
            .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 1))
            VStack(alignment: .leading) {
                Text("Title name \(value)")
                    .font(.headline)
                Text("$100.0")
            }
            Spacer()
            
            Text("G")
                .font(.caption)
                .fontWeight(.black)
                .padding()
                .background(Color.green)
                .clipShape(Circle())
                .foregroundColor(.white)

        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow()
    }
}
