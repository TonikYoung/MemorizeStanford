//
//  MemorizeGame.swift
//  Memorize
//
//  Created by abramovanto on 09.11.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, myCardsContentFactory: (Int) -> CardContent) {
        cards = []
        //add numberOfpairsOfCards * 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = myCardsContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(_ card: Card) {
        
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
