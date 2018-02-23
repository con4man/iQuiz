//
//  AnswerView.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/13/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit

class AnswerView: UIViewController {
    
    var topic : Topic? = nil
    var questionIndex = 0
    var selectedOption = ""
    var score = 0
    
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if nextBtn.currentTitle == "Finish" {
            performSegue(withIdentifier: "finish", sender: self)
        } else {
            performSegue(withIdentifier: "nextQuestion", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.text = topic?.questions[questionIndex].text
        let answerIndex = Int((topic?.questions[questionIndex].answer)!)! - 1
        let answerString = topic?.questions[questionIndex].answers[answerIndex]
        answer.text = "The correct answer is : " + answerString!
        if Int(selectedOption) == answerIndex + 1 {
            result.text = "You answered correctly! 😁👍"
            score += 1
        } else {
            result.text = "You answerd incorrectly. 😥👎"
        }
        if questionIndex + 1 == (topic?.questions.count)! {
            nextBtn.setTitle("Finish", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finish" {
            let finishView = segue.destination as! FinishView
            finishView.topic = self.topic
            finishView.score = self.score
        } else {
            let questionView = segue.destination as! QuestionView
            questionView.topic = self.topic
            questionView.questionIndex = self.questionIndex + 1
            questionView.score = self.score
        }
    }

}
