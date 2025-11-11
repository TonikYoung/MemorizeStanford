//
//  MemorizeApp.swift
//  Memorize
//
//  Created by abramovanto on 06.11.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject
    var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
