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
    @State var isFaceUp:Bool=false
    
    var body:some View{
        ZStack(content:{
            let base=Circle()
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 8)
                Text("✅").font(.largeTitle)
            }else{
                base.fill(.black)
                base.strokeBorder(lineWidth: 8)
                Text("✅").font(.largeTitle)
            }
        })
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
