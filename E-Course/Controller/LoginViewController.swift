//
//  LoginViewController.swift
//  E-Course
//
//  Created by Attapong on 10/28/2557 BE.
//  Copyright (c) 2557 Suparuch Sriploy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UserDelegate {
var loginAlert:UIAlertController! = UIAlertController()
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
    }
/*    override func viewDidAppear(animated: Bool) {
        // Create AlertCOntroller setup title and messege
        loginAlert = UIAlertController(title: "Please Login", message:"Pleas Login First", preferredStyle: UIAlertControllerStyle.Alert)
        loginAlert.addTextFieldWithConfigurationHandler({
            textfield in
            textfield.placeholder = "your name"
        })
        loginAlert.addTextFieldWithConfigurationHandler({
            textfield in
            textfield.placeholder = "Your password"
            textfield.secureTextEntry = true
        })
        loginAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            alertAction in
            let textFields:NSArray = self.loginAlert.textFields as [NSArray]
            let usernameTextfield:UITextField = textFields.objectAtIndex(0) as UITextField
            let passwordTextfield:UITextField = textFields.objectAtIndex(1) as UITextField
            User.loginWithSystem(usernameTextfield.text, withPassword: passwordTextfield.text, withDelegate: self)

        }))
        loginAlert.addAction(UIAlertAction(title: "Submit", style: UIAlertActionStyle.Default, handler: {
            alertAction in
            let textFields:NSArray = self.loginAlert.textFields as [NSArray]
            let usernameTextfield:UITextField = textFields.objectAtIndex(0) as UITextField
            let passwordTextfield:UITextField = textFields.objectAtIndex(1) as UITextField
            User.loginWithSystem(usernameTextfield.text, withPassword: passwordTextfield.text, withDelegate: self)
        }))

        self.presentViewController(loginAlert, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func userDidLogin(loggedIn: Bool) {
        if loggedIn == true {
            println("TRUEEEEEEE")
            var loginsuccess: UIAlertView = UIAlertView(title: "Login Success", message: "Login Seccess Welcome", delegate: self, cancelButtonTitle: "OK")
            loginsuccess.show()
            self.presentViewController(NewsViewController(), animated: true, completion: nil)
        } else {
            var loginfailed: UIAlertView = UIAlertView()
            loginfailed.title = "Login Failed"
            loginfailed.message = "Please Login Agian"
            loginfailed.delegate = self
            loginfailed.addButtonWithTitle("OK")
            loginfailed.show()
            self.presentViewController(loginAlert, animated: true, completion: nil)
        }
    }
*/}