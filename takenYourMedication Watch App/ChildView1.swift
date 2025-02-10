
//
//  ChildView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//

import SwiftUI

struct ChildViewSetUp: View {
    @State private var isMinZen: Bool = false
    @State private var isChoZen: Bool = false
    @State private var isChoGo: Bool = false
    @State private var isHiruZen: Bool = false
    @State private var isHiruGo: Bool = false
    @State private var isYuZen: Bool = false
    @State private var isYuGo: Bool = false
    
    /* --------------------------------------------------------------
    dayIndex　今日:0　昨日:1　一昨日:2
    index　寝前:0　朝食前:1　朝食後:2　昼食前:3　昼食後:4　夕食前:5　夕食後:6
    flag   指定:0　記録:1
    value  クリヤ:0　セット:1
     
     ----------------------------------------------------------------*/
    
    var body: some View {
        VStack {
            HStack{
              Text("朝")
                .font(.system(size: 20))

                Button(medicatioIOBool( dayIndex:0, index: 1, flag: 0 ) ? "O: 食前" : "X: 食前") {
                    isChoZen = medicatioIOBool( dayIndex:0, index: 1, flag: 0 )
                    if isChoZen {
                        medicatioIOIn(dayIndex:0, index:1, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:1, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isChoZen.toggle()
                }
                .foregroundColor(isChoZen ? .primary : .primary)
                
                Button( medicatioIOBool( dayIndex:0, index: 2, flag: 0) ? "O: 食後" : "X: 食後") {
                    isChoGo = medicatioIOBool( dayIndex:0, index: 2, flag: 0)
                    if isChoGo {
                        medicatioIOIn(dayIndex:0, index:2, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:2, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isChoGo.toggle()
                }
                .foregroundColor(isChoGo ? .primary : .primary)
           }
            .background(Color(red: 0.1, green: 0.1, blue: 0.3))
            .frame(height:28)
            .cornerRadius(10)

            HStack{
              Text("昼")
                .font(.system(size: 20))

                Button(medicatioIOBool( dayIndex:0, index: 3, flag: 0) ? "O: 食前" : "X: 食前") {
                    isHiruZen = medicatioIOBool( dayIndex:0, index: 3, flag: 0)
                    if isHiruZen {
                        medicatioIOIn(dayIndex:0, index:3, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:3, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isHiruZen.toggle()
                }
                .foregroundColor(isHiruZen ? .primary : .primary)
                
                Button(medicatioIOBool( dayIndex:0, index: 4, flag: 0)  ? "O: 食後" : "X: 食後") {
                    isHiruGo = medicatioIOBool( dayIndex:0, index: 4, flag: 0)
                    if isHiruGo {
                        medicatioIOIn(dayIndex:0, index:4, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:4, flag: 0, value: 1)   //  startPedometerUpdates()
                   }
                    isHiruGo.toggle()
                }
                .foregroundColor(isHiruGo ? .primary : .primary)
            }
            .background(Color(red: 0.2, green: 0.2, blue: 0.1))
            .frame(height:28)
            .cornerRadius(10)
            
            HStack{
              Text("夕")
                .font(.system(size: 20))

                Button(medicatioIOBool( dayIndex:0, index: 5, flag: 0) ? "O: 食前" : "X: 食前") {
                    isYuZen = medicatioIOBool( dayIndex:0, index: 5, flag: 0)
                    if isYuZen {
                        medicatioIOIn(dayIndex:0, index:5, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:5, flag: 0, value: 1)   //  startPedometerUpdates()
                   }
                    isYuZen.toggle()
                }
                .foregroundColor(isYuZen ? .primary : .primary)

                Button(medicatioIOBool( dayIndex:0, index: 6, flag: 0) ? "O: 食後" : "X: 食後") {
                    isYuGo = medicatioIOBool( dayIndex:0, index: 6, flag: 0)
                    if isYuGo {
                        //                         stopPedometerUpdates()
                        medicatioIOIn(dayIndex:0, index:6, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        //                         startPedometerUpdates()
                        medicatioIOIn(dayIndex:0, index:6, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isYuGo.toggle()
                }
                .foregroundColor(isYuGo ? .primary : .primary)
            }
            .background(Color(red: 0.2, green: 0.1, blue: 0.1))
            .frame(height:28)
            .cornerRadius(10)
            
            HStack{
              Text("夜")
                .font(.system(size: 20))
                .frame(width: 88, height:16, alignment: .trailing)
                Button( medicatioIOBool( dayIndex:0, index: 0, flag: 0 ) ? "O: 眠前" : "X: 眠前") {
                    isMinZen = medicatioIOBool( dayIndex:0, index: 0, flag: 0 )
                    if isMinZen {
                        medicatioIOIn(dayIndex:0, index:0, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(dayIndex:0, index:0, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isMinZen.toggle()
                    isMinZen = medicatioIOBool( dayIndex:0, index: 0, flag: 0 )
                }
                .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                .foregroundColor(isMinZen ? .primary : .primary)
                .frame(height:28)
                .cornerRadius(10)
            }
            
        }.padding()
    }
}

#Preview {
    ChildViewSetUp( )
}
