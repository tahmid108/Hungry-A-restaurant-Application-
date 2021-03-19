//
//  ProfileViewController.swift
//  Hungry
//
//  Created by kuet on 9/12/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit
import SQLite3

class ProfileViewController: UIViewController {
    var dat_name = ""
    var got_pass = ""

    @IBOutlet weak var email_id: UILabel!
    var db: OpaquePointer?
    @IBOutlet weak var password_id: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       email_id.text = dat_name
        password_id.text = got_pass
        

        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
