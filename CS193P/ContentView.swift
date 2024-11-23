//
//  ContentView.swift
//  CS193P
//
//  Created by  JT on 21/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis :Array<String>=["🇬🇸","🏳️","🇨🇦","🇨🇦","🇵🇹","🏳️","🇨🇦","🇨🇦","🇵🇹"]
    
    @State var cardCount:Int=4
    
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCounter
        }
        .padding()
    }
    
    var cardCounter: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
            }
            .imageScale(.large)
            .font(.largeTitle)
        }
    
    func CardCountAdj(by offset:Int, symbol:String)-> some View{
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName:symbol)
        })
        .disabled(cardCount+offset<1 || cardCount+offset>emojis.count)
    }
    
    
    
    var cardRemover:some View{
        CardCountAdj(by: -1, symbol: "square.and.arrow.up.on.square")
    }
    
    var cardAdder:some View{
        CardCountAdj(by: +1, symbol: "square.and.arrow.down.fill")
    }
    
    var cards:some View{
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
}

struct CardView:View{
    
    @State var isFaceUp:Bool=true
    let content:String
    
    var body:some View{
        ZStack{
            let base=Circle()
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 8)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
