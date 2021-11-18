//
//  HomeViewController.swift
//  Apollo
//
//  Created by QUANG HUNG on 15/Nov/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tbvCourses: UITableView!
    
    private var courseViewModel : CourseViewModel!
    private let viewModel = CourseViewModel()
    var arrCourses:[Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvCourses.delegate = self
        tbvCourses.dataSource = self
        // Do any additional setup after loading the view.
        view.backgroundColor =  self.hexStringToUIColor(hex: Config.bgCode)
        tbvCourses.backgroundColor = self.hexStringToUIColor(hex: Config.bgCode)
        
        viewModel.repData.bind { res in
            self.arrCourses = res.data
//            print(res)
            DispatchQueue.main.async {
                self.tbvCourses.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrCourses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvCourses.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        cell.lblCourse.text = self.arrCourses[indexPath.section].courseCode
        cell.lblRoom.text = self.arrCourses[indexPath.section].room
        cell.backgroundColor = self.hexStringToUIColor(hex: Config.bgCode)
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        
        let x = arrCourses[indexPath.section].teacher!
            switch x {
                case .string(_):
                    cell.lblTeacher.text = "No teacher"
                case .teacherClass(let teacher):
                    cell.lblTeacher.text = teacher.name!
                }
        
        cell.lblStatus.text = self.arrCourses[indexPath.section].timesCheckin
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tbvCourses.frame.height/4
    }
    
    // Set header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    // Change color
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = self.hexStringToUIColor(hex: Config.bgCode)
        return headerView
    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "QRScanner", bundle: nil)
        let QrVC = sb.instantiateViewController(identifier: "QR") as QRScannerViewController
        navigationController?.pushViewController(QrVC, animated: true)
        
    }
  

}
