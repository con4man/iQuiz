//
//  FinishView.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/13/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit

class FinishView: UIViewController {

    var topic : Topic? = nil
    var score = 0;
    
    @IBOutlet weak var feedback: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "You got \(score) out of \(String(describing: topic!.questions.count)) questions correct."
        if (Double(score) / Double((topic?.questions.count)!)) == 1 {
            feedback.text = "Way to go!"
        } else if (Double(score) / Double((topic?.questions.count)!)) > 0.5 {
            feedback.text = "Not bad"
        } else {
            feedback.text = "Be more Boundless next time!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
