//
//  HomeView.swift
//  gainiFi
//
//  Created by Anderson Sprenger on 29/04/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Credit: 500")
                            Text("Score: 2500")
                        }
                        .font(.callout)
                        
                        Spacer()
                        
                        Image("user_mock")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                    }
                    
                    Text("Financial Summary")
                        .font(.title)
                        .bold()
                    
//                    ChartView(isOverview: false)
//                        .frame(height: 200)
                    
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 16)
//                            .foregroundStyle(.accent)
                        
                    VStack(alignment: .leading) {
                            Text("Balance: $125,00")
                                .font(.title)
                                .bold()
                                .foregroundStyle(.white)
                            
                            LineChartView(isOverview: false)
                        }
                        .padding()
                        .background(.accent)
                        .cornerRadius(16)
//                    }
                    .frame(height: 240)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.accent)
                        
                        Text("Debit")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .frame(height: 200)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.accent)
                        
                        Text("Offers")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .frame(height: 200)
                    
                    Spacer()
                }
                .padding()
            }
            .overlay(alignment: .top) {
                Color.clear // Or any view or color
                    .background(.background) // I put clear here because I prefer to put a blur in this case. This modifier and the material it contains are optional.
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 0) // This will constrain the overlay to only go above the top safe area and not under.
            }
        }
    }
    
}

#Preview {
    HomeView()
}
