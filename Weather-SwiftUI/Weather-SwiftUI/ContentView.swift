//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Haider Shahzad on 12/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack {
                MainStatusView(city: "Lahore, PK", imageName: "cloud.sun.fill", temperature: 25)
                HStack(spacing: 10) {
                    DaysView(dayofTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 25)
                    DaysView(dayofTheWeek: "WED", imageName: "cloud.sun.fill", temperature: 25)
                    DaysView(dayofTheWeek: "THU", imageName: "cloud.sun.fill", temperature: 25)
                    DaysView(dayofTheWeek: "FRI", imageName: "cloud.sun.fill", temperature: 25)
                    DaysView(dayofTheWeek: "SAT", imageName: "cloud.sun.fill", temperature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    MainButtonView(text: "Change Dark Mode", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DaysView: View {
    
    var dayofTheWeek: String
    var imageName: String
    var temperature : Int
    
    var body: some View {
        VStack (spacing: 8) {
            Text(dayofTheWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding(.top , 10)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding(.bottom , 10)
        }
        .border(.white)
    }
}

struct BackgroundView: View {
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : .lightBlue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainStatusView : View {
    
    var city: String
    var imageName: String
    var temperature: Int
    
    var body: some View{
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
        VStack (spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct MainButtonView: View {
    var text : String
    var textColor : Color
    var backgroundColor : Color
    var body: some View {
        Text(text)
            .frame(width: 280, height: 30)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding()
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 16))
    }
}
