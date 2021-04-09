//
//  PatientInfoViewController.swift
//  HospitalAtHome
//
//  Created by Артём Мурашко on 07.04.2021.
//

import UIKit
import Charts

class PatientInfoViewController: UIViewController {
    var diseases = [Disease]()
    var pat: Patient = Patient(ID: 0, Name: "", Surname: "", Middle_Name: "", Phone_Number: "", Address: "", Diet: "", List_of_Diseases: [], List_of_Recipes: [])
    
    @IBAction func plusTapped(_ sender: Any) {
        self.present(alertAdd, animated: true)
    }
    @IBOutlet weak var pieChart: PieChartView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var thirdNameLabel: UILabel!
    @IBOutlet weak var mobile: UILabel!
    
    @IBOutlet weak var dietTextView: UITextView!
    
    
    let alertAdd = UIAlertController(title: "Болезнь", message: "Добавить болезнь", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pat.Name
        surnameLabel.text = pat.Surname
        thirdNameLabel.text = pat.Middle_Name
        mobile.text = pat.Phone_Number
        dietTextView.text = pat.Diet
        dietTextView.layer.cornerRadius = 10
        
        alertAdd.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: nil))
               alertAdd.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [self] action in
                addDisease()
               }))
        alertAdd.addTextField()
       alertAdd.textFields![0].placeholder = "Введите название болезни"
        
        updateChartData()
    }
    
    private func addDisease() {
        let name = alertAdd.textFields![0].text
        let dis = Disease(Name: name ?? " ", Stage: "", Start_Date: "", End_Date: "")
        
        diseases.append(dis)
        updateChartData()
    }
    
    func updateChartData() {
        var dataEntries: [ChartDataEntry] = []
        
        var dict: [String: Int] = [:]
        for d in diseases {
            dict[d.Name] = 0
        }
        
        for d in diseases {
            var num = dict[d.Name]
            dict[d.Name] = num! + 1
        }
        
//        for d in dict {
//            print("\(d.key) -> \(d.value)")
//        }
        
        for d in dict {
            let dataEntry = PieChartDataEntry(value: Double(d.value), label: d.key, data: "" as AnyObject)
            dataEntries.append(dataEntry)
        }
    
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: diseases.count)
    
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
    
        // 4. Assign it to the chart’s data
        pieChart.data = pieChartData
        pieChart.entryLabelColor = .clear
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
      }
      return colors
    }

}
