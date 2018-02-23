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
    var jsonURL = "https://tednewardsandbox.site44.com/questions.json"
    var inputURL = ""
    var topics : [Topic]? = nil
    var selectedTopic : Topic? = nil
    @IBOutlet weak var topicTable: UITableView!
    
    
    
    override func viewDidLoad() {
        //topics = topicData.getTopics()
        getData()
        super.viewDidLoad()
//        let refresherControl = UIRefreshControl()
//        refresherControl.accessibilityAttributedLabel = NSAttributedString(string: "Pull to refresh")
//        refresherControl.addTarget(self, action: #selector(self.reloadData), for: UIControlEvents.valueChanged)
//        topicTable.addSubview(refresherControl)
//        refresherControl.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Checks if the device is connected to an internet source
    public func hasConnection() -> Bool{
        if currentReachabilityStatus == .reachableViaWiFi || currentReachabilityStatus == .reachableViaWWAN {
            return true
        } else {
            return false
        }
    }
    
    //Provides an alert notifying the user the device has no connection
    public func noConnectionNotification() {
        let alert = UIAlertController(title: "Connection", message: "No connection is available to retrieve data.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Provides an alert notifying the user the download failed
    public func downloadFailedNotification() {
        let alert = UIAlertController(title: "Download Failed", message: "The application failed to retrieve usuable data.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Gets the JSON for the quiz from a url
    public func getData() {
        print("entered getData")
        if inputURL == "" {
            inputURL = "https://tednewardsandbox.site44.com/questions.json"
            
        }
        
        //First time revisting app. Uses Local Data
        if topicData.topics.count == 0 {
            guard let url = URL(string: inputURL) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    self.downloadFailedNotification()
                    return
                }

                do {
                    self.topics = try JSONDecoder().decode([Topic].self, from: data)
                    print("inGetData", self.topics![0].title)
                } catch let jsonError {
                    print("Error serializing json1", jsonError)
                }
                self.reloadData()
            }.resume()
        }
    }
    
    //Reloads the table view display
    @objc public func reloadData() {
        DispatchQueue.main.async() {
            self.topicTable.reloadData()
        }
    }


    //Creates a tableView with a specific amount of cells
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if topics != nil {
            return topics!.count
        } else {
            return 0
        }
    }
    
    //Creates a tableView of quiz topics including a title, description, and image.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("topics = ",  topics![0].title)
        let cellTopic = topics![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.cellImage.image = UIImage(named: (cellTopic.title + ".png"))
        cell.cellLabel.text = cellTopic.title
        cell.cellDescription.text = cellTopic.desc
        return cell
    }
    
    //Creates a popup menu if the settings button in the toolbar is tapped
    //Allows for the URL of the JSON file for the quiz to be manually modified
    @IBAction func settingsTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Please provide a .JSON URL to retrieve questions from.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter URL"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Check Now", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.inputURL = (textField?.text)!
            if self.hasConnection() != true {
                self.noConnectionNotification()
            } else {
                self.getData()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionView = segue.destination as! QuestionView
        let indexPath = topicTable.indexPathForSelectedRow!
        questionView.topic = self.topics?[indexPath.row]
    }
    
}
