//
//  ViewController.swift
//  Trivia
//
//  Created by Gracious Ogyiri Asare on 3/12/25.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var askquestionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    struct Question {
            let category: String
            let text: String
            let choices: [String]
            let correctAnswer: String
        }
    
    var questions: [Question] = [
            Question(category: "Entertainment: Video Games", text: "What was the first weapon pack for 'PAYDAY'?", choices: ["The Gage Weapon Pack #1", "The Overkill Pack", "The Gage Chivalry Pack", "The Gage Historical Pack"], correctAnswer: "The Gage Weapon Pack #1"),
            Question(category: "Math", text: "What is 5 x 6?", choices: ["30", "25", "20", "35"], correctAnswer: "30"),
            Question(category: "Science", text: "What planet is known as the Red Planet?", choices: ["Earth", "Mars", "Venus", "Jupiter"], correctAnswer: "Mars"),
            Question(category: "Music", text: "What is the note also known as the sixteenth note?", choices: ["semibreve", "crochet", "quaver", "minim"], correctAnswer: "quaver"),
        ]

    var currentQuestionIndex = 0
    var correctAnswers = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        }
    
    func displayQuestion() {
            let question = questions[currentQuestionIndex]
            questionLabel.text = "Question: \(currentQuestionIndex + 1)/\(questions.count)"
            topicLabel.text = question.category
            askquestionLabel.text = question.text
            option1.setTitle(question.choices[0], for: .normal)
            option2.setTitle(question.choices[1], for: .normal)
            option3.setTitle(question.choices[2], for: .normal)
            option4.setTitle(question.choices[3], for: .normal)
        }
        
        @IBAction func answerSelected(_ sender: UIButton) {
            let question = questions[currentQuestionIndex]

                // Check if the answer is correct
                if sender.currentTitle == question.correctAnswer {
                    correctAnswers += 1
                }

                currentQuestionIndex += 1

                if currentQuestionIndex < questions.count {
                    displayQuestion()
                } else {
                    showResults()
                }
        }
    
    func showResults() {

        let alert = UIAlertController(
            title: "Game Over",
            message: "You got \(correctAnswers) out of \(questions.count) correct!",
            preferredStyle: .alert
        )

        let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
            self.restartGame()
        }

        alert.addAction(restartAction)
        present(alert, animated: true)
    }
    func restartGame() {
        currentQuestionIndex = 0
        correctAnswers = 0
        displayQuestion()  
    }
    
    
}
