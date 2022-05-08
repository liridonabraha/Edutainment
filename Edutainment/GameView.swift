//
//  GameView.swift
//  Edutainment
//
//  Created by Dom Bryan on 20/01/2022.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var answer = ""
    @State var questions: [Int]
    @State private var question: Int = 10
    @State var timesTables: Int
    @State private var questionCount = 0
    @State private var score = 0
    @State private var endOfGameMessage = ""
    @State private var showingEndOfGame = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(timesTables) x \(questions[questionCount]) = ?")
                .font(.system(size: 50))
                
            
            TextField("Enter your answer", text: $answer)
                .multilineTextAlignment(.center)
                .font(.title)
                .keyboardType(.numberPad)
                .padding(50)
            
            Button("Submit") {
                calculateAnswer()
            }
            .frame(width: 150)
            .padding()
            .background(.green)
            .clipShape(Capsule())
            .foregroundColor(.white)
            
            Text("score: \(score)")
                .padding(.top, 100)
                .font(.title2)
        }
        .alert(endOfGameMessage, isPresented: $showingEndOfGame) {
            Button("Start again") {
                self.dismiss()
            }
        }
        .padding()
    }
    
    func nextQuestion() {
        if questionCount == questions.count - 1 {
            endOfGameMessage = "You scored \(score) out of \(questions.count)"
            showingEndOfGame.toggle()
            return
        }
        questionCount += 1
    }
    
    func calculateAnswer() {
        let correctAnswer = timesTables * questions[questionCount]
        let usersAnswer = Int(self.answer)
        
        if usersAnswer == correctAnswer {
            
            score += 1
        } else {
            
        }
        self.answer = ""
        nextQuestion()
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: [4, 6, 1, 12], timesTables: 8)
    }
}
