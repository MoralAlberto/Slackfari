//
//  TeamCollectionViewItem.swift
//  SlackfariExtension
//
//  Created by Alberto Moral on 28/09/2017.
//  Copyright © 2017 Alberto Moral. All rights reserved.
//

import Foundation
import Cocoa
import Cartography

protocol TeamCollectionViewItemDelegate: class {
    func didTapOnRemoveTeam(withName name: String)
}

class TeamCollectionViewItem: NSCollectionViewItem {
    weak var delegate: TeamCollectionViewItemDelegate?
    
    let teamCellView = TeamCellView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamCellView.delegate = self
        view.wantsLayer = true
        view.layer?.backgroundColor = Stylesheet.color(.white).cgColor
    }
    
    override func loadView() {
        view = teamCellView
    }
    
    func configure(name: String, avatarURL: String) {
        teamCellView.name = name
        teamCellView.setTeamAvatar(url: avatarURL)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teamCellView.name = nil
        teamCellView.imageView.image = nil
    }
}

extension TeamCollectionViewItem: TeamCellViewDelegate {
    func didTapOnRemoveTeam(withName name: String) {
        delegate?.didTapOnRemoveTeam(withName: name)
    }
}