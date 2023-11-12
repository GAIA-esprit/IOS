//
//  GarbageBinView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import SwiftUI

struct GarbageBinView: View {
    let objects = ["✂️","📚","🍑","🧀","🔪","🗞️","🍼","⚽️","📺","🔧","💵","🍔"]
    
    @State var paper = [String]()
    @State var metal = [String]()
    @State var glass = [String]()
    @State var bio = [String]()
    @State private var showDetails = false
    var blue = ["📚","🗞️","💵"]
    var yellow = ["✂️","🔪","🔧"]
    var green = ["🍼","📺","🧀"]
    var brown = ["🍑","🧀","🍔"]
    
    var body: some View {
        
        VStack{
                Text("Drop items in their bin")
                .lilacTitle()
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                    .frame(width: .infinity, height: 50)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(objects,
                                id:\.self)
                        {
                            obj in Text(obj)
                                .font( .title)
                                .padding()
                                .onDrag {
                                    NSItemProvider(object: obj as NSString)
                                }
                        }
                    }
                }
            }
            Button(action: {
                if let url = URL(string: "https://alda.company/en/articles/waste-bin-colours-what-do-they-mean") {
                   UIApplication.shared.open(url)
                }
            }) {
                Text("Learn")
            }
            if (paper.contains(blue) && glass.contains(green) && metal.contains(yellow) && bio.contains(brown))
            {
                Text("Good Job").lilacTitle()
            }
            ZStack{
                VStack{
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .frame(width: 150, height: 250)
                            .overlay(ForEach(paper,
                                             id:\.self){ obj in Text(obj)
                                             .font(.title)
                                             .padding()
                                     })
                            .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $paper))
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.yellow)
                            .frame(width: 150, height: 250)
                            .overlay(ForEach(metal,
                                             id:\.self){ obj in Text(obj)
                                             .font(.title)
                                             .padding()
                                     })
                            .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $metal))
                    }
                    HStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.green)
                            .frame(width: 150, height: 250)
                            .overlay(ForEach(glass,
                                             id:\.self){ obj in Text(obj)
                                             .font(.title)
                                             .padding()
                                     })
                            .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $glass))
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.brown)
                            .frame(width: 150, height: 250)
                            .overlay(ForEach(bio,
                                             id:\.self){ obj in Text(obj)
                                             .font(.title)
                                             .padding()
                                     })
                            .onDrop(of: [.plainText], delegate: TextDropDelegate(objects: $bio))
                    }
                }
            }
        }
    }
}
struct TextDropDelegate: DropDelegate {
    @Binding var objects: [String]
    
    func performDrop(info: DropInfo) -> Bool {
        let items = info.itemProviders(for: [.plainText])
        for item in items {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) {
                text, _ in
                if let data = text as? Data {
                    let inputStr =
                    String(decoding: data, as: UTF8.self)
                    objects.append(inputStr)
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
