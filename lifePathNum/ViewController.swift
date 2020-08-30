//
//  ViewController.swift
//  lifePathNum
//
//  Created by Bernice TSAI on 2020/8/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBSegueAction func showLifepathNum(_ coder: NSCoder) -> numViewController? {
        let controller = numViewController(coder: coder)       //透過coder建立從storyboard設計的controller，包含了建立controller畫面需要的內容
        controller?.birthday = birthDatePicker.date
        return controller
    }
}

