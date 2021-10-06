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
	let screenSize: CGRect = UIScreen.main.bounds
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("How about this song?")
					.font(.title2)
				Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))]")
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.overlay(Text("Score viewer + player")
										.foregroundColor(Color.white))
				HStack{
					Button("Sure"){
						wizardElement.yesNoType = .songChoiceYes
						withAnimation{
							self.isCurrentView = false
						}
					}.frame(width: screenSize.width/3)
					Button("Humm"){
						wizardElement.yesNoType = .songChoiceNo
						withAnimation{
							self.isCurrentView = false
						}
					}.frame(width: screenSize.width/3)
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
