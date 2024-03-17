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
    
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
//                Button("") {
//                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                }

                Button( medicatioIOBool( index: 0, flag: 0 ) ? "O:寝前" : "X:寝前") {
                    isMinZen = medicatioIOBool( index: 0, flag: 0 )
                    if isMinZen {
                        medicatioIOIn(index:0, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:0, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
//                    isMinZen.toggle()
                    isMinZen = medicatioIOBool( index: 0, flag: 0 )
                }
                .foregroundColor(isMinZen ? .primary : .primary)
                .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                .frame(width: 70, height: 38)
            }
            
            HStack{
                Button(medicatioIOBool( index: 1, flag: 0 ) ? "O:朝前" : "X:朝前") {
                    isChoZen = medicatioIOBool( index: 1, flag: 0 )
                    if isChoZen {
                        medicatioIOIn(index:1, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:1, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isChoZen.toggle()
                }
                .foregroundColor(isChoZen ? .primary : .primary)
                .background(Color(red: 0.1, green: 0.1, blue: 0.3))
                
                Button( medicatioIOBool( index: 2, flag: 0) ? "O:朝後" : "X:朝後") {
                    isChoGo = medicatioIOBool( index: 2, flag: 0)
                    if isChoGo {
                        medicatioIOIn(index:2, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:2, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isChoGo.toggle()
                }
                .foregroundColor(isChoGo ? .primary : .primary)
                .background(Color(red: 0.1, green: 0.1, blue: 0.3))

           }
            HStack{
                Button(medicatioIOBool( index: 3, flag: 0) ? "O:昼前" : "X:昼前") {
                    isHiruZen = medicatioIOBool( index: 3, flag: 0)
                    if isHiruZen {
                        medicatioIOIn(index:3, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:3, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isHiruZen.toggle()
                }
                .foregroundColor(isHiruZen ? .primary : .primary)
                .background(Color(red: 0.2, green: 0.2, blue: 0.1))
                
                Button(medicatioIOBool( index: 4, flag: 0)  ? "O:昼後" : "X:昼後") {
                    isHiruGo = medicatioIOBool( index: 4, flag: 0)
                    if isHiruGo {
                        medicatioIOIn(index:4, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:4, flag: 0, value: 1)   //  startPedometerUpdates()
                   }
                    isHiruGo.toggle()
                }
                .foregroundColor(isHiruGo ? .primary : .primary)
                .background(Color(red: 0.2, green: 0.2, blue: 0.1))

            }
            HStack{
                Button(medicatioIOBool( index: 5, flag: 0) ? "O:夕前" : "X:夕前") {
                    isYuZen = medicatioIOBool( index: 5, flag: 0)
                    if isYuZen {
                        medicatioIOIn(index:5, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        medicatioIOIn(index:5, flag: 0, value: 1)   //  startPedometerUpdates()
                   }
                    isYuZen.toggle()
                }
                .foregroundColor(isYuZen ? .primary : .primary)
                .background(Color(red: 0.2, green: 0.1, blue: 0.1))

                Button(medicatioIOBool( index: 6, flag: 0) ? "O:夕後" : "X:夕後") {
                    isYuGo = medicatioIOBool( index: 6, flag: 0)
                    if isYuGo {
                        //                         stopPedometerUpdates()
                        medicatioIOIn(index:6, flag: 0, value: 0)   //  stopPedometerUpdates()
                    } else {
                        //                         startPedometerUpdates()
                        medicatioIOIn(index:6, flag: 0, value: 1)   //  startPedometerUpdates()
                    }
                    isYuGo.toggle()
                }
                .foregroundColor(isYuGo ? .primary : .primary)
                .background(Color(red: 0.2, green: 0.1, blue: 0.1))

            }
        }.padding()
    }
}

#Preview {
    ChildViewSetUp( )
}
