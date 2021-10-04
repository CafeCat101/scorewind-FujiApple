//
//  CourseForYouView.swift
//  CourseForYouView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct CourseForYouView: View {
	@State private var isCurrentView = true
	@State private var toViewName = "Course"
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("course for you")
					.font(.title)
				Button("To course view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "Course"
					}
				}
				
				Button("To lesson view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "Lesson"
					}
				}
				Spacer()
				Button("To wizard view"){
					withAnimation{
						self.isCurrentView = false
						self.toViewName = "Wizard"
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
			default:
				WizardView()
					.transition(.scale)
			}
		}
		
	}
}

struct CourseForYouView_Previews: PreviewProvider {
	static var previews: some View {
		CourseForYouView()
	}
}
