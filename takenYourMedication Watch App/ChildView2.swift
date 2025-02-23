
//
//  ChildView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//

import SwiftUI

struct ChildViewRecord: View {
    //最初に定義する時に１週間分の記録を「history」に入れる
    //2つのTag間で共有
    @State var history: String = medicationDataPrint()
    
    var body: some View {
        
        TabView() {
            TagviewRecord(history: $history).tag(1) //ボタンか押されたらhistoryの値を更新する
            TagviewPrint(history: $history).tag(2)  //historyの値でリストを作成し表示する
        }
    }
}

#Preview {
    ChildViewRecord()
}


struct TagviewRecord: View {
    //1週間分の記録　2つのTag間で共有
    @Binding var history: String
    
    @State private var Navigation: Bool = false
    @State private var isChoZen: Bool = false
    @State private var isChoGo: Bool = false
    @State private var isHiruZen: Bool = false
    @State private var isHiruGo: Bool = false
    @State private var isYuZen: Bool = false
    @State private var isHYuGo: Bool = false
    
    //Picker　今日、昨日、一昨日　選択値
    @State private var selectionOffset = 0
    

    
    //    init(history: Binding<String>){
    //        self._history = history
    //    }
    
    
    var body: some View {
         
        
        VStack {

            TimelineView(.periodic(from: .now, by: 900.0 )) { timeline in
                //西暦
                let calendar = Calendar(identifier: .gregorian)
                let date = Date()
                let month : Int = Int(calendar.component(.month, from: date))
                let day: Int = Int( calendar.component(.day, from: date) )
                let hour : Int = Int(calendar.component(.hour, from: date))
                let miut : Int = Int(calendar.component(.minute, from: date))
                
                if medicatioRecodeClear() == 1 {
                    let _ = print("\(day)日\(hour)時\(miut)分　TimelineView：データの更新　あり")
                }else{
                    let _ = print("\(day)日\(hour)時\(miut)分　TimelineView：データの更新　なし")
                }
                
                
                HStack{
                    Text("\(String(format: "%02d", month))月\(String(format: "%02d", day))日").font(.system(size: 18))
                        .font(.system(size: 20))
                        .frame(width:85, alignment: .center)
                        .offset(x: 0, y: 7 )
                        .onAppear {
                            history = medicationDataPrint()
                        }
                    
                    
                    Picker("", selection: $selectionOffset ) {
                        /// 選択項目の一覧
                        Text("今日").tag(0)
                        Text("昨日").tag(1)
                        Text("一昨日").tag(2)
                    }
                    .pickerStyle(.wheel)
                    .frame(height:38)
                    .font(.system(size: 16))
                    .background(Color(red: 0.1, green: 0.15, blue: 0.0))
                    .foregroundColor(isChoZen ? .primary : .primary)
                    
                }
                .offset(x: 0, y: -10 )
                
                HStack{
                    Text("朝")
                        .font(.system(size: 20))
                    if medicatioIOOut(dayIndex:selectionOffset, index: 1, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 1, flag: 1 ) ? "O: 食前" : "X: 食前") {
                            isChoZen = medicatioIOBool(dayIndex:selectionOffset,  index: 1, flag: 1 )
                            if isChoZen {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:1, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:1, flag: 1, value: 1)
                            }
                            isChoZen.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isChoZen ? .primary : .primary)
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                    
                    if medicatioIOOut(dayIndex:selectionOffset, index: 2, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 2, flag: 1)  ? "O:  食後" : "X:  食後") {
                            isChoGo = medicatioIOBool( dayIndex:selectionOffset, index: 2, flag: 1)
                            if isChoGo {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:2, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:2, flag: 1, value: 1)
                            }
                            isChoGo.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isChoGo ? .primary : .primary)
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                }
                .background(Color(red: 0.1, green: 0.1, blue: 0.3))
                .frame(height:28)
                .cornerRadius(10)
                
                HStack{
                    Text("昼")
                        .font(.system(size: 20))
                    if medicatioIOOut(dayIndex:selectionOffset, index: 3, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 3, flag: 1) ? "O: 食前" : "X: 食前") {
                            isHiruZen = medicatioIOBool( dayIndex:selectionOffset, index: 3, flag: 1)
                            if isHiruZen {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:3, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:3, flag: 1, value: 1)
                            }
                            isHiruZen.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isHiruZen ? .primary : .primary)
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                    
                    if medicatioIOOut(dayIndex:selectionOffset, index: 4, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 4, flag: 1) ? "O:  食後" : "X:  食後") {
                            isHiruGo = medicatioIOBool( dayIndex:selectionOffset, index: 4, flag: 1)
                            if isHiruGo {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:4, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:4, flag: 1, value: 1)
                            }
                            isHiruGo.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isHiruGo ? .primary : .primary)
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                    
                }
                .background(Color(red: 0.2, green: 0.2, blue: 0.1)) //背景色を指定
                .frame(height:28) //高さを追加
                .cornerRadius(10) //コーナーＲを追加
                
                
                HStack{
                    Text("夕")
                        .font(.system(size: 20))
                    if medicatioIOOut(dayIndex:selectionOffset, index: 5, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 5, flag: 1)  ? "O: 食前" : "X: 食前") {
                            isYuZen = medicatioIOBool( dayIndex:selectionOffset, index: 5, flag: 1)
                            if isYuZen {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:5, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:5, flag: 1, value: 1)
                            }
                            isYuZen.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isYuZen ? .primary : .primary)
                        
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                    
                    if medicatioIOOut(dayIndex:selectionOffset, index: 6, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 6, flag: 1) ? "O:  食後" : "X:  食後") {
                            isHYuGo = medicatioIOBool( dayIndex:selectionOffset, index: 6, flag: 1)
                            if isHYuGo {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:6, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:6, flag: 1, value: 1)
                            }
                            isHYuGo.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(isHYuGo ? .primary : .primary)
                        
                    }else{
                        Button("") {
                            //                       /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                }
                .background(Color(red: 0.2, green: 0.1, blue: 0.1))
                .frame(height:28)
                .cornerRadius(10)
                
                HStack{
                    Text("夜")
                        .font(.system(size: 20))
                        .frame(width: 88, alignment: .trailing)
                        .background(Color(red: 0.1, green: 0.15, blue: 0.0))
                    
                    if medicatioIOOut(dayIndex:selectionOffset, index: 0, flag: 0) == 1 {
                        Button(medicatioIOBool( dayIndex:selectionOffset, index: 0, flag: 1 ) ? "O: 眠前" : "X: 眠前") {
                            Navigation = medicatioIOBool( dayIndex:selectionOffset, index: 0, flag: 1 )
                            
                            if Navigation {
                                //                         stopPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:0, flag: 1, value: 0)
                            } else {
                                //                         startPedometerUpdates()
                                medicatioIOIn(dayIndex:selectionOffset, index:0, flag: 1, value: 1)
                            }
                            Navigation.toggle()
                            history = medicationDataPrint()
                        }
                        .foregroundColor(Navigation ? .primary : .primary)
                    }else{
                        Button("") {
                            //                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }
                }
                .background(Color(red: 0.2, green: 0.2, blue: 0.2))
                .frame(height:26)
                .cornerRadius(10)
            }
        }
        .padding()
        .offset(x:0, y:0)
    }
}

#Preview {
    //  TagviewRecord()
}
