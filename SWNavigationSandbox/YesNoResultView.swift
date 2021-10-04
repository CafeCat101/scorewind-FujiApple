//
//  YesNoResultView.swift
//  YesNoResultView
//
//  Created by Leonore Yardimli on 2021/10/4.
//

import SwiftUI

struct YesNoResultView: View {
	@State private var isCurrentView = true
	@State private var toViewName = "CourseType"
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("yes no result")
					.font(.title)
				Button("Got to course view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "Course"
					}
				}
				
				Button("Go to lesson view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "Lesson"
					}
				}
				
				Button("Got to course type"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "CourseType"
					}
				}
				
				Button("Go to song choice"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "SongChoice"
					}
					
				}
				
				Button("Go to read score ability"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "ReadScoreAbility"
					}
				}
			}
		}else{
			switch self.toViewName{
			case "Course":
				CourseView()
					.transition(.scale)
			case "Lesson":
				LessonView()
					.transition(.scale)
			case "CourseType":
				CourseTypeView()
					.transition(.scale)
			case "SongChoice":
				SongChoiceView()
					.transition(.scale)
			case "ReadScoreAbility":
				ReadScoreAbilityView()
					.transition(.scale)
			default:
				WizardView()
					.transition(.scale)
			}
		}
		
	}
}

struct YesNoResultView_Previews: PreviewProvider {
	static var previews: some View {
		YesNoResultView()
	}
}
