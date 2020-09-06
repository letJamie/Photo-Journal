//
//  FullImageViewController.swift
//  Photo Journal
//
//  Created by Jamie on 2020/09/06.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {

    
    var photoUpdate: PhotoUpdate?
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = photoUpdate?.title
        
        if let imageData = photoUpdate?.image {
            
            fullImageView.image = UIImage(data: imageData)
        }
    }
    

}
