//
//  WizardElement.swift
//  WizardElement
//
//  Created by Leonore Yardimli on 2021/10/5.
//

import Foundation

class WizardElement: ObservableObject{
	@Published var instrument = "guitar" //guitar or violin or piano
	@Published var courseType:CourseType = .path
	@Published var yesNoType: YesNoType = .readScoreAbilityNo
	
	func getPrettyCourseTypeName(courseType: CourseType)->String {
		if courseType == .path{
			return "Path"
		}else{
			return "Step by step"
		}
	}
}
