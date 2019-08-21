//
//  AboutViewController.swift
//  BallsEye
//
//  Created by Sanasar Janjughazyan on 8/21/19.
//  Copyright © 2019 Sanasar Janjughazyan. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let filePath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: filePath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
