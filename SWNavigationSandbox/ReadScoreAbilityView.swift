//
//  ReadScoreAbilityView.swift
//  ReadScoreAbilityView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct ReadScoreAbilityView: View {
	@State private var isCurrentView = true
	var body: some View {
		if self.isCurrentView == true{
			VStack{
				Text("read score ability")
				HStack{
					Button("Yes"){
						withAnimation{
							self.isCurrentView = false
						}
						
					}
					Button("No"){
						withAnimation{
							self.isCurrentView = false
						}
						
					}
				}
			}
		}else{
			YesNoResultView()
				.transition(.scale)
		}
		
	}
}

struct ReadScoreAbilityView_Previews: PreviewProvider {
	static var previews: some View {
		ReadScoreAbilityView()
	}
}
