//
//  TransactionTableViewCell.swift
//  IOS-FinalProject-LSBank
//
//  Created by english on 2021-11-25.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblAccountHolder: UILabel!
    @IBOutlet weak var imgTransactionType: UIImageView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    static let identifier : String = "TransactionTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setCellContent(accountHolder : String, dateTime : String, amount : Double, credit : Bool, message : String) {
        
        if (credit == false) {
            lblAccountHolder.text = "FROM \(accountHolder.uppercased())"
            imgTransactionType.image = UIImage(systemName: "arrow.down")
            imgTransactionType.tintColor = .green
        } else {
            lblAccountHolder.text = "TO \(accountHolder.uppercased())"
            imgTransactionType.image = UIImage(systemName: "arrow.up")
            imgTransactionType.tintColor = .red
        }
        
        lblDateTime.text = dateTime
        lblAmount.text = "$" + amount.formatAsCurrency() // 1,000,000.00
        lblMessage.text = message
        
        if (message.count == 0) {
            lblMessage.isHidden = true
        } else {
            lblMessage.isHidden = false
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
