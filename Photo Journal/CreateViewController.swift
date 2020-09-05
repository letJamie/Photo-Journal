//
//  CreateViewController.swift
//  Photo Journal
//
//  Created by Jamie on 2020/09/05.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.size.height / 8
        
    }
    
    @IBAction func existingPhotoTapped(_ sender: Any) {
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
}
