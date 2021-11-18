//
//  InfoViewController.swift
//  Apollo
//
//  Created by QUANG HUNG on 17/Nov/2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblStudentCode: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    
    private var viewModel = InfoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = hexStringToUIColor(hex: Config.bgCode)
        
        viewModel.studentName.bind { name in
            DispatchQueue.main.async {
                self.lblName.text = name
            }
        }
        
        viewModel.studentNumber.bind { num in
            DispatchQueue.main.async {
                self.lblStudentCode.text = num
            }
        }
        
        viewModel.studentEmail.bind { email in
            DispatchQueue.main.async {
                self.lblEmail.text = email
            }
        }
        
    }
        
    
    
}
