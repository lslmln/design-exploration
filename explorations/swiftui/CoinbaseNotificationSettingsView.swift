//
//  CoinbaseNotificationSettingsView.swift
//
//  Restyled from Kraken's iOS notification settings screen:
//  https://mobbin.com/screens/ebe41637-082d-41bc-b937-ede3ae62f488
//  into Coinbase's design system (design.md/coinbase-DESIGN.md).
//
//  IMPORTANT — this file has NOT been compiled or previewed. It was written by hand in a
//  Claude Code sandbox with no Swift toolchain and no macOS available, so there is no way to
//  verify it builds from within that environment. Open this in Xcode (or paste it into a Swift
//  Playground) before trusting it — that is the only place it can actually be checked.
//
//  Typography note: Coinbase's real typefaces (CoinbaseDisplay/CoinbaseSans) are licensed and
//  not available as system fonts. This file uses `.system(...)` everywhere so it compiles with
//  zero bundled assets. For pixel-exact type, add the documented substitute (Inter) as a font
//  file to the Xcode target and register it in Info.plist, then swap `.system(size:weight:)`
//  for `.custom("Inter", size:)` / `.custom("Inter-SemiBold", size:)` at each call site below.
//
//  Component note: the Figma version of this screen had to hand-build a toggle switch from a
//  pill track + circular knob, because Coinbase's tokens document no toggle component and the
//  Figma Plugin API has no native switch primitive. SwiftUI does have a real native `Toggle` —
//  used here instead of re-improvising, just tinted to Coinbase Blue.
//

import SwiftUI

// MARK: - Coinbase design tokens (design.md/coinbase-DESIGN.md)

extension Color {
    init(hex: UInt32) {
        let r = Double((hex >> 16) & 0xFF) / 255
        let g = Double((hex >> 8) & 0xFF) / 255
        let b = Double(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

enum CoinbaseToken {
    static let primary = Color(hex: 0x0052FF)
    static let ink = Color(hex: 0x0A0B0D)
    static let body = Color(hex: 0x5B616E)
    static let hairline = Color(hex: 0xDEE1E6)
    static let canvas = Color.white

    // typography.title-lg: 32 / 400 / -0.4px letter-spacing (CoinbaseSans -> Inter substitute)
    static let titleLg = Font.system(size: 32, weight: .regular)
    // typography.title-sm: 16 / 600
    static let titleSm = Font.system(size: 16, weight: .semibold)
    // typography.body-sm: 14 / 400
    static let bodySm = Font.system(size: 14, weight: .regular)
}

// MARK: - Reusable notification row

struct NotificationRow: View {
    let title: String
    let description: String
    @Binding var isOn: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(CoinbaseToken.titleSm)
                    .foregroundColor(CoinbaseToken.ink)
                Text(description)
                    .font(CoinbaseToken.bodySm)
                    .foregroundColor(CoinbaseToken.body)
            }
            Spacer()
            Toggle("", isOn: $isOn)
                .labelsHidden()
                .tint(CoinbaseToken.primary)
        }
    }
}

// MARK: - Section label

struct SectionLabel: View {
    let text: String

    var body: some View {
        Text(text)
            .font(CoinbaseToken.titleSm)
            .foregroundColor(CoinbaseToken.ink)
    }
}

// MARK: - Hairline divider
// A plain `Divider()` renders using the current foreground style, so tinting it reliably needs a
// manual filled rectangle rather than `.background(_:)` on the Divider itself.

struct HairlineDivider: View {
    var body: some View {
        Rectangle()
            .fill(CoinbaseToken.hairline)
            .frame(height: 1)
    }
}

// MARK: - Main screen

struct CoinbaseNotificationSettingsView: View {
    @State private var tradingAlert = true
    @State private var fundingAlert = true
    @State private var criticalUpdates = false
    @State private var watchlistAlert = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Notifications")
                    .font(CoinbaseToken.titleLg)
                    .foregroundColor(CoinbaseToken.ink)

                SectionLabel(text: "Account activity")

                NotificationRow(
                    title: "Trading alert",
                    description: "Trades, portfolio updates, staking, and rewards earned.",
                    isOn: $tradingAlert
                )
                HairlineDivider()

                NotificationRow(
                    title: "Funding alert",
                    description: "Deposits or withdrawals processed in your account.",
                    isOn: $fundingAlert
                )
                HairlineDivider()

                NotificationRow(
                    title: "Critical updates",
                    description: "Regulatory and security-related actions on your account.",
                    isOn: $criticalUpdates
                )

                SectionLabel(text: "Price alerts")
                HairlineDivider()

                NotificationRow(
                    title: "Watchlist alert",
                    description: "Significant changes to assets in your watchlist.",
                    isOn: $watchlistAlert
                )
            }
            .padding(32)
        }
        .background(CoinbaseToken.canvas)
    }
}

#Preview {
    CoinbaseNotificationSettingsView()
}
