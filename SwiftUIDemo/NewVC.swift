//
//  NewVC.swift
//  SwiftUIDemo
//
//  Created by Avninder Singh on 11/04/21.
//  Copyright © 2021 Avninder Singh. All rights reserved.
//

import SwiftUI

struct NewVC: View {
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    @State private var amount: CGFloat = 50
    @State private var name = "Avninder Singh"

    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    let duedate = Date()
    
    var body: some View {
        // testing
        ScrollView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image("img")
                        .resizable()
                    .scaledToFit()
    //                    .frame(height: 200)
                    Text("Avninder Singh")
                        .padding(5)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(Color.white)
                        .offset(x: -5, y: -5)
                }
                
                Text("Due date: \(duedate, formatter: NewVC.dateFormatter)")
                    .padding()
                
                Picker("Text alignment", selection: $alignment) {
                    ForEach(alignments, id: \.self) { alignment in
                        Text(String(describing: alignment))
                    }
                }
                
                Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                    .font(.largeTitle)
                    .multilineTextAlignment(alignment)
                    .frame(width: 300)
                
                Slider(value: $amount, in: 0...100) {
                    Text("Adjust the amount of spacing")
                }
                
                TextField("Full name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textCase(.uppercase)
                    .padding(.horizontal)
                
                Label("Text Only", systemImage: "heart")
                    .font(.title)
//                    .labelStyle(TitleOnlyLabelStyle())
                
                Label("Icon Only", systemImage: "star")
                    .font(.title)
//                    .labelStyle(IconOnlyLabelStyle())
                         
                Label {
                    Text("Paul Hudson")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                } icon: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 64, height: 64)
                }
                
                if redactionReasons == .placeholder {
                    Text("Loading…")
                } else {
                    Text(bio)
                        .redacted(reason: redactionReasons)
                }
//                Spacer()
            }

        }
        .navigationBarTitle("Details", displayMode: .inline)
    }
}

struct NewVC_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewVC()
        }
    }
}
