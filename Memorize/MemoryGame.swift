import Foundation

// Model
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards X 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFacedUp }.only }
        set { cards.indices.forEach { cards[$0].isFacedUp = (newValue == $0) }}
    }
    
    
    mutating func choose(_ card: Card) {
        print("chose: \(card)")
        if let index = cards.firstIndex(where: {$0.id == card.id}) {
            
            if !cards[index].isFacedUp && !cards[index].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[index].content == cards[potentialMatchIndex].content {
                        cards[index].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = index
                }
                cards[index].isFacedUp = true
            }
            
            
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        //        static func == (lhs: Card, rhs: Card) -> Bool {
        //            return lhs.isFacedUp == rhs.isFacedUp &&
        //            lhs.isMatched == rhs.isMatched &&
        //            lhs.content == rhs.content
        //        }
        var isFacedUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFacedUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
