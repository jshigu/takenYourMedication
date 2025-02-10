//
//  ContentView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//


import SwiftUI
import UIKit

import AVFoundation

let ysLANGUAGE=true

struct ContentView: View {
    @State var isShowAlert = false
    @State var doui:Bool = false
    
    //
    @State private var selectedTab = 0
    
    //アラームセット
    private let notificationManager = NotificationManager.shared
    
    
    //sound
    private let kirakiraSound = try!  AVAudioPlayer(data: NSDataAsset(name: "SHIGU02")!.data)
    private func playSound() -> Int {
        kirakiraSound.stop()
        kirakiraSound.currentTime = 0.0
        kirakiraSound.play()
        return 1
    }
    
    
    
    var body: some View {
        
        //    notificationManagerに変更
        //    TimelineView(.periodic(from: .now, by: 1800.0 )) { timeline in
        //        if medicatioRecodeClear() == 1 {
        //          if playSound() == 1 {}
        //        }
        //    }
        
        VStack{
            NavigationStack {
                
                HStack{
                    if doui == true {
                        NavigationLink {
                            ChildViewSetUp()
                        } label: {
                            Text("設定へ")
                                .padding()
                        }
                    }else{
                        Button {
                            isShowAlert = true
                        } label: {
                            Text("開始  Ver.\(String(format: "%02d", medicationData.count))")
                        }
                        .alert( "説明分を読み\n同意します Ver.\(String(format: "%02d", medicationData.count))", isPresented: $isShowAlert ){
                            Button("キャンセル"){
                                doui = false
                            }
                            Button("OK"){
                                //アラームセット
                                notificationManager.scheduleNotification()
                                
                                medicationSet()
                                doui = true
                            }
                        }
                        message: {
                            Text("選択して下さい")
                        }
                    }
                    
                    if doui == true {
                        NavigationLink(destination: ChildViewRecord()) {
                            Text("記録へ")
                        }
                    }
                }
                List {
                    Text("説明文\n食事のタイミングで飲み忘れを防止!\n【設定へ】どの食事で薬を飲むか決めます \n【記録へ】薬を飲んだか記録します。注）この記録は7日間保持します\nこのソフトによる一切の責任は負いません")
                        .font(.system(size: 16))
                    
                    //            Text("Description.\nPrevent forgetting to drink at mealtime.\nSettings\nDecide at which meal you want to take your medicine.\nRecord\nRecord whether you have taken your medicine. Note: This record will be kept for 7 days.\nWe are not responsible for any damage caused by this software.")
                    //              .font(.system(size: 16))
                }
            }
            .background(Color(red: 0.1, green: 0.15, blue: 0.0))
            .navigationTitle("メイン")
        }
    }
}

#Preview {
    ContentView()
}



struct TagviewPrint: View {
    //1週間分の記録　2つのTag間で共有
    @Binding var history: String
    
