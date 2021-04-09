//
//  DataBase.swift
//  HospitalAtHome
//
//  Created by Артём Мурашко on 07.04.2021.
//

import Foundation

struct MedicalCenter {
    var ID: Int
    var Address: String
    var List_of_Workers: [Doctor]
    var List_of_Patients: [Patient]
}
 
struct Doctor {
    var ID: Int
    var Name: String
    var Surname: String
    var Phone_Number: String
    var Password: String
    //var Medical_Center: MedicalCenter
    var List_of_Patients: [Patient]
}
 
struct Patient {
    var ID: Int
    var Name: String
    var Surname: String
    var Middle_Name: String
    var Phone_Number: String
    var Address: String
    var Diet: String
    var List_of_Diseases: [Disease]
    var List_of_Recipes: [Recipe]// назначения врача
}
 
struct Disease {
    var Name: String
    var Stage: String // стадия развития
    var Start_Date: String
    var End_Date: String
}
 
struct Recipe {
    var Medicaments: [Medicament]
    var Date: String
    var Description: String
}
 
struct Medicament {
    var Name: String
}
 
let des1 = Disease(Name: "Гонорея", Stage: "Критический", Start_Date: "29 Мая 2019", End_Date: "по настоящее время")
let des2 = Disease(Name: "Альцгеймер", Stage: "Стадия развития", Start_Date: "31 Января 2020", End_Date: "по настоящее время")
let des3 = Disease(Name: "Ветрянка", Stage: "Ремиссия", Start_Date: "30 Апреля 2000", End_Date: "15 Мая 2000")
let des4 = Disease(Name: "Сотрясение мозга", Stage: "Ремиссия", Start_Date: "14 Апреля 2012", End_Date: "30 Апреля 2012")
let des5 = Disease(Name: "Вывих колена", Stage: "Ремиссия", Start_Date: "25 Января 2017", End_Date: "20 Февраля 2017")
 
let med1 = Medicament(Name: "Азелик 5%")
let med2 = Medicament(Name: "Парацетамол")
let med3 = Medicament(Name: "Оциллококцинум")
 
let rec1 = Recipe(Medicaments: [med2, med3], Date: "15 Января 2020", Description: "Принимать 3 раза в день после еды. Две таблетки сразу.")
 
let doc1 = Doctor(ID: 1, Name: "Марат", Surname: "Шарапов", Phone_Number: "+7-999-789-99-99", Password: "alexa5987", List_of_Patients: [patients[0], patients[1]])
 
let md1 = MedicalCenter(ID: 1, Address: "г. Иннополис, Спортивная 301", List_of_Workers: [doc1], List_of_Patients: patients)

let patients: [Patient] = [Patient(ID: 1, Name: "Артём", Surname: "Мурашко", Middle_Name: "Максимович", Phone_Number: "+7-917-533-90-69", Address: "г. Иннополис, Университетская 1к1, 321", Diet: "Солёное запрещено. Можно есть только морковь.", List_of_Diseases: [des4, des3], List_of_Recipes: [rec1]),
                           Patient(ID: 2, Name: "Максим", Surname: "Юсупов", Middle_Name: "Александрович", Phone_Number: "+7-917-893-19-19", Address: "г. Нижний Новгород", Diet: "отсутствует", List_of_Diseases: [des1, des2], List_of_Recipes: [])]
