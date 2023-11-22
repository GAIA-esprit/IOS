//
//  BackOffice.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import SwiftUI

struct BackOffice: View {
    var body: some View {
        NavigationLink {
            QuizView()
        } label: {
            PrimaryButton(text: "Add")
        }
        NavigationLink {
            QuizListView()
        } label: {
            PrimaryButton(text: "Manage")
        }
    }
}

struct BackOffice_Previews: PreviewProvider {
    static var previews: some View {
        BackOffice()
    }
}
