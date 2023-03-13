//
//  ContentView.swift
//  TabbedView
//
//  Created by Jonn Alves on 13/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var indexExample = 0
    @State var tabsExample = ["Screen 1", "Screen 2"]
    var body: some View {
        VStack {
            TabView(
                tabs: $tabsExample,
                selectedTabIndex: $indexExample
            )
            Spacer()
            ZStack {
                if indexExample == 0 {
                    Text("View 1")
                } else {
                    Text("View 2")
                }
            }
            Button {
                if tabsExample.count < 5 {
                    tabsExample.append("Screen \(tabsExample.count)")
                }
            } label: {
                Text("+")
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
