//
//  ContentView.swift
//  RideApp
//
//  Created by Tim Beals on 4/14/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Distance Evaluation").font(.title).bold()
            Circle().frame(width: 300, height: 300)
            HStack {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "gear")
                })
            }.padding(.trailing, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
