//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    var allQuestions : QuestionBank = QuestionBank()
    var questionNumber : Int = 0
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allQuestions.list = allQuestions.list.shuffled()
        nextQuestion()
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            checkAnswer(pickedAnswer: true)
        }else{
            checkAnswer(pickedAnswer: false)
        }
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text =  "Score:\(score)"
        progressLabel.text = "\(questionNumber + 1)/ \(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber)
        print((view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber))
        
    }
    
    
    func nextQuestion() {
        if(questionNumber < allQuestions.list.count){
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else{
            let alert = UIAlertController(title: "Game Finished!!", message: "Would you like to restart", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "Cancle", style: .cancel)
            let restartAction = UIAlertAction(title: "Restart", style: .default) {
                (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            alert.addAction(cancleAction)
            present(alert, animated: true)
        }
    }
    func checkAnswer(pickedAnswer : Bool) {
        if(pickedAnswer == allQuestions.list[questionNumber].answer){
            print("Correct!")
            score += 100
        }else{
            print("Incorrect")
            
        }
        questionNumber += 1
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        allQuestions.list = allQuestions.list.shuffled()
        nextQuestion()
    }
}
