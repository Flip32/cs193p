import SwiftUI

let myCornerRadius: CGFloat = 12

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedUp: true)
            CardView()
        }
        .foregroundColor(.cyan)
        .padding()
    }
}


struct CardView: View {
    var isFacedUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if (isFacedUp) {
                RoundedRectangle(cornerRadius: myCornerRadius)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: myCornerRadius)
                    .stroke(lineWidth: 4)
                Text("🥑").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: myCornerRadius)
            }
        })
        
    }
}



















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
