//
//  HomeView.swift
//  MathGame
//
//  Created by Denidu Gamage on 2024-10-09.
//

import SwiftUI

enum MathOperator: String, CaseIterable{
    case addition = "+"
    case substraction = "-"
    case multiplication = "*"
    case devision = "/"
}

struct HomeView: View {
    @State private var num1: Int = Int.random(in: 0..<100)
    @State private var num2: Int = Int.random(in: 0..<10)
    @State var mathOperator: MathOperator = MathOperator.allCases.randomElement()!
    @State var userInput: String = ""
    @State var points: Int = 0
    @State var message: String = ""
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Text("Guess The Answer!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    
                    Text("What is \(num1) \(mathOperator.rawValue) \(num2) ?")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack{
                        TextField("Your Answer" , text: $userInput)
                            .keyboardType(.numberPad)
                            .font(.system(size: 20))
                        
                        Button("Submit") {
                            checkAnswer()
                        }.buttonStyle(.bordered)
                            .tint(Color(hue: 0.599, saturation: 0.979, brightness: 0.48))
                            .fontWeight(.bold)
                        
                        
                    }.padding()
                        .frame(minWidth: 10,maxHeight: 50)
                        .border(Color.black)
                    
                    Text("\(message)")
                    
                    Text("\(points)")
                        .fontWeight(.bold)
                        .font(.system(size: 120))
                        .padding()
                    
                    Button("Next") {
                        randomQuestions()
                    }.buttonStyle(.bordered)
                        .tint(Color(hue: 0.357, saturation: 1.0, brightness: 0.799))
                        .fontWeight(.bold)
                }
                
            }
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundStyle(.black)
            .background(Color(hue: 0.588, saturation: 0.316, brightness: 0.97))
            .onAppear{
                randomQuestions()
            }
    }
    
    func randomQuestions(){
        num1 = Int.random(in: 0..<100)
        num2 = Int.random(in: 0..<10)
        mathOperator = MathOperator.allCases.randomElement()!
        
    userInput = ""
    }
    
    func checkAnswer(){
        guard let answer = Int(userInput) else{return}
        
        let correctAnswer: Int
        switch mathOperator{
        case.addition:
            correctAnswer = num1 + num2
        case.substraction:
            correctAnswer = num1 - num2
        case.multiplication:
            correctAnswer = num1 * num2
        case.devision:
            if num2 == 0 {
                randomQuestions()
            }
            correctAnswer = num1 / num2

        }
        if answer == correctAnswer{
            points += 1
            message = "Your answer Is Correct!"
        }else{
            points -= 1
            message = "Your answer is Incorrect. Correct Answer is \(correctAnswer)"
        }
        
    }
}

#Preview {
    HomeView()
}
