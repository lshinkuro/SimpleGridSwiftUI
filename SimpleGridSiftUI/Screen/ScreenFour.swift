//
//  ScrrenFour.swift
//  SimpleGridSiftUI
//
//  Created by nur kholis on 18/12/22.
//

import SwiftUI

struct ScreenFour: View {
    
    @State var otpText: String = ""
    
    @FocusState var isKeyboardShowing: Bool
    
    var body: some View {
        VStack {
            Text("Verify OTP").font(.largeTitle.bold()).frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                ForEach(0..<6, id: \.self) { index in
                    OTPTextBox(index)
                }
            }
            .background(content: {
                TextField("", text: $otpText.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
            .contentShape(Rectangle())
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.bottom, 20)
            .padding(.top, 10)
            
            Button {
                
            } label: {
                Text("Verify")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.red)
                    }
            }.disableWithOpacity(otpText.count < 6)

        }
        .padding(.all)
        .frame(maxWidth: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }.frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        
    }
    
    // - MARK otp text box
    @ViewBuilder
    func OTPTextBox(_ index: Int) ->  some View {
        ZStack {
            if otpText.count >  index {
                /// -  Finding char at index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text("")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(status ? .black :.gray, lineWidth: status ? 1.0 : 0.5)
                .animation(.easeIn(duration: 0.2), value: status)
        }.frame(maxWidth: .infinity)
    }
}

struct ScrrenFour_Previews: PreviewProvider {
    static var previews: some View {
        ScreenFour()
    }
}

extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self.disabled(condition)
            .opacity(condition ? 0.6 : 1.0)
    }
}

// - MARK binding <String> Extension

extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
