//
//  MaterialsVC.swift
//  Nashdrop
//
//  Created by Hunter Walker on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

protocol MaterialsDelegate: class {
    
    func updateWithFilteredMaterial(material: String)
}

class MaterialsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var materialDelegate: MaterialsDelegate?
    
    var materials =  ["Plastic", "Cardboard", "Glass", "Brush", "Appliances", "Trash", "Metal", "Hazardous"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materials.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let m = materials[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = m
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let m = materials[indexPath.row]
        let materialsMap = [
            "Plastic" : "plastics_1_7",
            "Cardboard" : "cardboard_newspaper_mixed_paper",
            "Glass" : "glass_bottles_clear_green_brown",
            "Brush" : "residential_brush_leaves",
            "Appliances" : "residential_furniture_appliances",
            "Trash" : "residential_trash",
            "Metal" : "aluminum_metal_tin_cans",
            "Hazardous" : "household_hazardous_waste",
        ]
        
        let queryParam = materialsMap[m]
        materialDelegate?.updateWithFilteredMaterial(queryParam!)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}