//
//  ChildView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//

import SwiftUI

struct ChildViewRecord2: View {
  @State private var Navigation: Bool = false
  @State private var isChoZen: Bool = false
  @State private var isChoGo: Bool = false
  @State private var isHiruZen: Bool = false
  @State private var isHiruGo: Bool = false
  @State private var isYuZen: Bool = false
  @State private var isYuGo: Bool = false
  
  var body: some View {
    VStack {
      Form {
        if medicatioIOOut(index: 1, flag: 0) == 1 {
          Button(medicatioIOBool( index: 1, flag: 1 ) ? "O : 朝食前" : " - : 朝食前") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.1, green: 0.1, blue: 0.3))
          .foregroundColor(isChoZen ? .primary : .primary)
        }
        
        if medicatioIOOut(index: 2, flag: 0) == 1 {
          Button(medicatioIOBool( index: 2, flag: 1)  ? "O : 朝食後" : " - : 朝食後") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.1, green: 0.1, blue: 0.3))
          .foregroundColor(isChoGo ? .primary : .primary)
        }
        
        
        if medicatioIOOut(index: 3, flag: 0) == 1 {
          Button(medicatioIOBool( index: 3, flag: 1) ? "O : 昼食前" : " - : 昼食前") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.2, green: 0.2, blue: 0.1))
          .foregroundColor(isHiruZen ? .primary : .primary)
        }
        
        if medicatioIOOut(index: 4, flag: 0) == 1 {
          Button(medicatioIOBool( index: 4, flag: 1) ? "O : 昼食後" : " - : 昼食後") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.2, green: 0.2, blue: 0.1))
          .foregroundColor(isHiruGo ? .primary : .primary)

        }
        
        if medicatioIOOut(index: 5, flag: 0) == 1 {
          
          Button(medicatioIOBool( index: 5, flag: 1)  ? "O : 夕食前" : " - : 夕食前") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.2, green: 0.1, blue: 0.1))
          .foregroundColor(isYuZen ? .primary : .primary)
        }
        
        if medicatioIOOut(index: 6, flag: 0) == 1 {
          Button(medicatioIOBool( index: 6, flag: 1) ? "O : 夕食後" : " - : 夕食後") {
            isYuGo = medicatioIOBool( index: 6, flag: 1)
            if isYuGo {
              //                         stopPedometerUpdates()
              medicatioIOIn(index:6, flag: 1, value: 0)
            } else {
              //                         startPedometerUpdates()
              medicatioIOIn(index:6, flag: 1, value: 1)
            }
            isYuGo.toggle()
          }
          .font(.system(size: 20))
          .background(Color(red: 0.2, green: 0.1, blue: 0.1))
          .foregroundColor(isYuGo ? .primary : .primary)
        }
        
        if medicatioIOOut(index: 0, flag: 0) == 1 {
          Button(medicatioIOBool( index: 0, flag: 1 ) ? "O : 夜寝前" : " - : 夜寝前") {
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
          .font(.system(size: 20))
          .background(Color(red: 0.2, green: 0.2, blue: 0.2))
          .foregroundColor(Navigation ? .primary : .primary)
        }
        
        
      }
    }
//    .padding()
  }
}
  
#Preview {
  ChildViewRecord2()
}
