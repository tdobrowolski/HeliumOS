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
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad8,1"))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1194, height: 834))
    }
}


//MARK: My Components (Alpha)

struct NavigationBar: View {
    
    @ObservedObject var liveClockService = LiveClockService()
    
    var body: some View {
        HStack {
            HStack(spacing: 50) {
                MenuClickableButton(menuItem: .home)
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
                MenuClickableButton(menuItem: .notifications)
                Image(systemName: "wifi")
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
    
    let menuItem: MenuItemType
    
    var body: some View {
        Button(action : {
            print("👆 \(self.menuItem) button was tapped")
        }) {
            Image(systemName: menuItem.rawValue)
                .renderingMode(.original)
        }
    }
}

struct ItemDetailsView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Main item text")
                .font(.custom("Product Sans Bold", size: 62))
            HStack(spacing: 20) {
                Text("Item title")
                Capsule()
                    .foregroundColor(.yellowNeon)
                    .frame(width: 4, height: 20, alignment: .center)
                Text("Item genre")
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
                        Text("Item action").foregroundColor(.black)
                    }
                }
            }.font(.custom("Product Sans Bold", size: 26))
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RawTiles: View {
    
    let mediaItems = [MediaItemModel(title: "First", mediaType: .game),
                         MediaItemModel(title: "Second", mediaType: .game),
                         MediaItemModel(title: "Third", mediaType: .game),
                         MediaItemModel(title: "Fourth", mediaType: .game),
                         MediaItemModel(title: "Fifth", mediaType: .game),
                         MediaItemModel(title: "Sixth", mediaType: .game),
                         MediaItemModel(title: "Seventh", mediaType: .game)]
    
    var body: some View {
        ForEach(mediaItems) { mediaItem in
            MediaTile(mediaItem: mediaItem)
        }
    }
}

struct MainTilesList: View {
    
    var body: some View {
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
            }
    }
}

struct MediaTile: View {
    
    @State private var isFocused: Bool = false
        
    var mediaItem: MediaItemModel
    
    var body: some View {
        Rectangle()
            .scaleEffect(isFocused ? 1.1 : 1.0)
            .clipShape(RoundedRectangle(cornerRadius: isFocused ? 10 : 0)
                .scale(isFocused ? 1.1 : 1.0))
            .overlay(RoundedRectangle(cornerRadius: isFocused ? 10 : 0)
                .scale(isFocused ? 1.1 : 1.0)
                .stroke(Color.blueNeon, lineWidth: isFocused ? 8 : 0)
                .shadow(color: Color.blueNeon.opacity(isFocused ? 0.5 : 0), radius: 16, x: 0, y: 0))
            .zIndex(isFocused ? 1 : -1)
            .animation(.easeOut(duration: 0.1))
            .background(Image(mediaItem.backgroundMediaPath ?? ""))
            .frame(width: 280, height: 280)
            .foregroundColor(.red)
            .gesture(
                TapGesture().onEnded { _ in
                    self.isFocused.toggle()
                }
        )
    }
}

struct BackgroundView: View {
    var body: some View {
        
        let primaryNavBarColor = Color(red: 0, green: 0, blue: 0).opacity(0.1)
        let secondaryNavBarColor = Color(red: 0.04, green: 0.04, blue: 0.04).opacity(0.15)
        let primaryDetailsColor = Color(red: 0.18, green: 0.18, blue: 0.18).opacity(0.2)
        let secondaryDetailsColor = Color(red: 0.33, green: 0.33, blue: 0.33).opacity(0.15)
        
        let gradientArray = Gradient(colors: [primaryNavBarColor,
                                              secondaryNavBarColor,
                                              .clear,
                                              primaryDetailsColor,
                                              secondaryDetailsColor,
                                              .clear,
                                              .clear])
        
        return ZStack(alignment: .center) {
//            Image("")
            LinearGradient(gradient: gradientArray, startPoint: .top, endPoint: .bottom)
        }
    }
}

//MARK: Color extensions

extension Color {
    static let yellowNeon = Color("yellowNeon")
    static let blueNeon = Color("blueNeon")
}
