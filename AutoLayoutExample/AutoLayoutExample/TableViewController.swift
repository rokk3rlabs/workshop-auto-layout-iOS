//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by Diego Montoya Sefair on 5/28/16.
//  Copyright © 2016 Rokk3r Labs. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 45
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SelfSizingCell", forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = randomAlphaNumericString(indexPath.row*40)
        
        cell.backgroundColor = [UIColor.lightGrayColor(), UIColor.cyanColor()][indexPath.row % 2 == 0 ? 0 : 1]
        
        return cell
    }
    
    func randomAlphaNumericString(length: Int) -> String {
        
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
    }
}

