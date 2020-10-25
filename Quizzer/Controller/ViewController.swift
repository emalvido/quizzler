//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    
    var quizBrain = QuizBrain()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateQuestion()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.621285677, green: 0.1269683242, blue: 0.1190494969, alpha: 1)
        }

//        if quizBrain.questionNumber < quizBrain.quiz.count - 1 {
//            quizBrain.questionNumber += 1
//        } else {
//            quizBrain.questionNumber = 0
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        }

        questionLbl.textAlignment = .left
        if self.quizBrain.questionNumber + 1 == self.quizBrain.quiz.count && self.quizBrain.score != 0 {
            counterLbl.text = "Score: \(quizBrain.getScore())"
            questionLbl.textAlignment = .center
            questionLbl.text = "Quiz is over."
            print("Before dispatch questionNumber = \(self.quizBrain.questionNumber) and score = \(self.quizBrain.score)")
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        } else {
            self.updateQuestion()
        }

    }

    @objc func updateQuestion() {
        quizBrain.nextQuestion()
        print("Displaying question number: \(quizBrain.questionNumber)")
        counterLbl.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        questionLbl.text = quizBrain.getNewQuestion()
    }
}

