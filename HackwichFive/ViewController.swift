//
//  ViewController.swift
//  HackwichFive
//
//  Created by CM Student on 2/26/18.
//  Copyright © 2018 UHWO. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//Define an array variable using an array literal with 5 items of type string
    
    @IBOutlet var tableView: UITableView!
    var restaurantArray = ["California Pizza Kitchen", "Pieology", "Chilis", "AppleBee", "Johnny Rocket"]
    
    //Hackwich Seven Part 6 Step 2
    //Restaurant Image Data
    var restaurantImageData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set VC as deglate
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //Hackwich Seven, part 6
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        restaurantImageData = dict!.object(forKey:"restaurantimages") as! [String]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        //set up cell to display items in studentArray
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")!
            
        let text = restaurantArray[indexPath.row]
            
        cell.textLabel?.text = text
            
        return cell
}
    //Hackwich Seven, part 7
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"
        {
            let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = restaurantImageData[imageIndex!]
        }
    }

}


