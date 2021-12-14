//
//  ViewController.swift
//  IndiKadai6
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var randomTextLabel: UILabel!
    @IBOutlet private weak var answereSlider: UISlider!
    private var correctAnswere: Int = 50
    private let gameRule = GameRule()
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction private func judgementButton(_ sender: Any) {
        do {
            let answere = Int(answereSlider.value)
            let isCorrect = try gameRule.judgeAnswere(subject: correctAnswere, answere: answere)
            showAlert(message: "\(isCorrect ? "あたり！" : "はずれ！")あなたの値：\(answere)")
        } catch GameRule.Error.outOfRange {
            showAlert(message: "エラーが発生しました")
        } catch {
            showAlert(message: "エラーが発生しました")
        }
    }
    private func reset() {
        correctAnswere = gameRule.createRandomInt()
        randomTextLabel.text = String(correctAnswere)
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

    func createRandomInt() -> Int {
        return Int(arc4random_uniform(100) + 1)
    }

    func judgeAnswere(subject: Int, answere: Int) throws -> Bool {
        guard valueRange.contains(subject),
              valueRange.contains(answere) else {
                  throw Error.outOfRange
        }
        return answere == subject
    }
}
