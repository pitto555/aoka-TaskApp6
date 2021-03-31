//
//  ViewController.swift
//  aoka-TaskApp6
//
//  Created by aoka on 2021/03/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var intLabel: UILabel!
    
    @IBOutlet private weak var slider: UISlider!

    private var answer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    //判定ボタン
    @IBAction func answerAction(_ sender: Any) {
        let slidervalue = Int(slider.value)
        
        if answer == slidervalue {
            aleat(messageText: "あたり!" + "\n" + "あなたの値:\(slidervalue)")
        } else {
            aleat(messageText: "はずれ!" + "\n" + "あなたの値:\(slidervalue)")
        }
    }
    
    //アラートを表示する関数
    private func aleat(messageText:String){
        let alert = UIAlertController(title: "結果", message: messageText, preferredStyle: .alert)
        
        let challenge = UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] _ in
            self?.reset()
        })
        alert.addAction(challenge)

        present(alert, animated: true, completion: nil)
    }
    
    //リセットする関数
    private func reset() {
        answer = Int.random(in: 1...100)
        intLabel.text = String(answer)
        slider.value = 50
    }
}
