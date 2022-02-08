//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by faisal Almasri on 05/07/1443 AH.
//  Copyright © 1443 The App Brewery. All rights reserved.
//

import Foundation
struct Question {
    let text:String
    let answer:String
    
    init(q:String,a:String){
        text = q
        answer = a
    }
}
