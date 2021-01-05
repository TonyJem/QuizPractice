//
//  AddQuestionViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2021-01-05.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionDescriptionTextField: UITextField!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var fourthAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let question = makeQuestion() else {
            print("Missing question")
            return
        }
        QuizManager.questions.append(question)
        print("New question added")
    }
}

private extension AddQuestionViewController {
    
    var isAnswerValid: Bool {
        return correctAnswerTextField.text == firstAnswerTextField.text ||
            correctAnswerTextField.text == secondAnswerTextField.text ||
            correctAnswerTextField.text == thirdAnswerTextField.text ||
            correctAnswerTextField.text == fourthAnswerTextField.text
    }
    
    func makeQuestion() -> Question? {
        guard isAnswerValid,
              let questionDescription = questionDescriptionTextField.text,
              let firstAnswer = firstAnswerTextField.text,
              let secondAnswer = secondAnswerTextField.text,
              let thirdAnswer = thirdAnswerTextField.text,
              let fourthAnswer = fourthAnswerTextField.text,
              let correctAnswer = correctAnswerTextField.text,
              !questionDescription.isEmpty,
              !firstAnswer.isEmpty,
              !secondAnswer.isEmpty,
              !thirdAnswer.isEmpty,
              !fourthAnswer.isEmpty,
              !correctAnswer.isEmpty
        else {
            return nil
        }
        return Question(questionDescription: questionDescription,
                        firstAnswer: firstAnswer,
                        secondAnswer: secondAnswer,
                        thirdAnswer: thirdAnswer,
                        fourthAnswer: fourthAnswer,
                        correctAnswer: correctAnswer)
    }
}
