//
//  TopicData.swift
//  iQuiz
//
//  Created by Connor Hawthorne on 2/14/18.
//  Copyright © 2018 Connor Hawthorne. All rights reserved.
//

import UIKit
import Foundation

class Topic {
    init(name : String, description : String, questions : [String], options : [[String]], answers : [String]) {
        self.name = name
        self.description = description
        self.questions = questions
        self.options = options
        self.answers = answers
    }
    var name = ""
    var description = ""
    var questions : [String]
    var options : [[String]]
    var answers : [String]
}

class TopicData {
    // CRUD
    
    static let shared = TopicData()
    
    func addTopic(name: String, description: String) {
        // add to the array
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
    
    func removeTopic(id: Int) {
        // remove from the array
    }

    private let topics : [Topic] = [
        Topic(name: "Mathematics", description: "Mathematics is the study of such topics as quantity, structure, space, and change", questions: ["6 + 3 / 3 = ?", "4 - 3 * 2 = ?"], options: [["3", "5", "7", "9"], ["-1", "-2", "0", "2"]], answers: ["7", "-2"]),
        Topic(name: "Avengers", description: "Earth's Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle.", questions: ["When was the first Avengers movie released to theaters?", "Who was not in the first Avengers movie?"], options: [["2010", "2012", "2014", "2016"], ["Captain America", "Hawk Eye", "Spider-Man", "Nick Fury"]], answers: ["2012", "Spider-Man"]),
        Topic(name: "Science", description: "A branch of knowledge or study dealing with a body of facts or truths systematically arranged and showing the operation of general laws", questions: ["What is the acceleration of gravity on Earth?", "What is the process a plant uses for energy?"], options: [["9.1 Mi/Hr", "9.35 In/Ms", "9.8 M/S^2", "100 Mi/Hr^s"], ["Diffusion", "Osmosis", "Active Transport", "Photosynthesis"]], answers: ["9.8 M/S^2", "Photosynthesis"])
    ]
    
}
