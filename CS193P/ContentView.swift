//
//  ContentView.swift
//  CS193P
//
//  Created by  JT on 21/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(content:{
        CardView(isFaceUp: true)
        CardView(isFaceUp: false)
        CardView(isFaceUp: false)
        })
    }
}

struct CardView:View{
    var isFaceUp:Bool=false
    var body:some View{
        ZStack(content:{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 11).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 11).strokeBorder(lineWidth: 8)
                Text("✅").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 11).foregroundColor(.black)
                RoundedRectangle(cornerRadius: 11).strokeBorder(lineWidth: 8)
                Text("✅").font(.largeTitle)
            }
        })
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
