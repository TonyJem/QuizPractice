//
//  RegisterViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    lazy var successAlert: UIAlertController = {
        let alert = UIAlertController(
            title: "Success!",
            message: "Registration was sucessful!",
            preferredStyle: .alert
        )
        let alertButton = UIAlertAction(
            title: "OK",
            style: .default
        )
        alert.addAction(alertButton)
        return alert
    }()

    lazy var failureAlert: UIAlertController = {
        let alert = UIAlertController(
            title: "Failure!",
            message: "Registration failed!",
            preferredStyle: .alert
        )
        let alertButton = UIAlertAction(
            title: "OK",
            style: .default
        )
        alert.addAction(alertButton)
        return alert
    }()

    @IBAction func registerButtonPressed(_ sender: Any) {
        if
            AccountManager.registerAccount(
                username: usernameTextField.text,
                password: passwordTextField.text
            )
        {
            proceedToQuizView()
        } else {
            present(failureAlert, animated: true)
        }
    }
}

// MARK: - UITextFieldDelegate methods

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Helpers

private extension RegisterViewController {

    func proceedToQuizView() {
        let storyboard = UIStoryboard(name: "QuizHome", bundle: nil)
        let quizHomeViewController = storyboard.instantiateViewController(identifier: "QuizHomeViewController")
        modalPresentationStyle = .fullScreen
        present(quizHomeViewController, animated: true)
    }
}

