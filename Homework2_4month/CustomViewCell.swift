//
//  CustomViewCell.swift
//  SnapKitLesson2
//
//  Created by Бектур Каримов on 29/3/23.
//

import UIKit
import SnapKit
import Kingfisher

import Foundation





class CustomViewCell: UITableViewCell {
    
    

    static let idCell  = "CustomCell"
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descr = UILabel()
        descr.font = .systemFont(ofSize: 11)
        descr.numberOfLines = 5
        descr.textAlignment = .justified
        return descr
    }()
    
    private lazy var imageofNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    override func layoutSubviews() {
        setupConstraints()
    }
    private func setupConstraints(){
        self.addSubview(imageofNews)
        imageofNews.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(140)
        }
        imageofNews.layer.cornerRadius = imageofNews.frame.height / 2.5
        
            self.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(10)
                make.right.equalTo(imageofNews.snp.left).offset(-20)
            }
            self.addSubview(descriptionLabel)
            descriptionLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(10)
                make.right.equalTo(imageofNews.snp.left).offset(-20)
            }
            self.addSubview(dividerView)
            dividerView.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-2)
                make.horizontalEdges.equalToSuperview().inset(5)
                make.height.equalTo(0.3)
            }
        }
    
        func configure(with: Article) {
              self.titleLabel.text = with.title
              self.descriptionLabel.text = with.description
              handleImage(url: with.urlToImage)
              self.imageofNews.kf.setImage(with: URL(string: with.urlToImage))
          }
          func handleImage(url: String){
              let url = URL(string: url)
              self.imageofNews.kf.setImage(with: url)
          }
}
