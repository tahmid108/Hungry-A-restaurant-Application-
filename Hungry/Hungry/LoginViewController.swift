import UIKit
import SQLite3

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    var db: OpaquePointer?
    
   // var UserList = [ModelClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("HeroesDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        else{
            print("DataBase Is Opened Succesfully !!!")
        }
        
        
        
        
        
        //this is our select query
       
        
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?)
   {
       if segue.destination is HomeViewController
       {
           let vc = segue.destination as? HomeViewController
           vc?.dat_id = userName.text!
           vc?.dat_pass = userPassword.text!
       }
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        func displayAlert(userMessage:String){
            
            let myAlert = UIAlertController(title: "Please Check !!!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
            
            // add the actions (buttons)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil);
            myAlert.addAction(okAction);
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil);
            myAlert.addAction(cancelAction);
            // show the alert
            self.present(myAlert, animated: true, completion: nil);
            
            
        }
        
        let name = userName.text!;
        let password = userPassword.text!;
        
        if(name.isEmpty   || password.isEmpty){
            //display aleart message
            displayAlert(userMessage : "All field are required");
            return;
        }
        

        
        
        
        
        let queryString = "SELECT * FROM MyTable"
        
        
        
        //statement pointer
        var stmt:OpaquePointer?
        
        
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            
            let newname = String(cString: sqlite3_column_text(stmt, 1))
            let newpass = String(cString: sqlite3_column_text(stmt, 2))
            
            print(newname)
            print(newpass)
            
            if(newname == name && newpass == password)
            {
                print("Login successfull ")
               
                
                performSegue(withIdentifier: "homepage", sender: self)
                //break
                
            }
            
            
        }
        
    
   

    }
}
