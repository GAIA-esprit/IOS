//
//  QuizHistoryEntry.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 22/11/2023.
//
import Foundation

struct QuizHistoryEntry: Codable, Identifiable {
    var id: String
    var userID: String
    var quizID: String
    var selectedAnswer: String
    var timestamp: Date

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userID
        case quizID
        case selectedAnswer
        case timestamp
    }

    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        userID = try container.decode(String.self, forKey: .userID)
        quizID = try container.decode(String.self, forKey: .quizID)
        selectedAnswer = try container.decode(String.self, forKey: .selectedAnswer)

        let timestampString = try container.decode(String.self, forKey: .timestamp)
        timestamp = Self.iso8601Full.date(from: timestampString) ?? Date()
    }
}
