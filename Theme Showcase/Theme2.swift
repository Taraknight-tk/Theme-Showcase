import SwiftUI
import UIKit

// MARK: - Theme
struct Theme {
    // Primary Colors
    static let creamBase = Color(red: 245/255, green: 240/255, blue: 232/255)   // #F5F0E8
    static let warmBeige = Color(red: 232/255, green: 223/255, blue: 211/255)  // #E8DFD3
    static let softTaupe = Color(red: 212/255, green: 199/255, blue: 184/255)  // #D4C7B8
    static let mediumTaupe = Color(red: 168/255, green: 155/255, blue: 142/255)// #A89B8E

    // Accent Colors
    static let sageGreen = Color(red: 127/255, green: 182/255, blue: 133/255)  // #7FB685
    static let deepSage = Color(red: 90/255, green: 155/255, blue: 97/255)     // #5A9B61
    static let oliveMist = Color(red: 155/255, green: 184/255, blue: 150/255)  // #9BB896

    // Level Indicator Colors (Muted Palette)
    static let level0Primary = Color(red: 127/255, green: 182/255, blue: 133/255) // #7FB685
    static let level0Background = Color(red: 232/255, green: 243/255, blue: 234/255) // #E8F3EA

    static let level1Primary = Color(red: 232/255, green: 217/255, blue: 181/255) // #E8D9B5
    static let level1Background = Color(red: 247/255, green: 243/255, blue: 232/255) // #F7F3E8
    static let level1Accent = Color(red: 212/255, green: 194/255, blue: 154/255) // #D4C29A

    static let level2Primary = Color(red: 227/255, green: 197/255, blue: 168/255) // #E3C5A8
    static let level2Background = Color(red: 231/255, green: 221/255, blue: 208/255) // ~#E7DDD0
    static let level2Accent = Color(red: 212/255, green: 172/255, blue: 143/255) // #D4AC8F

    static let level3Primary = Color(red: 212/255, green: 165/255, blue: 154/255) // #D4A59A
    static let level3Background = Color(red: 229/255, green: 210/255, blue: 203/255) // ~#E5D2CB
    static let level3Accent = Color(red: 197/255, green: 143/255, blue: 132/255) // #C58F84

    // Neutral Colors
    static let pureWhite = Color.white // #FFFFFF
    static let softWhite = Color(red: 253/255, green: 252/255, blue: 250/255) // #FDFCFA
    static let charcoalText = Color(red: 74/255, green: 69/255, blue: 64/255) // #4A4540
    static let mediumGrayText = Color(red: 107/255, green: 100/255, blue: 96/255) // #6B6460
    static let lightGrayText = Color(red: 155/255, green: 147/255, blue: 142/255) // #9B938E

    // Adaptive helpers
    static func adaptive(_ light: Color, _ dark: Color) -> Color {
        #if os(iOS)
        return Color(UIColor { trait in
            return UIColor(light: light, dark: dark, trait: trait)
        })
        #else
        return light
        #endif
    }

    // Semantic adaptive colors
    static var secondarySurface: Color { adaptive(warmBeige, Color(white: 0.15)) }
    static var appBackground: Color { adaptive(creamBase, Color.black.opacity(0.95)) }
    static var cardBackground: Color { adaptive(softWhite, Color(white: 0.12)) }
    static var primaryText: Color { adaptive(Color(red: 58/255, green: 53/255, blue: 48/255), Color(white: 0.92)) }
    static var secondaryText: Color { adaptive(mediumGrayText, Color(white: 0.7)) }

    // Typography
    struct Typography {
        static let largeTitle = Font.system(.largeTitle, design: .rounded).weight(.bold)
        static let title1 = Font.system(.title, design: .rounded).weight(.semibold)
        static let title2 = Font.system(.title2, design: .rounded).weight(.semibold)
        static let title3 = Font.system(.title3, design: .rounded).weight(.semibold)
        static let headline = Font.system(.headline, design: .rounded)
        static let subheadline = Font.system(.subheadline, design: .rounded)
        static let body = Font.system(.body, design: .rounded)
        static let callout = Font.system(.callout, design: .rounded)
        static let footnote = Font.system(.footnote, design: .rounded)
        static let caption = Font.system(.caption, design: .rounded)
    }

    // Metrics
    struct Metrics {
        // Spacing scale
        static let xxs: CGFloat = 4
        static let xs: CGFloat = 8
        static let sm: CGFloat = 12
        static let md: CGFloat = 16
        static let lg: CGFloat = 20
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32

        // Corner radii
        static let radiusSm: CGFloat = 8
        static let radiusMd: CGFloat = 10
        static let radiusLg: CGFloat = 12

        // Component heights
        static let buttonHeight: CGFloat = 48
        static let badgeSize: CGFloat = 40
        static let textEditorMinHeight: CGFloat = 120
    }
}

extension UIColor {
    convenience init(light: Color, dark: Color, trait: UITraitCollection) {
        let uiLight = UIColor(light)
        let uiDark = UIColor(dark)
        self.init(cgColor: (trait.userInterfaceStyle == .dark ? uiDark : uiLight).cgColor)
    }
}
import SwiftUI

extension View {
    func themedCardBackground(cornerRadius: CGFloat = Theme.Metrics.radiusLg) -> some View {
        self
            .background(Theme.cardBackground)
            .cornerRadius(cornerRadius)
    }
}

import SwiftUI
enum ThemedButtonKind { case primary, secondary, destructive }

struct ThemedButtonStyle: ButtonStyle {
    var kind: ThemedButtonKind = .primary

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Theme.Typography.body.weight(.semibold))
            .frame(maxWidth: .infinity)
            .frame(height: Theme.Metrics.buttonHeight)
            .foregroundColor(kind == .primary ? .white : (kind == .destructive ? .white : Theme.primaryText))
            .background(backgroundColor(isPressed: configuration.isPressed))
            .cornerRadius(Theme.Metrics.radiusLg)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }

    private func backgroundColor(isPressed: Bool) -> Color {
        switch kind {
        case .primary:
            return (isPressed ? Theme.deepSage : Theme.sageGreen)
        case .secondary:
            return Theme.secondarySurface
        case .destructive:
            return Color.red.opacity(isPressed ? 0.85 : 1.0)
        }
    }
}

struct ThemedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(Theme.Metrics.md)
            .background(Theme.secondarySurface)
            .cornerRadius(Theme.Metrics.radiusMd)
            .overlay(
                RoundedRectangle(cornerRadius: Theme.Metrics.radiusMd)
                    .stroke(Theme.softTaupe.opacity(0.6), lineWidth: 1)
            )
            .font(Theme.Typography.body)
            .foregroundColor(Theme.primaryText)
    }
}
