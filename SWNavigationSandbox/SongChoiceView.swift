//
//  SongChoiceView.swift
//  SongChoiceView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct SongChoiceView: View {
	@State private var isCurrentView = true
	@EnvironmentObject var wizardElement: WizardElement
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("Song choice")
				HStack{
					Button("Sure"){
						wizardElement.yesNoType = .songChoiceYes
						withAnimation{
							self.isCurrentView = false
						}
						
					}
					Button("Humm"){
						wizardElement.yesNoType = .songChoiceNo
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

struct SongChoiceView_Previews: PreviewProvider {
	static var previews: some View {
		SongChoiceView().environmentObject(WizardElement())
	}
}
