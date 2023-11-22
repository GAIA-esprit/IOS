//
//  PageModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation


struct Page: Identifiable, Equatable
{
    let id = UUID()
    var name : String
    var description: String
    var imageUrl: String
    var tag: Int
    static var samplepage = Page(name: "test", description: "test", imageUrl: "test", tag: 0)
    static var samplePages: [Page] = [
        Page(name: "Quiz", description: "Test your knowledge in a chanllenging multi option quiz", imageUrl: "", tag: 0),
        Page(name: "Swipper", description: "Answer the quesiton by swipping the correct answer either right or left", imageUrl: "swiper", tag: 1),
        Page(name: "Collecter", description: "Save the planet by sorting the waste in its appropriate recycling bin", imageUrl: "sorter", tag: 2),
        Page(name: "Pet", description: "Protect the ecosystem and those who live among us and cant defend themselves ", imageUrl: "happy1.1", tag: 3)]
}
