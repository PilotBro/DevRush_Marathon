//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Никита Грицунов on 15.07.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
