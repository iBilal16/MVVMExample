//
//  EmployeeCell.swift
//  MVVMExample
//
//  Created by Bilal Ahmad on 11/03/2022.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var salaryLbl: UILabel!
    
    class var identifier: String { return String (describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        
     
    }
    
    func initView () {
    
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        idLbl.text  = nil
        nameLbl.text =  nil
        salaryLbl.text = nil
        ageLbl.text =  nil
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
