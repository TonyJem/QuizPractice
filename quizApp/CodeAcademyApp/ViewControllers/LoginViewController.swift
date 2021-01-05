//
//  LoginViewController.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    lazy var successAlert: UIAlertController = {
        let alert = UIAlertController(
            title: "Success!",
            message: "Login was sucessful!",
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
            message: "Login failed!",
            preferredStyle: .alert
        )
        let alertButton = UIAlertAction(
            title: "OK",
            style: .default
        )
        alert.addAction(alertButton)
        return alert
    }()

    override func viewDidLoad() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if
            AccountManager.login(
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

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Helpers

extension LoginViewController {

    func proceedToQuizView() {
        let storyboard = UIStoryboard(name: "QuizHome", bundle: nil)
        let quizHomeViewController = storyboard.instantiateViewController(identifier: "QuizHomeViewController")
        present(quizHomeViewController, animated: true)
    }
}

