//
//  QuizManager.swift
//  CodeAcademyApp
//
//  Created by Arnas Sleivys on 2020-12-31.
//

struct QuizManager {

    static var questions = [
        Question(
            questionDescription: "My name is?",
            firstAnswer: "Arnas",
            secondAnswer: "Petras",
            thirdAnswer: "Karolis",
            fourthAnswer: "Jurgis",
            correctAnswer: "Arnas"
        ),
        Question(
            questionDescription: "My surname is?",
            firstAnswer: "Sleivys",
            secondAnswer: "Jornys",
            thirdAnswer: "Pranys",
            fourthAnswer: "Vonys",
            correctAnswer: "Sleivys"
        ),
        Question(
            questionDescription: "My age is?",
            firstAnswer: "14",
            secondAnswer: "20",
            thirdAnswer: "22",
            fourthAnswer: "24",
            correctAnswer: "24"
        ),
    ]
}
