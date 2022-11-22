//
//  HomePresenter.swift
//  Week2Day1
//
//  Created by Default on 11/21/22.
//

import Foundation
class HomePresenter {
    weak var view: HomeViewProtocol?
    
    func fetchPeopleNames() {
        let peopleNames = ["Nick", "Judd", "Hugo", "Rolando", "David", "Mike", "Vanessa", "Alex", "Morgan", "Juan", "Manuel", "Romin",  ]
        view?.onPeopleFetched(peopleNames)
    }
}

protocol HomeViewProtocol: AnyObject {
    func onPeopleFetched (_ peopleNames: [String])
}
