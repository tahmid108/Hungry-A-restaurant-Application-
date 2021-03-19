//
//  ViewController.swift
//  Hungry
//
//  Created by cse on 11/24/19.
//  Copyright © 2019 Kuet. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("HeroesDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        else{
            print("DataBase Is Opened Succesfully !!!")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS MyTable (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, password TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        else{
            print("Table Is Created Succesfully !!!")
        }
        
        //sqlite3_close(db)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        //let isuserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn");
        //if(!isuserLoggedIn)
        //{
            self.performSegue(withIdentifier: "loginView", sender: self);
        //}
    }
    
    @IBAction func logoutbutton(_ sender: Any) {
        //UserDefaults.standard.set(false,forKey: "isUserLoggedIn");
        //UserDefaults.standard.synchronize();
         self.performSegue(withIdentifier: "loginView", sender: self);
     
    }

}

