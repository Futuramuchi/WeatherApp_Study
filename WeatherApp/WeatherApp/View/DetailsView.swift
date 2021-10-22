//
//  DetailsView.swift
//  WeatherApp
//
//  Created by user on 22.10.2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct DetailsView: View {
    @State var city: CityData
    @State var temp = ""
    @State var showAlert = false
    @State var showMessage = ""
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
            Text(city.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .onAppear(perform: {
                    let token = "41aec4693a1c4c13928105800213009"
                    let url = "https://api.weatherapi.com/v1/current.json?key=\(token)&q=\(city.name)&aqi=no"
                    AF.request(url, method: .get).validate()
                        .responseJSON {
                            response in switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                temp = json["current"]["temp_c"].stringValue
                                print("JSON: \(json)")
                            case .failure(let error):
                                showMessage = error.localizedDescription
                                showAlert.toggle()
                                print(error)
                            }
                        }
                })
                .padding()
            HStack {
                Text(temp == "" ? "0"  : temp)
                Text("градусов")
            }
        }
    }
    
    
    
    struct DetailsView_Previews: PreviewProvider {
        
        static var previews: some View {
            DetailsView(city: .init(name: ""))
        }
    }
}
