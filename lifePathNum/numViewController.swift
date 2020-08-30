//
//  numViewController.swift
//  lifePathNum
//
//  Created by Bernice TSAI on 2020/8/30.
//

import UIKit

class numViewController: UIViewController {
    
    @IBOutlet weak var numImage: UIImageView!
    
    @IBOutlet weak var descriptionType: UILabel!
    var birthday:Date!
    
    func calMatureNum(n : Int) -> Int {
        var sum: Int = 0
        var m:Int = n
        while m > 0 {
            sum += m % 10 // Add least significant digit
            m /= 10   // and remove it from the number.
        }
        return sum
    }

    func calLifeNum(n:Int) -> Int {
        var sum: Int = 0
        var sum2: Int = 0
        var m:Int = n
        while m > 10{
        while m > 0 {
                sum += m % 10 // Add least significant digit
                m /= 10   // and remove it from the number.
        }
        if sum > 10{
                while sum > 0{
                sum2 += sum % 10
                sum /= 10
                }
        }else {
            sum2 = sum
        }
        }
        return sum2
    }
    func calLifePathNum() -> Int {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let birthdayString = dateFormatter.string(from: birthday)
        
        let number = Int(birthdayString)!
        if number != nil{
        calLifeNum(n:calMatureNum(n : number))
        }
        return calLifeNum(n:calMatureNum(n : number))
    }
    
    func convertInt()-> Int{
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: birthday)
        let year = dateComponents.year!
        let month = dateComponents.month!
        let day = dateComponents.day!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let birthdayString = dateFormatter.string(from: birthday)
        return Int(birthdayString)!
    }
    
    func calMatureAge() -> Int {
        if convertInt() != nil{
            calMatureNum(n : convertInt())
        }
        return calMatureNum(n : convertInt())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let pathNum = calLifePathNum()
        let matureAge = calMatureAge()
        numImage.image = UIImage(named: "\(pathNum)")
        descriptionType.text = "我是第\(pathNum)型的人，成熟年齡為\(matureAge)歲"
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
