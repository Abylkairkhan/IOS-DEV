//
//  ContentView.swift
//  IAmRich
//
//  Created by Abylkairkhan Sarsetayev on 27.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("diamond")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("My First App!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
