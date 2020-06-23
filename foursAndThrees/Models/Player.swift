//
//  Player.swift
//  foursAndThrees
//
//  Created by Mathias on 6/19/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

extension Player {
    
    @discardableResult
    convenience init(name: String, score: Int16, firstScore: Int16 = 0, secondScore: Int16 = 0, thirdScore: Int16 = 0, fourthScore: Int16 = 0, fifthScore: Int16 = 0 ,sixthScore: Int16 = 0, seventhScore: Int16 = 0) {
        self.init(context: CoreDataStack.context)
        self.name = name
        self.score = score
        self.firstScore = firstScore
        self.secondScore = secondScore
        self.thirdScore = thirdScore
        self.fourthScore = fourthScore
        self.fifthScore = fifthScore
        self.sixthScore = sixthScore
        self.seventhScore = seventhScore
    }
    
}
