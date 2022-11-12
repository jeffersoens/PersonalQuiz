//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

// 1. Избавиться от кнопки возврата назад на экране результатов +
// 2. Передать массив с ответами на экран с результатами +
// 3. Определить наиболее часто встречающийся тип животного
// 4. Отобразить результаты в соответствии с этим животным

// использовать функции высшего порядка map и sorted
// отдельный метод для поиска результата

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var whoYouAreLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public Preperties
    
    var answers: [Answer] = []
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        whoYouAreLabel.text = "Вы – \(findResult().rawValue) "
        descriptionLabel.text = findResult().definition
    }
    
    // MARK: - IBActions
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Find Result Method

extension ResultViewController {
    private func findResult() -> Animal {
        
        var result: Animal?
        
        var animals: [Animal] = []
        
        for answer in answers {
            let animal = answer.animal
            animals.append(animal)
        }
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for animal in animals {
            switch animal {
            case .dog:
                dog += 1
            case .cat:
                cat += 1
            case .rabbit:
                rabbit += 1
            case .turtle:
                turtle += 1
            }
        }
        
        let results = [dog, cat, rabbit, turtle]
        let sortedResults = results.sorted(by: >)
        
        switch sortedResults.first! {
        case dog:
            result = .dog
        case cat:
            result = .cat
        case rabbit:
            result = .rabbit
        default:
            result = .turtle
        }
        
        return result!
    }
}


