//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    var quizBrain = QuizBrain()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0
        updateDisplayedQuestion()
     
    }

    func updateDisplayedQuestion(){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestion().text
        progressBar.progress = quizBrain.getProgress()
        
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
       
        if( quizBrain.checkAnswer(answer: sender.currentTitle!)){
            sender.backgroundColor = UIColor.green
            //quizBrain.score += 1
            quizBrain.addPoint()
            
            
        }else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion(progressBar)
     
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateDisplayedQuestion()
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
            
        }
        
    }
}

