//
//  NewsViewController.swift
//  E-Course
//
//  Created by Attapong on 10/29/2557 BE.
//  Copyright (c) 2557 Suparuch Sriploy. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,iCarouselDataSource, iCarouselDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var items: [Int] = []
    let myStaticArray = ["apple","pear","banana","raspberry"]
    var itemsCell = ["Item 1", "Item2", "Item3", "Item4"]
    var descriptionCell = ["Desc 1","Desc 2","Desc 3","Desc 4"]
    var imageTableCell = ["Welcome1.jpg","Welcome2.jpg","Welcome3.jpg","Welcome4.jpg",]
    @IBOutlet var carousel: iCarousel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        for i in 0...9
        {
            items.append(i)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.clipsToBounds = true
        carousel.type = .InvertedCylinder
        var nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")


        // Do any additional setup after loading the view.
    }
    func numberOfItemsInCarousel(carousel: iCarousel!) -> Int
    {
        return 9
    }
    
    func carousel(carousel: iCarousel!, viewForItemAtIndex index: Int, var reusingView view: UIView!) -> UIView!
    {
        var label: UILabel! = nil
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            view = UIImageView(frame:CGRectMake(0, 0, 600
                , 300))
            (view as UIImageView!).image = UIImage(named: "welcome3.jpg")
           
            
            label = UILabel(frame:view.bounds)
            label.backgroundColor = UIColor.clearColor()
            label.textAlignment = .Center
            label.font = label.font.fontWithSize(50)
            label.tag = 1
            view.addSubview(label)
        }
        else
        {
            //get a reference to the label in the recycled view
            label = view.viewWithTag(1) as UILabel!
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        
        return view
    }
    func carousel(carousel: iCarousel!, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .Spacing)
        {
            return value * 1.1
        }
        return value
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 235
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCell.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomTableViewCell
        cell.nameCell.text = itemsCell[indexPath.row]
        cell.descriptionCell.text = descriptionCell[indexPath.row]
        cell.imageCell.image = UIImage(named:imageTableCell[indexPath.row])
        return cell
        
    }
 
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler: {
                (alert: UIAlertAction!) in println("An alert of type \(alert.style.hashValue) was tapped!")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
