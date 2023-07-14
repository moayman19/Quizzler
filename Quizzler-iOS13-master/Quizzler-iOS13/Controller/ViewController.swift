//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var quizBrain = QuizBrain()

   
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var laLable: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
     let userAnswer =  sender.currentTitle!
      let userGotItRight =  quizBrain.checkAnswer(userAnswer)
    
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
               
        quizBrain.nextQuestion()
       
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUi), userInfo:nil, repeats: false)
    }
    
    
    @objc func updateUi(){
        laLable.text = quizBrain.getQuestionText()
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        scoreLable.text = "Score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
}

