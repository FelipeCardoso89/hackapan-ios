//
//  ProfileFormViewController.swift
//  hackapan
//
//  Created by Felipe Antonio Cardoso on 18/08/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit
import AssetsLibrary

class ProfileFormViewController: UIViewController {

    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var cencelButton: UIBarButtonItem!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func cancel(_ sender: Any) {
        (self.navigationController as? ProfileNavigationViewController)?.profileDelegate?.dismissViewController(viewController: self)
    }
}

extension ProfileFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
}
