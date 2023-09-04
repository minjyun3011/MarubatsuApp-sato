//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 佐藤壮 on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var questionLabel: UILabel!
    var quizArray: [String:Any] = [:]
    //表示中の問題番号を格納
   var currentQuestionNum: Int = 0
    //問題
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        if let savedQuizArray = userDefaults.array(forKey: "questions") as? [[String: Any]] {
            userDefaults.object(forKey: "questions")
        }
       
    }

//問題を表示する関数
func showQuestion() {
    let question = quizArray[currentQuestionNum]
    
        if var que = question["question"] as? [String] {
        questionLabel.text = que
    }
}
//解答チェックの関数、正解なら次の問題を表示
func checkAnswer(yourAnswer: Bool) {
    let question = quizArray[currentQuestionNum]
    if let ans = question["answer"] as? Bool {
        if yourAnswer == ans {
            // 正解のときの処理
            currentQuestionNum += 1
            showAlert(message: "正解！！")
        } else {
            // 不正解のときの処理
            showAlert(message: "不正解..")
        }
        
        
        
    } else { // 答えがないとき
        print("答えが入ってません")
        return
    }
    if currentQuestionNum >= quizArray.count {
        currentQuestionNum = 0
    }
    
    showQuestion()
}

func showAlert(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    
    let close = UIAlertAction(
        title: "閉じる", style: .cancel)
    alert.addAction(close)
    present(alert, animated: true)
}


@IBAction func tappedNoButton(_ sender: Any) {
    checkAnswer(yourAnswer: false)
}

@IBAction func tappedYesbutton(_ sender: Any) {
    checkAnswer(yourAnswer: true)
}
}

