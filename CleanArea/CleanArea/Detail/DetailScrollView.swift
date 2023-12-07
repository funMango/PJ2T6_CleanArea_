//
//  DetailScrollView.swift
//  CleanArea
//
//  Created by 노주영 on 2023/12/06.
//

import SwiftUI

struct DetailScrollView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        GeometryReader(content: { geometry in
            LazyVStack {
                ScrollViewReader(content: { proxy in
                    HStack {
                        Button {
                            withAnimation {
                                proxy.scrollTo(0, anchor: .top)
                                selectedIndex = 0
                            }
                        } label: {
                            Text("정책요약")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(Color.init(hex: selectedIndex == 0 ?  "8AC49F" : "9A9A9A"))
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(1, anchor: .top)
                                selectedIndex = 1
                            }
                        } label: {
                            Text("신청자격")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(Color.init(hex: selectedIndex == 1 ?  "8AC49F" : "9A9A9A"))
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(2, anchor: .top)
                                selectedIndex = 2
                            }
                        } label: {
                            Text("신청방법")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(Color.init(hex: selectedIndex == 2 ?  "8AC49F" : "9A9A9A"))
                        }
                        
                        Spacer()
                        Button {
                            withAnimation {
                                proxy.scrollTo(3, anchor: .top)
                                selectedIndex = 3
                            }
                        } label: {
                            Text("기타")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundStyle(Color.init(hex: selectedIndex == 3 ?  "8AC49F" : "9A9A9A"))
                        }
                    }
                    
                    ScrollView {
                        ForEach(0..<4) { index in
                            if index == 0 {
                                DetailSummaryView(selectedIndex: $selectedIndex, proxy: proxy)
                            } else if index == 1 {
                                DetailQualificationView(selectedIndex: $selectedIndex, proxy: proxy)
                            } else if index == 2 {
                                DetailWayView(selectedIndex: $selectedIndex, proxy: proxy)
                            } else {
                                DetailEtcView(selectedIndex: $selectedIndex, proxy: proxy)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: geometry.size.height - 30)
                })
                .padding(.top, 20)
            }
        })
    }
}
/*
#Preview {
    DetailScrollView()
}*/
