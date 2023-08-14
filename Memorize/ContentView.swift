import SwiftUI

let myCornerRadius: CGFloat = 12
let base = RoundedRectangle(cornerRadius: myCornerRadius)

let emojis: [String] = [ "🕷", "👻", "🎃", "🕯️", "🧙🏾", "🍭", "💀", "👹", "🕸️", "🍬", "☠️", "🙀"]

struct Emoji: Identifiable {
    let id = UUID()
    let content: String
}

//let emojis: [Emoji] = [
//    Emoji(content: "🕷️"),
//    Emoji(content: "👻"),
//    Emoji(content: "🎃"),
//    Emoji(content: "🕯️"),
//    Emoji(content: "🧙🏾‍♀️"),
//    Emoji(content: "🍭"),
//    Emoji(content: "💀"),
//    Emoji(content: "👹"),
//    Emoji(content: "🕸️"),
//    Emoji(content: "🍬"),
//    Emoji(content: "☠️"),
//    Emoji(content: "🙀"),
//]

struct ContentView: View {
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.cyan)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
            Spacer()
            cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
}


struct CardView: View {
    let content: String
    // @State cria um pointer, para poder trocar o valor
    @State var isFacedUp = true
    // Trailing closures - qnd o ultimo argumento é a funcao, vc pode ocultar o content
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 4)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
