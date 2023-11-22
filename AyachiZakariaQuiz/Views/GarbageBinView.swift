//
//  GarbageBinView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import SwiftUI

struct GarbageBinView: View {
    @State private var objects: [String] = []

    @State private var paper = [String]()
    @State private var metal = [String]()
    @State private var glass = [String]()
    @State private var bio = [String]()
    @State private var score = UserDefaults.standard.integer(forKey: "score")
    @State private var isLearnButtonEnabled = true
    @State private var showAlert = false

    var blue = ["📚", "🗞️", "💵", "📄", "📰 ", "📘"]
    var yellow = ["✂️", "🔪", "🔧", "🔩", "🛠️", "🚲", "🗝️", "📎"]
    var green = ["🍼", "📺", "🍶", "🥂", "🥃"]
    var brown = ["🍑", "🧀", "🍔", "🌰", "🍂", "🍞", "🍇", "🍏"]

    var body: some View {
        VStack {
            Text("Drop items in their bin")
                .font(.title)
                .padding()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: .infinity, height: 50)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(objects, id: \.self) { obj in
                            Text(obj)
                                .font(.title)
                                .padding()
                                .onDrag {
                                    NSItemProvider(object: obj as NSString)
                                }
                        }
                    }
                }
            }

            Button(action: {
                if isLearnButtonEnabled, let url = URL(string: "https://alda.company/en/articles/waste-bin-colours-what-do-they-mean") {
                    UIApplication.shared.open(url)
                    score += 10
                    UserDefaults.standard.set(score, forKey: "score")
                    isLearnButtonEnabled = false
                }
            }) {
                Text("Learn")
            }
            ZStack {
                VStack {
                        HStack {
                            BinView(color: .blue, name: "Paper", items: $paper, allowedItems: blue, originalItems: $objects)
                            BinView(color: .yellow, name: "Metal", items: $metal, allowedItems: yellow, originalItems: $objects)
                        }
                        HStack {
                            BinView(color: .green, name: "Glass", items: $glass, allowedItems: green, originalItems: $objects)
                            BinView(color: .brown, name: "Bio", items: $bio, allowedItems: brown, originalItems: $objects)
                                }
                            }
                        }
            Button(action: {
                refreshView()
            }) {
                Text("Refresh")
            }
        }
        .navigationBarHidden(true)
        .onAppear {
                    generateRandomObjects()
                }
    }
    private func generateRandomObjects() {
            let blueRandomItems = Array(blue.shuffled().prefix(3))
            let yellowRandomItems = Array(yellow.shuffled().prefix(3))
            let greenRandomItems = Array(green.shuffled().prefix(3))
            let brownRandomItems = Array(brown.shuffled().prefix(3))

            objects = blueRandomItems + yellowRandomItems + greenRandomItems + brownRandomItems
            objects.shuffle()
        }

    private func checkCorrectSorting() -> Bool {
        return paper.containsAll(blue) && metal.containsAll(yellow) && glass.containsAll(green) && bio.containsAll(brown)
    }

    private func refreshView() {
        isLearnButtonEnabled = true
        paper.removeAll()
        metal.removeAll()
        glass.removeAll()
        bio.removeAll()
        generateRandomObjects()
        // Restore the original objects
        //objects = ["✂️", "📚", "🍑", "🧀", "🔪", "🗞️", "🍼", "⚽️", "📺", "🔧", "💵", "🍔"]
    }
}

extension Array where Element: Equatable {
    func containsAll(_ elements: [Element]) -> Bool {
        return elements.allSatisfy(self.contains)
    }
}

struct BinView: View {
    var color: Color
    var name: String
    @Binding var items: [String]
    var allowedItems: [String]
    @Binding var originalItems: [String]

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: 150, height: 250)
            .overlay(
                VStack {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 5)
                    ForEach(items, id: \.self) { obj in
                        Text(obj)
                            .font(.title)
                            .padding()
                    }
                }
            )
            .onDrop(of: [.plainText], delegate: TextDropDelegate(items: $items, allowedItems: allowedItems, originalItems: $originalItems))
    }
}
struct TextDropDelegate: DropDelegate {
    @Binding var items: [String]
    var allowedItems: [String]
    @Binding var originalItems: [String]
    

    func performDrop(info: DropInfo) -> Bool {
        let items = info.itemProviders(for: [.plainText])
        for item in items {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) { text, _ in
                if let data = text as? Data, let inputStr = String(data: data, encoding: .utf8) {
                    if allowedItems.contains(inputStr) {
                        DispatchQueue.main.async {
                            self.items.append(inputStr)
                            if let index = self.originalItems.firstIndex(of: inputStr)
                            {
                                self.originalItems.remove(at: index)
                            }
                        }
                    }
                }
            }
        }
        return true
    }
}
struct GarbageBinView_Previews: PreviewProvider {
    static var previews: some View {
        GarbageBinView()
    }
}
