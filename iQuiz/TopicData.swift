//
//  TopicData.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/14/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit
import Foundation

class TopicData {
    var topics = [Topic]()
    
    // CRUD
    
    static let shared = TopicData()
    
    func addTopic(name: String, description: String) {
        // add to the array
    }
    func addTopic(title: String, desc: String, question: [Question]) {
        topics.append(Topic(title: title, desc: desc, questions: question))
    }

    func getTopics() -> [Topic] {
        return topics
    }

    func getTopic(id: Int) -> Topic {
        return topics[id]
    }

    func update(topic: Topic) {
        // send the update back to the server
    }

    func removeTopics() {
        topics = []
    }
    
    func removeTopic(id: Int) {
        // remove from the array
    }
    
}

class Topic: Decodable {
    init(title : String, desc : String, questions : [Question]) {
        self.title = title
        self.desc = desc
        self.questions = questions
    }
    var title = ""
    var desc = ""
    var questions = [Question]()
}

class Question: Decodable {
    init(text : String, answer : String, answers : [String]) {
        self.text = text
        self.answer = answer
        self.answers = answers
    }
    var text = ""
    var answer = ""
    var answers = [String]()
}

