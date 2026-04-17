//
//  GameOverView.swift
//  CWRUConnect
//
//  Created by Tyler Powers on 4/16/26.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            Text("Done!")
            Button("Exit") {
                dismiss()
            }
        }
    }
}

#Preview {
    GameOverView()
}
