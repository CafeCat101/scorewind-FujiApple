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
	@State private var toViewName:Page = .wizard
	let screenSize: CGRect = UIScreen.main.bounds
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				/*Text("How about this song?")
					.font(.title2)*/
				Menu {
					Button("Start wizard", action: {
						self.toViewName = .wizard
						withAnimation{
							self.isCurrentView = false
						}
					})
					Button("My courses", action: {
						self.toViewName = .learn
						withAnimation{
							self.isCurrentView = false
						}
					})
				} label: {
					Text("How about this song?")
						.font(.title2)
						.foregroundColor(Color.black)
						
				}
				Text("[\(wizardElement.instrument)] [\(wizardElement.getPrettyCourseTypeName(courseType: wizardElement.courseType))]")
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.overlay(Text("Score viewer + player")
										.foregroundColor(Color.white))
				HStack{
					Button("Sure"){
						wizardElement.yesNoType = .songChoiceYes
						toViewName = .yesNoResult
						withAnimation{
							self.isCurrentView = false
						}
					}.frame(width: screenSize.width/3)
					Button("Humm"){
						wizardElement.yesNoType = .songChoiceNo
						toViewName = .yesNoResult
						withAnimation{
							self.isCurrentView = false
						}
					}.frame(width: screenSize.width/3)
				}
			}
		}else{
			if toViewName == .wizard {
				WizardView().transition(.scale)
			}else if toViewName == .learn {
				CourseForYouView().transition(.scale)
			}else{
				YesNoResultView()
					.transition(.scale)
			}
		}
		
	}
}

struct SongChoiceView_Previews: PreviewProvider {
	static var previews: some View {
		SongChoiceView().environmentObject(WizardElement())
	}
}
