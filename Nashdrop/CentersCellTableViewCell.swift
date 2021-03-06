//
//  CentersCellTableViewCell.swift
//  Nashdrop
//
//  Created by Hunter Walker on 6/4/16.
//  Copyright © 2016 Code For Nashville. All rights reserved.
//

import UIKit

class CentersCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!

    func configureRecyclyingCenter(center: RecycleCenter) {
        
        if let name = center.name {
            nameLbl.text = name
        }
        
        if let city = center.city {
            if let state = center.state {
                cityLbl.text = "\(city), \(state)"
            }
        }
        
        if let address = center.address {
            addressLbl.text = address
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
