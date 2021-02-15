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
        
        navigationItem.setHidesBackButton(true, animated: false)
    }
}

extension ResultsViewController {
    private func showResults() {
        
        var dictionaryOfTypes: [AnimalType: Int] = [:]
        let animals = answers.map{ $0.type }
        
        // Способ №1
        for animal in animals {
            if let animalTypeCount = dictionaryOfTypes[animal] {
                dictionaryOfTypes.updateValue(animalTypeCount+1, forKey: animal)
            } else {
                dictionaryOfTypes[animal] = 1
            }
        }
        
        // Способ №2
        /*
        for aninal in animals {
            dictionaryOfTypes[aninal] = (dictionaryOfTypes[aninal] ?? 0) + 1
        }
        */
        let character = dictionaryOfTypes.sorted { $0.value > $1.value }
        guard let currentAnimal = character.first?.key else { return }
        
        // Способ №3
        /*
         let currentType = Dictionary(grouping: answers) { $0.type }
         .sorted { $0.value.count > $1.value.count }
         .first?.key
         */
        updateUI(with: currentAnimal)
    }
    
    private func updateUI(with animal: AnimalType?) {
        
        emojiLabel.text = "Вы - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
