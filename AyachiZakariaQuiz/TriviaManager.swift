//
//  TriviaManager.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 6/11/2023.
//

import Foundation

class TriviaManager: ObservableObject{
    private(set) var trivia: [Trivia.Result] = []
    @Published private (set) var length = 0
    @Published private (set) var index = 0
    @Published private (set) var reachedEnd = false
    @Published private (set) var answerSelected = false
    @Published private (set) var question: AttributedString = ""
    @Published private (set) var answerChoices : [Answer] = []
    @Published private (set) var progress : CGFloat = 0.00
    @Published private (set) var score = 0
    
    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    func fetchTrivia() async{
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=17") else { fatalError("no url")}
        
        let urlRequest = URLRequest(url: url)
        
        do{
            let (data,response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error loading darta")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async {
                self.trivia = decodeData.results
                self.length = self.trivia.count
                self.setQuestion()
            }
        }catch{
            print("error fething trivia")
        }
        }
    func goNextQuestion(){
        if index + 1 < length {
            index += 1
            setQuestion()
        }else {
            reachedEnd = true
        }
    }
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        
        if index < length {
            let currentQuestion = trivia[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answer        }
    }
    
    func selectAnswer(answer: Answer)
    {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
        
    }
    }
