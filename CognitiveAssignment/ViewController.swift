//
//  ViewController.swift
//  CognitiveAssignment
//
//  Created by Shane Jackson on 2017-03-28.
//  Copyright © 2017 Shane Jackson. All rights reserved.
//

import UIKit

//typealias AnalyzeImageRequestObject = (resource: Any, visualFeatures: [AnalyzeImage.AnalyzeImageVisualFeatures])


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var myAge: Int?
    var myGender: String?
    
    @IBOutlet weak var myImageView: UIImageView!
//    let computerVisionKey = "73c13ba583d94b34979e60f2c4043c6d"
//    //let faceKey = "a4b9225a259f441983a4d69cdca16245"
//    
//    // url to grab requests
//    final let url = "https://api.projectoxford.ai/vision/v1.0/analyze"
//    
    
    
    @IBAction func uploadButtonTapped(_ sender: Any) {
        // myImageUploadRequest()
    }
    
    @IBAction func selectButtonTapped(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerControllerSourceType.camera
        // Think we can simply use this for camera if we want to
        //         myPickerController.sourceType = UIImagePickerControllerSourceType.camera
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.image = image
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cognitiveServices = CognitiveService()
        cognitiveServices.test()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



