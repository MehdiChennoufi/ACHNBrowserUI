//
//  DodoCodeWatchListView.swift
//  ACNHBrowserUIWatch Extension
//
//  Created by Jan on 15.06.20.
//  Copyright © 2020 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI
import Backend

struct DodoCodeWatchListView: View {
    @EnvironmentObject private var server: DodoCodeService
    
    var body: some View {
        List {
            if service.isSynching && service.codes.isEmpty {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            } else if !service.codes.isEmpty {
                ForEach(service.codes) { code in
                    DodoCodeWatchRow(code: code)
                }
            } else {
                Text("No active Dodo code yet, open your island to visitors by adding your own")
            }
        }
    }
}
