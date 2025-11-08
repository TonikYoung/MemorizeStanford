//
//  ContentView.swift
//  Memorize
//
//  Created by abramovanto on 06.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State
    var emojis: [String] = EmojiData.emojisHoliday.shuffled()

    var body: some View {
        VStack {
            Text(Constants.mainTitle)
                .font(.largeTitle)
            cards
            Spacer()
            themeSelection
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }

    var themeSelection: some View {
        HStack(spacing: 30) {
            themeButton(
                for: EmojiData.emojisCars,
                label: Constants.carsLabel,
                name: Constants.carsName
            )
            themeButton(
                for: EmojiData.emojisHoliday,
                label: Constants.holidayLabel,
                name: Constants.holidayName
            )
            themeButton(
                for: EmojiData.emojisAnimals,
                label: Constants.animalsLabel,
                name: Constants.animalsName
            )
        }
    }

    func themeButton(
        for theme: [String],
        label: String,
        name: String
    ) -> some View {
        VStack(spacing: 10) {
            Button(
                action: {
                    emojis = theme.shuffled()
                },
                label: {
                    Image(systemName: label)
                        .frame(height: 30)
                }
            )
            .imageScale(.large)
            .font(.largeTitle)
            Text(name)
                .foregroundStyle(.blue)
        }
    }
}

struct CardView: View {
    let content: String
    @State
    var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct EmojiData {
    static let emojisHoliday = ["👻", "👻", "🎃", "🎃", "🕷️", "🕷️", "😈", "😈", "💀", "🕸️", "🧙", "🙀", "☠️", "🍭", "🍭"]
    static let emojisCars = ["🚗", "🚕", "🚙", "🚚", "🚛", "🚜", "🚝", "🚞", "🚗", "🚕", "🚙", "🚚", "🚛", "🚜", "🚝"]
    static let emojisAnimals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🐻", "🐼", "🐨", "🐵", "🐧", "🐶", "🐱", "🐭", "🐹", "🐰"]
}

private enum Constants {
    static let mainTitle = "Memorize!"
    static let carsLabel = "car.circle"
    static let holidayLabel = "sun.horizon.circle"
    static let animalsLabel = "tortoise.circle"
    static let carsName = "Transport"
    static let holidayName = "Holiday"
    static let animalsName = "Animals"
}

#Preview {
    ContentView()
}
