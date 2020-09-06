//
//  PhotoItemTableViewController.swift
//  Photo Journal
//
//  Created by Jamie on 2020/09/05.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class PhotoItemTableViewController: UITableViewController {
    
    var photoUpdate: [PhotoUpdate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataItem = try? context.fetch(PhotoUpdate.fetchRequest()) as [PhotoUpdate] {
                photoUpdate = coreDataItem
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photoUpdate.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath)
        
        let update = photoUpdate[indexPath.row]
        
        if let imageData = update.image {
            
            cell.imageView?.image = UIImage(data: imageData)
            
        }
        
        cell.textLabel?.text = update.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(photoUpdate[indexPath.row])
            }
            
        }
        
        viewWillAppear(true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToFullImage", sender: photoUpdate[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let fullVC = segue.destination as? FullImageViewController {
            
            if let photoUpdate = sender as? PhotoUpdate {
                
                fullVC.photoUpdate = photoUpdate
                
            }
            
        }
    }
}


