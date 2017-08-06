//
//  DateUtil.swift
//  photo-share
//
//  Created by Lukasz on 31/07/2017.
//  Copyright © 2017 candy bar code. All rights reserved.
//

import Foundation

class DateUtil {
	static var formatter: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .long
		return dateFormatter
	}()
    
    static func shorten(date: Date) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: date)
    }
}
