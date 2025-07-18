//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Никита Грицунов on 17.07.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//
import UIKit

struct QuizBrain {
    let questionsArray = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                          Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                          Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                          Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                          Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                          Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                          Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                          Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                          Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                          Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionsNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ buttonTag: Int) -> Bool {
        let answer = questionsArray[questionsNumber].answers[buttonTag]
        let correctAnswer = questionsArray[questionsNumber].correctAnswer
        
        if answer == correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return questionsArray[questionsNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionsNumber + 1) / Float(questionsArray.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getAnswerText(tag: Int) -> String {
        return questionsArray[questionsNumber].answers[tag]
    }
    
    mutating func nextQuestion() {
        if questionsNumber < (questionsArray.count - 1) {
            questionsNumber += 1
        } else {
            questionsNumber = 0
            score = 0
        }
    }
}
