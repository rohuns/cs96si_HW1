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
        
        let title = firstCategory["Title"] as! String
        titleTopic.text = (title)
        
        let description = firstCategory["Description"] as! String
        
        let content = firstCategory["Content"] as! String
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
