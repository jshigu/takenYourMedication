//
//  ChildView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//

import SwiftUI

struct ChildViewDouiMessage: View {
    @State private var Navigation: Bool = false
    @State private var isChoZen: Bool = false
    @State private var isChoGo: Bool = false
    @State private var isHiruZen: Bool = false
    @State private var isHiruGo: Bool = false
    @State private var isYuZen: Bool = false
    @State private var isHYuGo: Bool = false

    var body: some View {
        VStack {
            HStack{
                Spacer()
//                Button("") {
//                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
//                }
                if medicatioIOOut(index: 0, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 0, flag: 1 ) ? "O:寝前" : "X:寝前") {
                        Navigation = medicatioIOBool( index: 0, flag: 1 )

                        if Navigation {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:0, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:0, flag: 1, value: 1)
                        }
                        Navigation.toggle()
                    }
                    .foregroundColor(Navigation ? .primary : .primary)
                    .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                    .frame(width: 70, height: 38)
                }else{
                    Button("") {
//                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .frame(width: 70, height: 38)
                }
            }
            HStack{
                if medicatioIOOut(index: 1, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 1, flag: 1 ) ? "O:朝前" : "X:朝前") {
                        isChoZen = medicatioIOBool( index: 1, flag: 1 )
                        if isChoZen {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:1, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:1, flag: 1, value: 1)
                        }
                        isChoZen.toggle()
                    }
                    .foregroundColor(isChoZen ? .primary : .primary)
                    .background(Color(red: 0.1, green: 0.1, blue: 0.3))

                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
 
                if medicatioIOOut(index: 2, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 2, flag: 1)  ? "O:朝後" : "X:朝後") {
                        isChoGo = medicatioIOBool( index: 2, flag: 1)
                        if isChoGo {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:2, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:2, flag: 1, value: 1)
                        }
                        isChoGo.toggle()
                    }
                    .foregroundColor(isChoGo ? .primary : .primary)
                    .background(Color(red: 0.1, green: 0.1, blue: 0.3))

                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
            }
 
            HStack{
                if medicatioIOOut(index: 3, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 3, flag: 1) ? "O:昼前" : "X:昼前") {
                        isHiruZen = medicatioIOBool( index: 3, flag: 1)
                        if isHiruZen {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:3, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:3, flag: 1, value: 1)
                        }
                        isHiruZen.toggle()
                    }
                    .foregroundColor(isHiruZen ? .primary : .primary)
                    .background(Color(red: 0.2, green: 0.2, blue: 0.1))

                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
 
                if medicatioIOOut(index: 4, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 4, flag: 1) ? "O:昼後" : "X:昼後") {
                        isHiruGo = medicatioIOBool( index: 4, flag: 1)
                        if isHiruGo {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:4, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:4, flag: 1, value: 1)
                        }
                        isHiruGo.toggle()
                    }
                    .foregroundColor(isHiruGo ? .primary : .primary)
                    .background(Color(red: 0.2, green: 0.2, blue: 0.1))

                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }

            }
 
            HStack{
                if medicatioIOOut(index: 5, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 5, flag: 1)  ? "O:夕前" : "X:夕前") {
                        isYuZen = medicatioIOBool( index: 5, flag: 1)
                        if isYuZen {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:5, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:5, flag: 1, value: 1)
                        }
                        isYuZen.toggle()
                    }
                    .foregroundColor(isYuZen ? .primary : .primary)
                    .background(Color(red: 0.2, green: 0.1, blue: 0.1))


                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
                
                if medicatioIOOut(index: 6, flag: 0) == 1 {
                    Button(medicatioIOBool( index: 6, flag: 1) ? "O:夕後" : "X:夕後") {
                        isHYuGo = medicatioIOBool( index: 6, flag: 1)
                        if isHYuGo {
                            //                         stopPedometerUpdates()
                            medicatioIOIn(index:6, flag: 1, value: 0)
                        } else {
                            //                         startPedometerUpdates()
                            medicatioIOIn(index:6, flag: 1, value: 1)
                        }
                        isHYuGo.toggle()
                    }
                    .foregroundColor(isHYuGo ? .primary : .primary)
                    .background(Color(red: 0.2, green: 0.1, blue: 0.1))


                }else{
                    Button("") {
 //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
            }
 

        }.padding()
    }
}

#Preview {
    ChildViewRecord()
}
