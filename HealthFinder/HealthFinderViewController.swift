//
//  HealthFinderViewController.swift
//  HealthFinder
//
//  Created by Rohun Saxena on 10/8/16.
//  Copyright © 2016 Rohun Saxena. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD



class HealthFinderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    
    var topics: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let url = URL(string:"https://healthfinder.gov/developer/MyHFSearch.json?api_key=demo_api_key&who=child&age=16&gender=male")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (dataOrNil, response, err) in
            if let data = dataOrNil{
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary{
                    if let results = responseDictionary["Result"]as?NSDictionary{
                        self.topics = results["Topics"] as? [NSDictionary]
                        self.tableView.reloadData()
                        MBProgressHUD.hide(for: self.view, animated: true)
                    }
                }
            }
        }
        task.resume()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let topics = self.topics{
            return topics.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HealthFinderTableViewCell
        cell.titleLabel.text = topics![indexPath.row]["Title"] as? String
        let imageURL = URL(string: topics![indexPath.row]["ImageUrl"] as! String)
        cell.imageView?.setImageWith(imageURL!)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentTopic = topics![indexPath!.row] as! NSDictionary
        let topicInfoViewController = segue.destination as! TopicInfoViewController
        topicInfoViewController.currentTopic = currentTopic

    }
}
