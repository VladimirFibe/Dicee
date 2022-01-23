//
//  HomeView.swift
//  VTB bank
//
//  Created by Булат on 21.01.2022.
//

import SwiftUI

struct Money: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Деньги и счета")
        .font(.custom("Roboto-Medium", size: 22))
      Text("Рублёвый")
        .foregroundColor(Color("MoneyColor"))
      Text("10 000 ₽")
        .font(.custom("Roboto-Medium", size: 20))
      Text("Рублёвый")
        .foregroundColor(Color("MoneyColor"))
      Text("10 000 ₽")
        .font(.custom("Roboto-Medium", size: 20))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    Money()
  }
}
