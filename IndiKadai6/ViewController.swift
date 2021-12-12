//
//  ViewController.swift
//  IndiKadai6
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var randomTextLabel: UILabel!
    @IBOutlet private weak var answereSlider: UISlider!
    private var randomInt: Int = 50
    let actions = Actions()
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }

    @IBAction private func judgementButton(_ sender: Any) {
        showAlert(message: actions.judgeAnswere(subject: randomInt, answere: Int(answereSlider.value)))
    }
    private func reset() {
        randomInt = actions.createRandomInt()
        randomTextLabel.text = String(randomInt)
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

internal struct Actions {
    func createRandomInt() -> Int {
        return Int(arc4random_uniform(100) + 1)
    }

    func judgeAnswere(subject: Int, answere: Int) -> String {
        guard (1...100).contains(subject),
              (1...100).contains(answere) else {
            return "エラーが発生しました"
        }
        if answere == subject {
            return "あたり！あなたの値：\(answere)"
        } else {
            return "はずれ！あなたの値：\(answere)"
        }
    }
}
