//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 09.03.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IBActions
    @IBOutlet weak var resultIcon: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
        
    // MARK: - Public Properties
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Private methods
    private func calculationOfResults()->AnimalType? {
        
        let resultDict = Dictionary(
            grouping: answers,
            by: { $0.type }
        )
        
        return resultDict.sorted{$0.value.count > $1.value.count}.first?.key
    }
    
    private func updateUI() {
        navigationItem.setHidesBackButton(true, animated: false)
        
        guard let animal = calculationOfResults() else {return}

        resultIcon.text        = "Вы \(String(animal.rawValue))"
        resultDescription.text = animal.definition
    }
    
}