    //  var stri = medicationDataPrint()
    var body: some View {
        VStack{
            List {
                Text("\(history)")
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    //    TagviewPrint()
}


/* --------------------------------------------------------------
 dayIndex　今日:0　昨日:1　一昨日:2
 index　寝前:0　朝食前:1　朝食後:2　昼食前:3　昼食後:4　夕食前:5　夕食後:6
 flag   指定:0　記録:1
 value  クリヤ:0　セット:1
 
 記録の配列
 medicationData[dayIndex][ 寝前/指定 ,  寝前/記録,
 朝食前/指定, 朝食前/記録, 朝食後/指定, 朝食後/記録,
 昼食前/指定, 昼食前/記録, 昼食後/指定, 昼食後/記録,
 夕食前/指定, 夕食前/記録, 夕食後/指定, 夕食後/記録,
 ]
 ----------------------------------------------------------------*/

var  medicationData:[[Int]] = [ [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                                [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
]


func medicatioRecodeClear() {
    var medicationDataValue:[[Int]] = UserDefaults.standard.array(forKey: "medicat") as! [[Int]]
    
    //
    var hikakuMoto = ""   //Date of last update
    var hikakuThis = ""   //Date now
    
    let date:Date = Date()
    let format = DateFormatter()
    format.dateFormat = "yyyy/MM/dd"
    hikakuThis = format.string(from: date)
    
    //Set to hikakuMoto
    if UserDefaults.standard.object(forKey: "medicatHikaku") == nil {
        //はじめて使う場合は設定されてないので初期値を入れる
        UserDefaults.standard.set(hikakuThis, forKey: "medicatHikaku")
        hikakuMoto = hikakuThis
    }else {
        //再起動の場合は、記録されている値を入れる
        hikakuMoto = UserDefaults.standard.object(forKey: "medicatHikaku") as! String
    }
    
    //日付が変わったら実行
    if hikakuMoto != hikakuThis {
        let _ = print("\(hikakuThis)　データの更新　Going")
        
        //現在の日付を記録
        UserDefaults.standard.set(hikakuThis, forKey: "medicatHikaku")
        
        for i in (0..<medicationData.count - 1).reversed() {
            for h in 0 ..< 14 {
                medicationDataValue[i+1][h] = medicationDataValue[i][h]
            }
            
            if i == 0 {
                //指定と記録の内、今日は記録だけクリヤ
                medicationDataValue[i][0*2+1] = 0
                medicationDataValue[i][1*2+1] = 0
                medicationDataValue[i][2*2+1] = 0
                medicationDataValue[i][3*2+1] = 0
                medicationDataValue[i][4*2+1] = 0
                medicationDataValue[i][5*2+1] = 0
                medicationDataValue[i][6*2+1] = 0
            }
        }
        
        //薬の指定と記録を保存
        UserDefaults.standard.set(medicationDataValue, forKey: "medicat")
    }else{
        let _ = print("\(hikakuThis)　データの更新　non")
    }
}


func medicationSet() {
    //  UserDefaults.standardに設定されているか確認
    if UserDefaults.standard.object(forKey: "medicat") == nil {
        //はじめて使う場合は記録が設定されてないので初期値を入れる
        UserDefaults.standard.set(medicationData, forKey: "medicat")
    }else {
        //配列が昔の形式の場合初期化する
        if medicationData.count != 7 {
            UserDefaults.standard.set(medicationData, forKey: "medicat")
        }
        else{
            //再起動の場合は、記録されている値を入れる
            var medicationDataValue:[[Int]] = UserDefaults.standard.array(forKey: "medicat") as! [[Int]]
        }
    }
}



//記録
func medicatioIOIn(dayIndex:Int, index:Int, flag: Int, value: Int){
    var medicationDataValue:[[Int]] = UserDefaults.standard.array(forKey: "medicat") as! [[Int]]
    medicationDataValue[dayIndex][index*2+flag] = value
    UserDefaults.standard.set(medicationDataValue, forKey: "medicat")
}

//参照
func medicatioIOOut(dayIndex:Int,  index: Int, flag: Int )->( Int ){
    let medicationDataValue:[[Int]] = UserDefaults.standard.array(forKey: "medicat") as! [[Int]]
    return( medicationDataValue[dayIndex][index*2+flag] )
}

//指定確認
func medicatioIOBool( dayIndex:Int, index: Int, flag: Int )->( Bool ){
    let medicationDataValue2:[[Int]] = UserDefaults.standard.array(forKey: "medicat") as! [[Int]]
    
    if  medicationDataValue2[dayIndex][index*2+flag] == 1 {
        return( true )
    }else {
        return( false )
    }
}

//Tabビューで1週間分を表示
func medicationDataPrint() ->( String ){
    var str = ""
    //西暦
    let calendar = Calendar(identifier: .gregorian)
    let date = Date()
    let wkdyString = ["日","月","火","水","木","金","土"]
    
    
    //1週間（７回）表示
    for selectionOffset in 0...6 {
        //Picker値に合わせ、日付を可変
        let modifiedDate = Calendar.current.date(byAdding: .day, value: -1 * selectionOffset , to: date)!
        let month : Int = Int(calendar.component(.month, from: modifiedDate))
        let day: Int = Int( calendar.component(.day, from: modifiedDate) )
        let week = calendar.component(.weekday, from: modifiedDate)
        
        str = str +  "\(String(format: "%02d", month))月\(String(format: "%02d", day))日 \(wkdyString[week-1])\n"
        
        if medicatioIOOut(dayIndex:selectionOffset, index: 1, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 1, flag: 1) { str = str + "\t\t\t O:朝 食前\n" }
            else { str = str + "\t\t\t X:朝 食前\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 2, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 2, flag: 1) { str = str + "\t\t\t O:朝 食後\n" }
            else { str = str + "\t\t\t X:朝 食後\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 3, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 3, flag: 1) { str = str + "\t\t\t O:昼 食前\n" }
            else { str = str + "\t\t\t X:昼 食前\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 4, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 4, flag: 1) { str = str + "\t\t\t O:昼 食後\n"  }
            else { str = str + "\t\t\t X:昼 食後\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 5, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 5, flag: 1) { str = str + "\t\t\t O:夕 食前\n" }
            else { str = str + "\t\t\t X:夕 食前\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 6, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 6 ,flag: 1) { str = str + "\t\t O:夕 食後\n" }
            else { str = str + "\t\t X:夕 食後　\n" }
        }
        if medicatioIOOut(dayIndex:selectionOffset, index: 0, flag: 0) == 1 {
            if medicatioIOBool( dayIndex:selectionOffset, index: 0 ,flag: 1) { str = str +  "\t\t\t O:夜 眠前\n" }
            else { str = str +  "\t\t\t X:夜 眠前\n" }
        }
    }
    return ( str )
    
}



