//
//  QuizHistoryView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 22/11/2023.
//

import SwiftUI

struct QuizHistoryView: View {
    @ObservedObject var viewModel: QuizHistoryViewModel
    @State private var isLoading = false
    @State private var selectedView: QuizHistoryViewStyle = .list
    @State private var showingAlert = false

    enum QuizHistoryViewStyle: String, CaseIterable {
        case list = "List"
        case grid = "Grid"
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select View", selection: $selectedView) {
                    ForEach(QuizHistoryViewStyle.allCases, id: \.self) { style in
                        Text(style.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Button("Clear History") {
                                    showingAlert = true
                                }
                                .foregroundColor(.red)
                                .padding()
                                .alert(isPresented: $showingAlert) {
                                    Alert(
                                        title: Text("Are you sure?"),
                                        message: Text("This will delete all quiz history. This action cannot be undone."),
                                        primaryButton: .destructive(Text("Clear History")) {
                                            viewModel.clearQuizHistory()
                                        },
                                        secondaryButton: .cancel()
                                    )
                                }
                if isLoading {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    switch selectedView {
                    case .list:
                        List(viewModel.quizHistory) { historyEntry in
                            HistoryEntryView(historyEntry: historyEntry, viewModel: viewModel)
                        }
                        .listStyle(PlainListStyle())
                        .padding()

                    case .grid:
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(viewModel.quizHistory) { historyEntry in
                                HistoryEntryView(historyEntry: historyEntry, viewModel: viewModel)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(10)
                                    .shadow(radius: 3)
                            }
                        }
                        .padding()
                    @unknown default:
                        // Handle unknown cases if needed
                        Text("Unknown View Style")
                    }

                }
            }
            .navigationBarTitle("Quiz History")
            .onAppear {
                isLoading = true
                viewModel.fetchQuizHistory()
                isLoading = false
            }
        }
    }
}

struct HistoryEntryView: View {
    let historyEntry: QuizHistoryEntry
    let viewModel: QuizHistoryViewModel

    var body: some View {
        NavigationLink(destination: QuizDetailsView(quizId: historyEntry.quizID, viewModel: viewModel)) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Quiz ID: \(historyEntry.quizID)")
                    .font(.headline)
                Text("Selected Answer: \(historyEntry.selectedAnswer)")
                Text("Timestamp: \(formattedTimestamp(historyEntry.timestamp))")
                    .foregroundColor(.secondary)
            }
        }
    }

    private func formattedTimestamp(_ timestamp: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return formatter.string(from: timestamp)
    }
}


struct QuizHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuizHistoryView(viewModel: QuizHistoryViewModel())
    }
}
