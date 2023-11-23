//
//  ClearHistoryResult.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 23/11/2023.
//

import Foundation
struct ClearHistoryResult: Decodable {
    let message: String
    let deletedCount: Int
}
