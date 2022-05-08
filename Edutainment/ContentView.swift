//
//  ContentView.swift
//  Edutainment
//
//  Created by Dom Bryan on 21/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var isRunning = false
    @State private var showingScore = false
    @State private var timesTables = 1
    @State private var currentQuestion = 0
    @State private var numberOfQuestions = [5, 10, 15, 20]
    @State private var questions = 5

    @State private var showingGame = false
    
    @State private var userAnswer = ""
    @State private var correctAnswers = Int.random(in: 0...2)
    @State private var questionsAsked: [String] = []
    
    ///
    var body: some View {
        NavigationView {
                    Form {
                        Section(header: Text("Choose your times table")) {
                            Stepper(value: $timesTables, in: 1...12) {
                                Text(" \(timesTables) times tables")
                            }
                        }
                        
                        
                        Section(header: Text("Number of questions?")) {
                            Picker("Number of questions", selection: $questions) {
                                ForEach(numberOfQuestions, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Button("Start Game!") {
                            showingGame.toggle()
                        }
                        
                        
                    }
                    .navigationTitle("Edutainment")
                    .sheet(isPresented: $showingGame) {
                        GameView(questions: createGame(numOfQuestions: questions),
                                 timesTables: timesTables)
                    }
            
            
                    //AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .mint, .blue, .purple, .pink]), center: .center)
       
        }
        
    }

///
    func createGame(numOfQuestions: Int) -> [Int] {
        var gameQuestions: [Int] = []
        for _ in 1...numOfQuestions {
            gameQuestions.append(Int.random(in: 1...12))
        }
        print(gameQuestions)
        return gameQuestions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
