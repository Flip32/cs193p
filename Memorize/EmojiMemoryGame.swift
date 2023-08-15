import SwiftUI


// View Model
class EmojiMemoryGame: ObservableObject {
    // static deixa a variavel global, podendo ser usada antes de inicializar a class
    private static let emojis = [ "🕷", "👻", "🎃", "🕯️", "🧙🏾", "🍭", "💀", "👹", "🕸️", "🍬", "☠️", "🙀"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(
            numberOfPairsOfCards: 8){ pairIndex in
                if emojis.indices.contains(pairIndex){
                    return emojis[pairIndex]
                } else {
                    return "⁉︎"
                }
            }
    }
    
    @Published private var newMemoryGame = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return newMemoryGame.cards
    }
    
    // MARK: - Intents
    
    // Intent of the user
    func choose(_ card: MemoryGame<String>.Card) {
        newMemoryGame.choose(card)
    }
    
    func shuffle() {
        newMemoryGame.shuffle()
    }
    
    
}
