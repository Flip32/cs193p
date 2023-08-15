//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Filipe Lopes on 12/07/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
