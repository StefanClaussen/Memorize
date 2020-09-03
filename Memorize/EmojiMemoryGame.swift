

import SwiftUI


class EmojiMemoryGame {
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let availableEmojis = ["👻", "🎃", "🕷", "💀", "🪓", "6", "7", "8", "9", "10", "11", "12"]
        let count = Int.random(in: 1...availableEmojis.count)
        let emojis =  shuffledEmojis(available: availableEmojis, number: count)
        return MemoryGame<String>(numberOfPairsOfCards: count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }
    
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    static func shuffledEmojis(available: [String], number: Int) -> [String] {
        let shuffled = available.shuffled()
        return Array(shuffled[..<number])
    }
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
