//
//  ContentView.swift
//  Social-media-dashboard-with-theme-switcher-master
//
//  Created by Marcos Fabian Chong Megchun on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var isWhite: Bool = false
    @State var data = mainCardData
    @State var overview_data = overviewData
    var body: some View {
        ScrollView() {
            VStack {
                    Text("Social Media Dashboard")
                        .font(.custom("Inter-Bold", size: 27))
                    .foregroundColor(Color(isWhite ? "LT-VeryDarkBlue" : "White"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 2)
                    Text("Total Followers: 23,004")
                        .font(.custom("Inter-Bold", size: 16))
                        .foregroundColor(Color(isWhite ? "LT-DarkGrayishBlue" : "DT-DesaturatedBlue"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 20)
                   Divider()
                    .overlay(Color("DT-DesaturatedBlue"))
                    .padding(.bottom)
                    Toggle("", isOn: $isWhite)
                    .toggleStyle(
                        GradientToogleStyle())
                    .padding(.bottom, 30)
                ForEach($data, id: \.id) { data in
                    Cards(isWhite: $isWhite, data: data)
                }
                .padding(.bottom, 25)
                Text("Overview - Today")
                    .font(.custom("Inter-Bold", size: 27))
                .foregroundColor(Color(isWhite ? "LT-VeryDarkBlue" : "White"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                ForEach($overview_data, id: \.id) { data in
                    OverviewCardComponent(isWhite: $isWhite, data: data)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color(isWhite ? "White" : "DT-VeryDarkBlue")
            .ignoresSafeArea()
        }
    }
}

struct GradientToogleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text("Dark mode")
                .foregroundColor(Color("DT-DesaturatedBlue"))
                .font(.custom("Inter-Bold", size: 16))
            Spacer()
            Button(action: {configuration.isOn.toggle()}) {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .conditionalModifier(configuration.isOn, ifTrue: {
                        $0.fill(Color("Toogle-light-theme"))
                          }, ifFalse: {
                              $0.fill(
                                LinearGradient(colors: [Color("Toogle-dt-01"), Color("Toogle-dt-02")], startPoint: .leading, endPoint: .trailing)
                             )
                          })
                    .frame(width: 60, height: 29)
                    .overlay(
                        Circle()
                            .conditionalModifier(configuration.isOn, ifTrue: {
                                $0.fill(Color("LT-VeryPaleBlue"))
                                  }, ifFalse: {
                                      $0.fill(
                                        Color("DT-DarkSaturatedBlue")
                                     )
                                  })
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 14 : -14)
                            .animation(Animation.easeInOut(duration: 0.1))
                    )
            }
        }
    }
}

extension View {
    typealias ContentTransform<Content: View> = (Self) -> Content
    @ViewBuilder func conditionalModifier<TrueContent: View, FalseContent: View>(
          _ condition: Bool,
          ifTrue: ContentTransform<TrueContent>,
          ifFalse: ContentTransform<FalseContent>) -> some View {
      if condition {
          ifTrue(self)
      } else {
          ifFalse(self)
      }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Cards: View {
    @Binding var isWhite: Bool
    @Binding var data: MainCard
    
    var body: some View {
        VStack {
            HStack {
                Image(data.imageSocial)
                Text(data.username)
                    .foregroundColor(Color(isWhite ? "LT-DarkGrayishBlue" : "DT-DesaturatedBlue"))
                    .font(.custom("Inter-Bold", size: 16))
            }
            Text(data.numberFollowers)
                .foregroundColor(Color(isWhite ? "LT-VeryDarkBlue" : "White"))
                .font(.custom("Inter-Bold", size: 55))
            Text(data.typeOfMembers)
                .foregroundColor(Color(isWhite ? "LT-DarkGrayishBlue" : "DT-DesaturatedBlue"))
                .font(.custom("Inter-Regular", size: 18))
                .tracking(5)
            Label("\(data.updatedSubscribed) Today", image: data.arrowImage)
                .foregroundColor(Color(data.colorOfTextArrow))
                .font(.custom("Inter-Bold", size: 16))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
        .padding(.bottom, 30)
        .overlay(Rectangle()
            .conditionalModifier(data.hasGradient, ifTrue: {
                $0.fill(
                    LinearGradient(colors: [Color(data.Gradient1), Color(data.Gradient2)], startPoint: .leading, endPoint: .trailing)
                )
            }, ifFalse: {
                $0.fill(
                    Color(data.Gradient1)
                )
            })
                .frame(width: nil, height: 4, alignment: .top)
                .foregroundColor(Color.red), alignment: .top)
        .background(
            Color(isWhite ? "LT-LightGrayishBlue" : "DT-DarkSaturatedBlue")
        )
        .cornerRadius(7)
    }
}

struct OverviewCardComponent: View {
    @Binding var isWhite: Bool
    @Binding var data: OverviewCard
    
    var body: some View {
        VStack {
            HStack {
                Text(data.typeStatistic)
                    .foregroundColor(Color(isWhite ? "LT-DarkGrayishBlue" : "DT-DesaturatedBlue"))
                    .font(.custom("Inter-Bold", size: 16))
                Spacer()
                Image(data.imageSocial)
            }
            HStack {
                Text(data.numberOfType)
                    .foregroundColor(Color(isWhite ? "LT-VeryDarkBlue" : "White"))
                    .font(.custom("Inter-Bold", size: 35))
                Spacer()
                Label(data.percentage, image: data.arrowImage)
                    .foregroundColor(Color(data.colorOfTextArrow))
                    .font(.custom("Inter-Bold", size: 16))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(25)
        .background(
            Color(isWhite ? "LT-LightGrayishBlue" : "DT-DarkSaturatedBlue")
        )
        .cornerRadius(7)
        .padding(.bottom, 17)
    }
}
