//
//  DatePickerView.swift
//  JO-PARIS-2024
//
//  Created by M on 05/07/2023.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var date = Date()
    
    var body: some View {
        DatePicker (
            "",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date]
        ).labelsHidden()
        
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
