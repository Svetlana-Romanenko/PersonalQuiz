//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiLabel.text = "Вы - " + String(showResults().rawValue)
        descriptionLabel.text = showResults().definition
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}

extension ResultsViewController {
    private func showResults() -> AnimalType {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for answer in answers {
            switch answer.type {
            case .dog: dogCount+=1
            case .cat: catCount+=1
            case .rabbit: rabbitCount+=1
            case .turtle: turtleCount+=1
            }
        }
        
        var dictionaryOfTypes: [AnimalType: Int] = [:]
        dictionaryOfTypes[.dog] = dogCount
        dictionaryOfTypes[.cat] = catCount
        dictionaryOfTypes[.rabbit] = rabbitCount
        dictionaryOfTypes[.turtle] = turtleCount

        let character = dictionaryOfTypes.max {firstAnswer, secondAnswer in firstAnswer.value < secondAnswer.value }
        
        return character!.key
}
}
