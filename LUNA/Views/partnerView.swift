//
//  partnerView.swift
//  LUNA
//
//  Created by Ivan Montes on 10/14/24.
//

import SwiftUI

struct partnerView: View {
//    @ObservedObject var viewModel = UserViewModel()
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack {
        if let userData = userViewModel.userData {
            Text("Hello, \(userData.username ?? "")")
        } else {
            Text("")
        }
    }
    }
        
}

#Preview {
    partnerView()
}
