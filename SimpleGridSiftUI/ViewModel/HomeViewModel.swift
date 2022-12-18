//
//  HomeViewModel.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 18/12/22.
//

import SwiftUI
import Foundation


final class TabRouter: ObservableObject {

    @Published var screen: Screen = .one
    
    init() {}
    
    func changeTo(screen: Screen) {
        self.screen = screen
    }
}
