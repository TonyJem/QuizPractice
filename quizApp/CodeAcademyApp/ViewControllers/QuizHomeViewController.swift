//
//  QuizHomeViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-28.
//

import UIKit

class QuizHomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var addQuestionsButton: UIButton!

    @IBAction func beginButtonPressed(_ sender: Any) {
        proceedToQuestionView()
    }

    @IBAction func logoutButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func addQuestionsPressed(_ sender: Any) {
        proceedToAddQuestionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let loggedInAccount = AccountManager.loggedInAccount else { return }
        addQuestionsButton.isHidden = loggedInAccount.accountType == .normalUser
        welcomeLabel.text = "Welcome to the quiz, " + loggedInAccount.username
    }
}

// MARK: - Helpers

extension QuizHomeViewController {

    func proceedToQuestionView() {
        let storyboard = UIStoryboard(name: "QuizHome", bundle: nil)
        let questionViewController = storyboard.instantiateViewController(identifier: "QuestionViewController")
        present(questionViewController, animated: true)
    }

    func proceedToAddQuestionView() {
        let storyboard = UIStoryboard(name: "QuizHome", bundle: nil)
        let questionViewController = storyboard.instantiateViewController(identifier: "AddQuestionViewController")
        present(questionViewController, animated: true)
    }
}
