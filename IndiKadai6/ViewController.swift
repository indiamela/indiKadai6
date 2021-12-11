//
//  ViewController.swift
//  IndiKadai6
//
//  Created by Taishi Kusunose on 2021/12/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var randomTextLabel: UILabel!
    @IBOutlet private weak var answereSlider: UISlider!
    private var randomInt: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    @IBAction private func judgementButton(_ sender: Any) {
        let answere = Int(answereSlider.value)
        guard (1...100).contains(answere) else {
            showAlert(message: "エラーが発生しました")
            return
        }
        if answere == randomInt {
            showAlert(message: "あたり！あなたの値：\(answere)")
        } else {
            showAlert(message: "はずれ！あなたの値：\(answere)")
        }
    }
    private func reset() {
        randomInt = Int(arc4random_uniform(100) + 1)
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
