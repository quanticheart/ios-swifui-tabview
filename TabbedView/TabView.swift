//
//  ContentView.swift
//  TabbedView
//
//  Created by Jonn Alves on 13/03/23.
//
//
//  TabsView.swift
//
//  Created by Zachery Soles on 12/22/22.
//

import SwiftUI

struct Tab: View {
    @Binding var selectedTabIndex: Int
    @State var tabText: String
    @State var index: Int
    @State var activeColor: Color
    @State var inactiveColor: Color
    @State var activeTabColor: Color
    @State var inactiveTabColor: Color
    var body : some View {
        Button {
            self.selectedTabIndex = index
            print("Selected tab index: \(selectedTabIndex)")
        } label: {
            Text(tabText)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .accentColor(selectedTabIndex == index ? activeColor : inactiveColor)
        .background(
            selectedTabIndex == index ?
            activeTabColor
                .frame(height: 4) // underline's height
                .offset(y: 24) :
                inactiveTabColor
                .frame(height: 4) // underline's height
                .offset(y: 24)
        )
    }
}

public struct TabView: View {
    @Binding var tabs: [String]
    @Binding var selectedTabIndex: Int
    @State var activeColor: Color? = Color.accentColor
    @State var inactiveColor: Color? = Color.gray
    @State var activeTabColor: Color? = Color.accentColor
    @State var inactiveTabColor: Color? = Color.white

    public init(tabs: Binding<[String]>, selectedTabIndex: Binding<Int>, activeColor: Color? = Color.accentColor, inactiveColor: Color? = Color.accentColor, activeTabColor: Color? = Color.accentColor, inactiveTabColor: Color? = Color.accentColor) {
        self._tabs = tabs
        self._selectedTabIndex = selectedTabIndex
        self.activeColor = activeColor
        self.inactiveColor = inactiveColor
        self.activeTabColor = activeTabColor
        self.inactiveTabColor = inactiveTabColor
    }
    
    public var body: some View {
        HStack{
            ForEach(tabs, id: \.self) { tabName in
                let index = tabs.firstIndex(of: tabName)
                Tab (
                    selectedTabIndex: $selectedTabIndex,
                    tabText: tabName,
                    index: index ?? 0,
                    activeColor: activeColor!,
                    inactiveColor: inactiveColor!,
                    activeTabColor: activeTabColor!,
                    inactiveTabColor: inactiveTabColor!
                )
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    @State static var indexExample = 0
    @State static var tabsExample = ["tab 1", "tab 2"]
    
    static var previews: some View {
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
            Button { tabsExample.append("tab \(tabsExample.count)") } label: {
                Text("+")
            }
            Spacer()
        }
    }
}

