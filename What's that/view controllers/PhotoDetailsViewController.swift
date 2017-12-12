//
//  PhotoDetailsViewController.swift
//  What's that
//
//  Created by brucexhuang on 12/6/17.
//  Copyright © 2017 brucexhuang. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    //var wikipediaResults = WikipediaResults()
    var wikipediaAPIManager = WikipediaManager()

    @IBOutlet weak var textLabelExample: UILabel!
    @IBOutlet weak var textViewLoad: UITextView!
    
    var  mickey = "Donald"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabelExample.text = mickey
        wikipediaAPIManager.delegate = self
        wikipediaAPIManager.fetchWikepediaResults(label: mickey)

        // Do any additional setup after loading the view.
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

extension PhotoDetailsViewController: WikepediaResultDelegate{
    func wikipediaResultFound(wikipediaResults: WikipediaResults) {
        //self.results = wikipediaResult
        print("222222222222", wikipediaResults.extract)
        DispatchQueue.main.async {
            self.textViewLoad.text = wikipediaResults.extract
        }
    }
    
    func wikipediaResultNotFound() {
        print("result not found in there and here")
    }
    
//    func resultFound(wikipediaResult: WikipediaResults) {
//        print("tengshen")
//        print(wikipediaResult)
//        //self.results = wikipediaResult
//        DispatchQueue.main.async {
//        self.textViewLoad.text = wikipediaResult.extract
//        }
//    }
//
//    func resultNotFound() {
//        print("result not found in there and here")
//    }
    
    
    //    func resultNotFound(googleVisionResult: [GoogleVisionResults]) {
    //        self.results =  googleVisionResult
    //        print("@", googleVisionResult.description)
    //
    //        DispatchQueue.main.async {
    //            self.tableViewLoad.reloadData()
    //        }
    //    }
    
}
