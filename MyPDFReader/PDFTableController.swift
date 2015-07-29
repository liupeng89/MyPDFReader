//
//  PDFTableController.swift
//  MyPDFReader
//
//  Created by PeterLiu on 7/28/15.
//  Copyright (c) 2015 PeterLiu. All rights reserved.
//

import UIKit

class PDFTableController: UITableViewController {
    
    var pdfFiles: [String] = []
    
    let fm = NSFileManager.defaultManager()
    
    let mainPath = NSBundle.mainBundle().resourcePath!
    
    @IBOutlet var tvPDFs: UITableView!
    
    // View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Get the list of PDFs
        pdfFiles = listPDFFiles()
        
    }
    
    // Segure with paramers
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "PDFFileContents" {
        
            let indexPath = tvPDFs.indexPathForSelectedRow()!.row
            
            let name = pdfFiles[indexPath]
            
            ((segue.destinationViewController) as! DetailsViewController).allPDFFiles = pdfFiles
            ((segue.destinationViewController) as! DetailsViewController).indexOfPDF = indexPath
        }
    }
    
    // Import the pdf file from system
    @IBAction func importPDFButton(sender: UIBarButtonItem) {
        println("Add button is clicked!")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return pdfFiles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PDFCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = pdfFiles[indexPath.row]

        return cell
    }
    
    // Get list of PDFs
    func listPDFFiles() -> [String] {
        
        var items = fm.contentsOfDirectoryAtPath(mainPath, error: nil) as! [String]
        var result: [String] = []
        
        for item in items {
            if item.hasSuffix("pdf") {
                
                result.append((item as NSString).substringWithRange(NSMakeRange(0, count(item) - 4)))
            }
        }
        
        return result
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}