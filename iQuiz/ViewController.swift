//
//  ViewController.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/11/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let topicData = TopicData.shared
    var topics : [Topic]? = nil
    var selectedTopic : Topic? = nil
    @IBOutlet weak var topicTable: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTopic = topics![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.cellImage.image = UIImage(named: (cellTopic.name + ".png"))
        cell.cellLabel.text = cellTopic.name
        cell.cellDescription.text = cellTopic.description
        
        return cell
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topics = topicData.getTopics()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionView = segue.destination as! QuestionView
        let indexPath = topicTable.indexPathForSelectedRow!
        questionView.topic = self.topics?[indexPath.row]
    }
    
}
