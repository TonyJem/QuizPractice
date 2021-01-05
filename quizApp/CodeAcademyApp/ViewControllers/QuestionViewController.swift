//
//  QuestionViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-28.
//

import UIKit

class QuestionViewController: UIViewController {

    private var currentQuestionIndex = 0

    // MARK: - UI Components

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!

    // MARK: - Button actions

    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex < QuizManager.questions.count {
            let firstQuestion = QuizManager.questions[currentQuestionIndex]
            questionLabel.text = firstQuestion.questionDescription
            firstChoiceButton.setTitle(firstQuestion.firstAnswer, for: .normal)
            secondChoiceButton.setTitle(firstQuestion.secondAnswer, for: .normal)
            thirdChoiceButton.setTitle(firstQuestion.thirdAnswer, for: .normal)
            fourthChoiceButton.setTitle(firstQuestion.fourthAnswer, for: .normal)
        } else {
            dismiss(animated: true)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let firstQuestion = QuizManager.questions.first {
            questionLabel.text = firstQuestion.questionDescription
            firstChoiceButton.setTitle(firstQuestion.firstAnswer, for: .normal)
            secondChoiceButton.setTitle(firstQuestion.secondAnswer, for: .normal)
            thirdChoiceButton.setTitle(firstQuestion.thirdAnswer, for: .normal)
            fourthChoiceButton.setTitle(firstQuestion.fourthAnswer, for: .normal)
        }
        // Write your functionality here - below super.viewDidLoad()
    }
}
