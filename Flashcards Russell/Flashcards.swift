//
//  Flashcards.swift
//  Flashcards Russell
//
//  Created by iD Student on 7/4/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import Foundation

class Flashcard {
    var question : String
    
    var options: [String]
    var correctAnswer : String
    
    init(question : String, options : [String]){
        self.question = question
        self.options = options
        
        self.correctAnswer = options[0]
    }
}

class CardCollection {
    
    // Single instance of the card collection//
    //access with class name.static variablename CardCollection.instance//
    public static var instance : CardCollection = CardCollection()
    
    public private(set) var cards : [Flashcard]
    
    public private(set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        get { return cards[currentIndex] }
    }
    //to access the current flashcard type CardCollection.instance.currentCard//
    private init() {
        
        cards = [ Flashcard(question: "test Question", options: ["True","False"]),Flashcard(question: "trump is the president of 2017", options: ["True","False"]),Flashcard(question: "im am 16 years old on july 4th 2017", options: ["True","False"])]
        
        currentIndex = 0;
    }
    func nextQuestion() {
        currentIndex += 1
        if(currentIndex >= cards.count){
            currentIndex = 0
        }
    }
    
    public func checkAnswer(_ selectedAnswer :Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
}
