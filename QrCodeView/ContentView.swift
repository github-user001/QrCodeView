//
//  ContentView.swift
//  QrCodeView
//
//  Created by Michael Lustig on 10/26/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var count = 1
    
    func inc() {
        count += 1
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        Text("\(viewModel.count)")
            .padding()
        Button("Inc") {
            viewModel.inc()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
