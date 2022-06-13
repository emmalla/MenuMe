//
//  ViewController.swift
//  menume-st
//
//  Created by Emily Mallaber on 6/11/22.
//

import UIKit
import FSCalendar
import Foundation

let dateFormatter = DateFormatter()

class ViewController: UIViewController {
    
    var currDate:Date? = nil

    var menuList:[String:[String]] = [:]

    var dayMenuList:[Date:String] = [:]
    
    var dayEventsList:[Date:[String]] = [:]
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var eventsLabel: UILabel!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        dayMenuList[currDate!] = "tofu masala"
        menuLabel.text = dayMenuList[currDate!] 
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        editButton.titleLabel?.text = "Add"
        
        // Do any additional setup after loading the view.
        
        calendar.scrollDirection = .vertical
        calendar.scope = .month
        
    }

}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("date selected", date)
        currDate = date
        dateFormatter.string(from: currDate!)
        print(dayMenuList)
        if (dayMenuList[currDate!] != nil){
            menuLabel.text = dayMenuList[currDate!]
        }else {
            menuLabel.text = "no menu selected, add below"
        }
    
    }
}
