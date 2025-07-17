//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userGotItUp = quizBrain.checkAnswer(sender.tag)
        
        if userGotItUp {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        quizBrain.nextQuestion()
    }
    
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = .clear
        choice2.backgroundColor = .clear
        choice3.backgroundColor = .clear
        updateButtons()
    }
    
    func updateButtons() {
        choice1.setTitle(quizBrain.getAnswerText(tag: 0), for: .normal)
        choice2.setTitle(quizBrain.getAnswerText(tag: 1), for: .normal)
        choice3.setTitle(quizBrain.getAnswerText(tag: 2), for: .normal)
        
        
    }
}



