//
//  CustomPatientsListTableViewCell.swift
//  HospitalAtHome
//
//  Created by Артём Мурашко on 07.04.2021.
//

import UIKit

protocol PatientCellConfiguration : class {
    var name : String? {get set}
}

class CustomPatientsListTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    
    let colors = [UIColor(red: 165.0/255.0, green: 87.0/255.0, blue: 83.0/255.0, alpha: 1.0),
                  UIColor(red: 72.0/255.0, green: 165.0/255.0, blue: 147.0/255.0, alpha: 1.0),
                  UIColor(red: 71.0/255.0, green: 167.0/255.0, blue: 71.0/255.0, alpha: 1.0),
                  UIColor(red: 79.0/255.0, green: 98.0/255.0, blue: 172.0/255.0, alpha: 1.0),
                  UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 36.0/255.0, alpha: 1.0)]
    
    static let identifier = "CustomPatientsListTableViewCell"
        static func nib() -> UINib {
            return UINib(nibName: "CustomPatientsListTableViewCell", bundle: nil)
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImage.layer.cornerRadius = photoImage.frame.size.width / 2
        photoImage.clipsToBounds = true
        photoImage.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class Model : PatientCellConfiguration {
        var name: String?
        
        init(name: String?) {
            self.name = name
        }
    }
    
    func configure(with pattern: Model) {
        if let name = pattern.name  {
            self.nameLabel.text = name
        } else {
            self.nameLabel.text = "Неизвестный"
        }
        
        self.photoImage.backgroundColor = colors.randomElement()
    }
}
