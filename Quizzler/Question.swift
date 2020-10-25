//
//  Question.swift
//  Quizzler
//
//  Created by Jeet Singh on 21/10/2563 BE.
//  Copyright © 2563 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    var questionText : String
    var answer : Bool
    
    init(text:String, correctAnswer : Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}


