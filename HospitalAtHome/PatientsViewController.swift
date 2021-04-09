//
//  PatientsViewController.swift
//  HospitalAtHome
//
//  Created by Артём Мурашко on 07.04.2021.
//

import UIKit


let patientsList = patients
var filteredPatientsList = [Patient]()

class PatientsViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewPatients: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the table
        tableViewPatients.register(CustomPatientsListTableViewCell.nib(), forCellReuseIdentifier: CustomPatientsListTableViewCell.identifier)
        tableViewPatients.delegate = self
        tableViewPatients.dataSource = self
        
        filteredPatientsList = patients
        // Do any additional setup after loading the view.
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
//        filteredPatientsList = searchText.isEmpty ? patientsList : patientsList.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
//            return dataString.range(of: searchText, options: .caseInsensitive) != nil
//        })

//        tableViewPatients.reloadData()
//    }
}

extension PatientsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomPatientsListTableViewCell.identifier, for: indexPath) as? CustomPatientsListTableViewCell else { return UITableViewCell() }

        let name = patients[indexPath.row].Name + " " + patients[indexPath.row].Surname
        cell.configure(with: .init(name: name))

         return cell
     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowPatient", sender: self)
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PatientInfoViewController {
            guard let indexPath = tableViewPatients.indexPathForSelectedRow else { return }
            let name = patients[indexPath.row].Name + " " + patients[indexPath.row].Surname
            destination.title = name
            destination.diseases = patients[indexPath.row].List_of_Diseases
            destination.pat = patients[indexPath.row]
        }
    }

 }
