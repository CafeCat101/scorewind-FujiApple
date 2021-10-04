//
//  LessonView.swift
//  LessonView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct LessonView: View {
	@State private var isCurrentView = true
	@State private var lessonTest = "1"
	
	var body: some View {
		if self.isCurrentView == true{
			VStack{
				Text("lesson page \(self.lessonTest)")
				Spacer()
				Button("to next lesson"){
					//withAnimation{
						if self.lessonTest == "1" {
							self.lessonTest = "2"
						}else{
							self.lessonTest = "1"
						}
					//}
				}
				Button("to course view"){
					withAnimation{
						self.isCurrentView = false
					}
				}
			}
			.frame(maxWidth:.infinity)
			//.transition(.scale)
			
		}else{
			CourseView()
				.transition(AnyTransition.move(edge: .bottom))
		}
			
	}
}

struct LessonView_Previews: PreviewProvider {
	static var previews: some View {
		LessonView()
	}
}
