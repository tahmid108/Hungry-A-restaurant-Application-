//
//  RestaurantListViewController.swift
//  Hungry
//
//  Created by kuet on 9/12/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {

    var lattitude = ""
    var longititude = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.destination is MapViewController
      {
          let vc = segue.destination as? MapViewController
          vc?.lan = lattitude
          vc?.lon = longititude
      }
      
  }
    
    @IBAction func dhaba(_ sender: UIButton) {
        lattitude = "22.819966"
        longititude =  "89.549426"
    }
    @IBAction func jujuba(_ sender: UIButton) {
        lattitude = "22.897320"
        longititude =  "89.508078"
    }
    @IBAction func rovers(_ sender: UIButton) {
        lattitude = "22.826004"
        longititude =  "89.551098"
    }
  
    @IBAction func pizza(_ sender: UIButton) {
        lattitude = "22.826351"
        longititude =  "89.550783"
    }
    @IBAction func swarma(_ sender: UIButton) {
        lattitude = "22.811576"
        longititude =  "89.559306"
    }
    @IBAction func top(_ sender: UIButton) {
        lattitude = "22.821634"
        longititude =  "89.551492"
    }
    @IBAction func coffee(_ sender: UIButton) {
        lattitude = "22.826024"
        longititude =  "89.551077"
    }
    
      
}
