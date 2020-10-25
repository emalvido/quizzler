//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Eduardo Malvido on 10/23/20.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}


