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
                VStack(alignment: .leading, spacing: 0) {
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
                    .padding()
                    
                    Text("Financial Summary")
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                    
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
                    .frame(height: 240)
                    .padding()
                    
                    VStack {
                        ZStack {
                            HStack {
                                SectorChartView()
                                    .frame(width: 266)
                                    .padding(.vertical)
                                
                                Spacer()
                            }
                            
                            VStack{
                                HStack(alignment: .top) {
                                    Spacer()
                                    
                                    Text("Debit")
                                            .font(.title)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding()
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding(.horizontal)
                    .background(.accent)
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.accent)
                        
                        Text("\(Image(systemName: "dollarsign.circle")) Affiliate Offers")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .frame(height: 200)
                    .padding()
                    
                    Spacer()
                }
            }
            .overlay(alignment: .top) {
                Color.clear
                    .background(.background)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 0)
            }
        }
    }
    
}

#Preview {
    HomeView()
}
