//
//  CryptoTableViewCell.swift
//  KriptoParaUygulamasi
//
//  Created by Şule Kaptan on 21.10.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    let currencyLabel : UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.backgroundColor = UIColor(named: "currency")
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let priceLabel : UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.backgroundColor = UIColor(named: "price")
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 24, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    private func addViews(){
        backgroundColor = .clear
        contentView.addSubview(currencyLabel)
        contentView.addSubview(priceLabel)
        
        priceLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -4).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        
        currencyLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 2).isActive = true
        currencyLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
        currencyLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor).isActive = true
                
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
