import UIKit
import SQLite3

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userConfirmPassword: UITextField!
    
    var db: OpaquePointer?
     var dat_id = ""
    
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
        
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS MyTable (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, password TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        else{
            print("Table Is Created Succesfully !!!")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButton(_ sender: Any) {
        func displayAlert(userMessage:String)
        {
            // create the alert
            let alert = UIAlertController(title: "Please Check !!!", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil));
            
            // show the alert
            self.present(alert, animated: true, completion: nil);
        }
        
        //variable declaratin
        
        let name: String = userName.text!;
        let password: String = userPassword.text!;
        let confirmPassword: String = userConfirmPassword.text!;
        
        
        //Check for empty field
        if((name.isEmpty)   || (password.isEmpty)  || (confirmPassword.isEmpty)){
            //display aleart message
            displayAlert(userMessage : "All field are required");
        
            return;
        }
        //check password match or not
        if(password != confirmPassword)
        {
            displayAlert(userMessage : "Passwords do not match");
            
            return;
        }
        
        
        var stmt: OpaquePointer?
        
        let queryString = "INSERT INTO MyTable (id, name, password) VALUES (?,?,?);"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        else{
            print("Query Is Prepared Succesfully !!!")
        }
        
        if sqlite3_bind_text(stmt, 2, name, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            
            print("failure binding name: \(errmsg)")
            return
        }
        else{
            
            print("Name Is Saved In The DataBase Succesfully !!!")
        }
        
        if sqlite3_bind_text(stmt, 3, password, -1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        else{
            
            print("Password Is Saved In The DataBase Succesfully !!!")
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting hero: \(errmsg)")
            return
        }
        else{
            print("Registration Completed Succesfully !!!")
        }
        
        
        let Alert = UIAlertController(title: "Congratulations", message: "Registration successful", preferredStyle: UIAlertControllerStyle.alert);
        //dismiss alert
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){
            ACTION in self.dismiss(animated: true, completion:nil);
        }
        Alert.addAction(okAction);
        self.present(Alert,animated: true,completion: nil);
  }
}
