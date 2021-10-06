//
//  CourseTypeView.swift
//  CourseTypeView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct CourseTypeView: View {
	@State private var isCurrentView = true
	@State private var toViewName:Page = .wizard
	@EnvironmentObject var wizardElement: WizardElement
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("choose course type")
					.font(.title2)
				Text("[\(wizardElement.instrument)]")
				Spacer()
				Button("Path"){
					wizardElement.courseType = .path
					self.toViewName = .readScoreAbility
					withAnimation{
						self.isCurrentView = false
					}
					
				}
				Button("Setp by Step"){
					wizardElement.courseType = .setByStep
					self.toViewName = .readScoreAbility
					withAnimation{
						self.isCurrentView = false
					}
				}
				Spacer()
				Button("Switch instrument"){
					self.toViewName = .wizard
					withAnimation{
						self.isCurrentView = false
					}
				}
			}
		}else{
			if self.toViewName == .wizard{
				WizardView()
					.transition(.scale)
			}else{
				ReadScoreAbilityView()
					.transition(.scale)
			}
			
		}
		
	}
}

struct CourseTypeView_Previews: PreviewProvider {
	static var previews: some View {
		CourseTypeView().environmentObject(WizardElement())
	}
}
