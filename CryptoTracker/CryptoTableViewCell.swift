//
//  CryptoTableViewCell.swift
//  CryptoTracker
//
//  Created by harsh yadav on 19/05/21.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
