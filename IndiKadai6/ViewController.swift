//
//  ViewController.swift
//  IndiKadai6
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var randomTextLabel: UILabel!
    @IBOutlet private weak var answereSlider: UISlider!
    private var correctAnswer: Int = 50
    private let gameRule = GameRule()
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction private func judgementButton(_ sender: Any) {
        do {
            let answer = Int(answereSlider.value)
            let isCorrect = try gameRule.judgeAnswer(subject: correctAnswer, answer: answer)
            showAlert(message: "\(isCorrect ? "あたり！" : "はずれ！")あなたの値：\(answer)")
        } catch GameRule.Error.outOfRange {
            showAlert(message: "エラーが発生しました")
        } catch {
            showAlert(message: "エラーが発生しました")
        }
    }
    private func reset() {
        correctAnswer = gameRule.createRandomValue()
        randomTextLabel.text = String(correctAnswer)
        answereSlider.value = 50
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "課題6", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default) { _ in
            self.reset()
        })
        self.present(alert, animated: true)
    }
}

internal struct GameRule {
    enum Error: Swift.Error {
        case outOfRange
    }

    private let valueRange = 1...100

    func createRandomValue() -> Int {
        Int.random(in: valueRange)
    }

    func judgeAnswer(subject: Int, answer: Int) throws -> Bool {
        guard valueRange.contains(subject),
              valueRange.contains(answer) else {
                  throw Error.outOfRange
        }

        return answer == subject
    }
}
