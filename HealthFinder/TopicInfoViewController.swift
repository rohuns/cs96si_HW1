//
//  TopicInfoViewController.swift
//  HealthFinder
//
//  Created by Rohun Saxena on 10/9/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit

class TopicInfoViewController: UIViewController {
   
    @IBOutlet var contentTopicLabel: UITextView!
    @IBOutlet var titleTopic: UILabel!
    
    var currentTopic:NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Broke into multiple steps, because one line was causing errors due to the type of variable
        let sections = currentTopic["Sections"] as! NSArray
        let firstCategory = sections[0] as! NSDictionary
        
        //title string
        let title = firstCategory["Title"] as! String
        titleTopic.text = (title)
        
        // topic description
        let description = firstCategory["Description"] as! String
    
        //topic content
        let content = firstCategory["Content"] as! String
        
        //appending description and content
        let combined = description + "\r\n" + "\r\n" + content
        contentTopicLabel.text = combined
        
    }
        
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
