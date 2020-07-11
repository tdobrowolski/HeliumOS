//
//  ContentView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 23/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        ZStack {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                NavigationBar()
                    .padding([.top, .trailing], 60)
                    .padding([.bottom, .leading], 75)
                Spacer()
                ItemDetailsView()
                    .padding([.leading, .trailing], 75)
                MainTilesList()
            }
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let activeMenuItem = ActiveMenuItem()
    
    static var previews: some View {
        ContentView()
            .environmentObject(activeMenuItem)
            .previewDevice(PreviewDevice(rawValue: "iPad8,1"))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1194, height: 834))
    }
}


//MARK: My Components (Beta)

struct NavigationBar: View {
    
    @ObservedObject var liveClockService = LiveClockService()
    
    var body: some View {
        HStack {
            HStack(spacing: 50) {
                MenuClickableButton(isSelected: true, menuItem: .home)
                MenuClickableButton(menuItem: .games)
                MenuClickableButton(menuItem: .media)
                MenuClickableButton(menuItem: .store)
                MenuClickableButton(menuItem: .tv)
                MenuClickableButton(menuItem: .options)
            }
            Spacer()
            HStack(spacing: 50) {
                Text(liveClockService.currentTime)
                    .font(.custom("Product Sans Bold", size: 24))
                    .foregroundColor(.white)
                MenuClickableButton(menuItem: .notifications)
                Image(systemName: "wifi")
                    .foregroundColor(.white)
                Image("avatar")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .overlay(Capsule()
                    .stroke(Color.blueNeon, lineWidth: 3)
                    .shadow(color: Color.blueNeon.opacity(0.5), radius: 8, x: 0, y: 0))
            }
        }.font(.system(size: 22, weight: .bold))
    }
}

struct MenuClickableButton: View {
    
    @State var isSelected: Bool = false
    
    let menuItem: MenuItemType
    
    var body: some View {
        Button(action : {
            print("👆 \(self.menuItem) button was tapped")
        }) {
            Image(systemName: menuItem.rawValue)
                .foregroundColor(isSelected ? Color.blueNeon : .white)
        }
    }
}

struct ItemDetailsView: View {
    
    @EnvironmentObject var activeMenuItem: ActiveMenuItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(activeMenuItem.getActiveItem()?.largeTitle ?? "")
                .font(.custom("Product Sans Bold", size: 62))
                .foregroundColor(.white)
            HStack(spacing: 20) {
                Text(activeMenuItem.getActiveItem()?.title ?? "")
                    .foregroundColor(.white)
                Capsule()
                    .foregroundColor(.yellowNeon)
                    .frame(width: 4, height: 20, alignment: .center)
                Text(activeMenuItem.getFormattedGenresString())
                    .foregroundColor(.white)
                Capsule()
                    .foregroundColor(.yellowNeon)
                    .frame(width: 4, height: 20, alignment: .center)
                HStack(spacing: 10) {
                    Button(action: {
                        print("👆 Action button was tapped")
                    }) {
                        Image("controllerButtonA")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(activeMenuItem.getButtonActionForActiveItem())
                            .foregroundColor(.white)
                    }
                }
            }.font(.custom("Product Sans Bold", size: 26))
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RawTiles: View {
        
    @ObservedObject var mediaItemGenerator = MediaGenerator()

    var body: some View {
        return ForEach(mediaItemGenerator.mediaItems) { mediaItem in
            MediaTile(mediaItem: mediaItem)
                .id(mediaItem.id)
        }
    }
}

struct MainTilesList: View {
    
    @EnvironmentObject var activeMenuItem: ActiveMenuItem
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .frame(width: 75, height: 350)
                        .foregroundColor(.clear)
                    RawTiles()
                    Rectangle()
                        .frame(width: 75, height: 350)
                        .foregroundColor(.clear)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 400, alignment: .leading)
            }.onChange(of: activeMenuItem.highlightedMenuItem?.id) { tileId in
                guard let tileId = tileId else { return }
                withAnimation {
                    scrollProxy.scrollTo(tileId)
                }
            }
        }
    }
}

struct MediaTile: View {
    
    @EnvironmentObject var activeMenuItem: ActiveMenuItem
    
    @State private var isFocused: Bool = false
        
    let mediaItem: MediaItemModel
    
    var body: some View {
        Image(mediaItem.tileImagePath ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(isFocused ? 1.1 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: isFocused ? 10 : 0)
                .scale(isFocused ? 1.1 : 1.0))
            .overlay(RoundedRectangle(cornerRadius: isFocused ? 10 : 0)
                .scale(isFocused ? 1.1 : 1.0)
                .stroke(Color.blueNeon, lineWidth: isFocused ? 8 : 0)
                .shadow(color: Color.blueNeon.opacity(isFocused ? 0.5 : 0), radius: 16, x: 0, y: 0))
            .zIndex(isFocused ? 1 : -1)
            .animation(.easeOut(duration: 0.1))
            .frame(width: 280, height: 280)
            .gesture(
                TapGesture().onEnded { _ in
                    UIAudioService.shared.playUISound(for: .changeSelection)
                    self.activeMenuItem.setAsActive(item: self.mediaItem)
                }
        ).onReceive(activeMenuItem.$highlightedMenuItem) { activeItem in
            self.isFocused = activeItem?.id == self.mediaItem.id
        }
    }
}

struct BackgroundView: View {
    
    @EnvironmentObject var activeMenuItem: ActiveMenuItem
    
    @State var showImageTransition: Bool = false
    
    var body: some View {
        
        let primaryNavBarColor = Color(red: 0, green: 0, blue: 0).opacity(0.3)
        let secondaryNavBarColor = Color(red: 0.04, green: 0.04, blue: 0.04).opacity(0.25)
        let primaryDetailsColor = Color(red: 0.18, green: 0.18, blue: 0.18).opacity(0.5)
        let secondaryDetailsColor = Color(red: 0.33, green: 0.33, blue: 0.33).opacity(0.4)
        
        let gradientArray = Gradient(colors: [primaryNavBarColor,
                                              secondaryNavBarColor,
                                              .clear,
                                              primaryDetailsColor,
                                              secondaryDetailsColor,
                                              .clear,
                                              .clear])
        
        return ZStack(alignment: .center) {
            GeometryReader { geo in
                Image(self.activeMenuItem.getActiveItem()?.backgroundMediaPath ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaleEffect(self.showImageTransition ? 1.1 : 1)
                    .opacity(self.showImageTransition ? 0.5 : 1)
                    .transition(.move(edge: .leading))
                    .onReceive(self.activeMenuItem.$highlightedMenuItem) { activeMenuItem in
                        self.showImageTransition.toggle()
                        self.showImageTransition.toggle()
                }
            }
            LinearGradient(gradient: gradientArray, startPoint: .top, endPoint: .bottom)
        }
    }
}

// MARK: Color extensions

extension Color {
    static let yellowNeon = Color("yellowNeon")
    static let blueNeon = Color("blueNeon")
}
