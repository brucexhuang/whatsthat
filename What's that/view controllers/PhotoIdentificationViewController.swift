//
//  PhotoIdenficationViewController.swift
//  whatsthattest
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import UIKit

 class PhotoIdentificationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource{

    var results = [GoogleVisionResults]()
    let googleVisionAPIManager = GoogleVisionManager()
    
    //connect imageView
    @IBOutlet weak var imageViewLoad: UIImageView!
    
    //the function to choose a photo from library or camera
    func choosePhoto() {
        
        let image = UIImagePickerController()
        image.delegate = self

        let alertController = UIAlertController(title: "Choose Photo Source", message: "please", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Take a Photo", style: .default, handler: { (action) in
            image.sourceType = UIImagePickerControllerSourceType.camera
            self.present(image, animated: true, completion: nil)
            }))
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            image.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(image, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            
            self.present(alertController, animated: true, completion: nil)
            
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //the function to pick a image to imageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageViewLoad.image = image
            googleVisionAPIManager.fetchGoogleVisionAPIResult(image: image)
        }
        else{
            //error message here
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //connect tableView
    @IBOutlet weak var tableViewLoad: UITableView!
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        choosePhoto()
        
        googleVisionAPIManager.delegate = self as? GoogleVisionManagerDelegate
        tableViewLoad.dataSource = self
        tableViewLoad.delegate = self
    }
    
    
    //table view number of row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    //table view cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellLoad", for: indexPath) as! TableCellTableViewCell
        
        cell.labelTextViewLoad?.text = results[indexPath.row].description
        cell.labelTextViewLoad2?.text = results[indexPath.row].score
        return cell
    }
    
    //table view row did select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPhotoDetailSegue", sender: results[indexPath.row].description)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! PhotoDetailsViewController
        guest.mickey = sender as! String
    }
    
    
    //left sweep and delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PhotoIdentificationViewController: GoogleVisionManagerDelegate{
    func resultFound(googleVisionResult: [GoogleVisionResults]) {
        //print("tengshen")
        print(googleVisionResult)
        self.results = googleVisionResult
        DispatchQueue.main.async {
            self.tableViewLoad.reloadData()
        }
    }
    
    func resultNotFound() {
        print("result not found in there and here")
    }
    
    
//    func resultNotFound(googleVisionResult: [GoogleVisionResults]) {
//        self.results =  googleVisionResult
//        print("@", googleVisionResult.description)
//
//        DispatchQueue.main.async {
//            self.tableViewLoad.reloadData()
//        }
//    }

}
