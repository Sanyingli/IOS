//
//  ViewController.swift
//  Storm Viewer
//
//  Created by 李原平 on 16/11/24.
//  Copyright © 2016年 李原平. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Strom Viewer"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try!fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasSuffix(".jpg")
            {
                //load picture
                pictures.append(item)
                
            }
        }
        
        print(pictures)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //try load "detail" view and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController
        {
            //success then set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            //push it onto navigation controllor
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

