//
//  HomeView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 23/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            backgroundView
            mainContentView
        }
    }
    
    private var backgroundView: some View {
        BackgroundView(activeItem: $viewModel.selectedItem)
            .edgesIgnoringSafeArea(.all)
    }
    
    private var mainContentView: some View {
        VStack(spacing: 0.0) {
            navigationBar
            Spacer()
            VStack(spacing: 40.0) {
                selectedItemDetails
                itemsList
            }
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
    
    private var navigationBar: some View {
        NavigationBarView(
            currentTime: $viewModel.currentTime, 
            selectedMenuItem: $viewModel.selectedMenuItem
        )
        .padding(
            [.leading, .top, .trailing],
            MainLayoutConstants.safeAreaPadding
        )
    }
    
    private var selectedItemDetails: some View {
        ItemDetailsView(selectedItem: viewModel.selectedItem)
            .padding(.horizontal, MainLayoutConstants.safeAreaPadding)
    }
    
    private var itemsList: some View {
        MainTilesListView(
            activeItem: $viewModel.selectedItem,
            mediaItems: viewModel.mediaItems
        )
        .padding(.bottom, MainLayoutConstants.safeAreaPadding)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = HomeViewModel()
    
    static var previews: some View {
        HomeView(viewModel: viewModel)
            .previewDevice(.init(rawValue: "iPad8,1"))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1194.0, height: 834.0))
    }
}
