//
//  ChildView3.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2025/01/14.
//
/* --------------------------------------------------------------
 dayIndex　今日:0　昨日:1　一昨日:2
 index　寝前:0　朝食前:1　朝食後:2　昼食前:3　昼食後:4　夕食前:5　夕食後:6
 flag   指定:0　記録:1
 value  クリヤ:0　セット:1
 
 ----------------------------------------------------------------*/

import SwiftUI

struct ChildViewPrint2: View {
    var body: some View {
        let stri = medicationDataPrint()
        
        VStack{
            List {
                Text("\(stri)")
                    .font(.system(size: 16))
            }
        }
    }
}

#Preview {
    ChildViewPrint2()
}
