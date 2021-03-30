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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
        
    }
    
    //判定ボタン
    @IBAction func answerAction(_ sender: Any) {
        
        let slidervalue:Int = Int(slider.value)
        
        if intLabel.text == String(slidervalue){
            
            aleat(messageText: "あたり!" + "\n" + "あなたの値:\(slidervalue)")
            
        } else {
            aleat(messageText: "はずれ!" + "\n" + "あなたの値:\(slidervalue)")
        }
        
    }
    
    //アラートを表示する関数
    private func aleat(messageText:String){
        
        let answer = UIAlertController(title: "結果", message: messageText, preferredStyle: .alert)
        
        let challenge = UIAlertAction(title: "再挑戦", style: .default, handler: {(action:UIAlertAction!) -> Void in
            
            self.reset()
        })
        
        answer.addAction(challenge)
        present(answer, animated: true, completion: nil)
    }
    
    //リセットする関数
    private func reset() {
        
        let  randomCount = Int.random(in: 1..<101)
        intLabel.text = String(randomCount)
        slider.value = 50
        
    }
}

