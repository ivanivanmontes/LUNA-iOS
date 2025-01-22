//
//  circle.swift
//  LUNA
//
//  Created by Ivan Montes on 10/16/24.
//

import SwiftUI

struct circle: View {
    var body: some View {
        ZStack {
            Text(" ")
        }
        .clipShape(Circle())
        .background(Color.blue)
    }
}

#Preview {
    circle()
}
