//
//  ScreenTwo.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 18/12/22.
//

import SwiftUI

struct ScreenTwo: View {
    @EnvironmentObject var router: TabRouter
    var body: some View {
        Button {
            router.changeTo(screen: .one)
        } label: {
            Text("To One")
        }
    }
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo().environmentObject(TabRouter())
    }
}
