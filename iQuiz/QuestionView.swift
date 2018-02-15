//
//  QuestionView.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/13/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit

class QuestionView: UIViewController {
    
    let topicData = TopicData.shared
    var topic : Topic? = nil
    var questionIndex = 0
    var score = 0
    var selectedOption :String?
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    @IBAction func option1Selected(_ sender: Any) {
        selectedOption = topic?.options[questionIndex][0]
        showOptionSelection(number: 0)
        submitBtn.isEnabled = true
    }
    @IBAction func option2Selected(_ sender: Any) {
        selectedOption = topic?.options[questionIndex][1]
        showOptionSelection(number: 1)
        submitBtn.isEnabled = true
    }
    @IBAction func option3Selected(_ sender: Any) {
        selectedOption = topic?.options[questionIndex][2]
        showOptionSelection(number: 2)
        submitBtn.isEnabled = true
    }
    @IBAction func option4Selected(_ sender: Any) {
        selectedOption = topic?.options[questionIndex][3]
        showOptionSelection(number: 3)
        submitBtn.isEnabled = true
    }
    
    func showOptionSelection ( number : Int?) {
        option1.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        option2.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        option3.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        option4.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        if number == 0 {
            option1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        } else if number == 1 {
            option2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        } else if number == 2 {
            option3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        } else {
            option4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.isEnabled = false
        question.text = topic?.questions[questionIndex]
        option1.setTitle(topic?.options[questionIndex][0], for: .normal)
        option2.setTitle(topic?.options[questionIndex][1], for: .normal)
        option3.setTitle(topic?.options[questionIndex][2], for: .normal)
        option4.setTitle(topic?.options[questionIndex][3], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let answerView = segue.destination as! AnswerView
        answerView.topic = self.topic
        answerView.questionIndex = self.questionIndex
        answerView.selectedOption = self.selectedOption!
        answerView.score = self.score
    }

}
