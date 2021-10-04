//
//  CourseView.swift
//  CourseView
//
//  Created by Leonore Yardimli on 2021/10/3.
//

import SwiftUI

struct CourseView: View {
	@State private var isCurrentView = true
	@State private var startPos:CGPoint = .zero
	@State private var isSwipping = true
	
	var body: some View {
		if isCurrentView == true {
			VStack{
				Text("course page")
			}.gesture(
				DragGesture()
					.onChanged { gesture in
						if self.isSwipping {
							self.startPos = gesture.location
							self.isSwipping.toggle()
						}
						// onChange code
					}
					.onEnded { gesture in
						let xDist =  abs(gesture.location.x - self.startPos.x)
						let yDist =  abs(gesture.location.y - self.startPos.y)
						if self.startPos.y <  gesture.location.y && yDist > xDist {
							//self.direction = "Down"
							//self.color = Color.green.opacity(0.4)
						}
						else if self.startPos.y >  gesture.location.y && yDist > xDist {
							//self.direction = "Up"
							//self.color = Color.blue.opacity(0.4)
							//to next lesson
							withAnimation{
								self.isCurrentView = false
							}
						}
						else if self.startPos.x > gesture.location.x && yDist < xDist {
							//self.direction = "Left"
							//self.color = Color.yellow.opacity(0.4)
						}
						else if self.startPos.x < gesture.location.x && yDist < xDist {
							//self.direction = "Right"
							//self.color = Color.purple.opacity(0.4)
						}
						self.isSwipping.toggle()
						// onEnded code
					}
			)
		}else{
			LessonView()
				.transition(AnyTransition.move(edge: .bottom))
		}
		
	}
}

struct CourseView_Previews: PreviewProvider {
	static var previews: some View {
		CourseView()
	}
}
