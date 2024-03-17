//
//  ContentView.swift
//  takenYourMedication Watch App
//
//  Created by 世吉 on 2024/03/14.
//


import SwiftUI

struct Medication{
    var ID: Int
    var Name: String
    var OnOff: Int
    var Flag: Int
    
//    init(name: String, Flag: Int) {
//        self.name = name
//        self.Flag = Flag
//    }
}



struct ContentView: View {

    var body: some View {
        VStack{
            NavigationStack {
                HStack{
                    
                    NavigationLink {
                        ChildViewSetUp()
                    } label: {
                        Text("設定へ")
                            .padding()
                    }
                    
                    NavigationLink {
                        ChildViewRecord()
                    } label: {
                        Text("記録へ")
                            .padding()
                    }
 
                }
                
                List {

                }

            }
        }
        .onAppear(){
        }
    }
}

#Preview {
    ContentView()
}




var  medicationData: [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]

func medicatioIOIn(index:Int, flag: Int, value: Int){
    medicationData[index*2+flag] = value
}

func medicatioIOOut( index: Int, flag: Int )->( Int ){
    return( medicationData[index*2+flag] )
}

func medicatioIOBool( index: Int, flag: Int )->( Bool ){
    if  medicationData[index*2+flag] == 1 {
        return( true )
    }else {
        return( false )
    }
        
}
