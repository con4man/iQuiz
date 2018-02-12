//
//  ViewController.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/11/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let topicList = ["Mathematics", "Avengers", "Science"]
    
    let descriptions = ["Mathematics is the study of such topics as quantity, structure, space, and change. There are many views among mathematicians and philosophers as to the exact scope and definition of mathematics.", "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth's No. 1 team.", "A branch of knowledge or study dealing with a body of facts or truths systematically arranged and showing the operation of general laws"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.cellImage.image = UIImage(named: (topicList[indexPath.row] + ".png"))
        cell.cellLabel.text = topicList[indexPath.row]
        cell.cellDescription.text = descriptions[indexPath.row]
        
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

