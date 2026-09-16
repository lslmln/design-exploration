//
//  DuolingoCheckoutComparison.swift
//
//  Three iOS checkout/cart flows restyled into Duolingo's design system, for side-by-side
//  comparison — the multi-brand-by-default behavior of the restyle-mobbin skill:
//
//   - Etsy's cart:        https://mobbin.com/flows/b91fe80b-ba7a-47ae-b394-011b48d23209
//   - Under Armour's bag: https://mobbin.com/flows/eab13d90-ca43-4141-80ee-849aabe60726
//   - IKEA's checkout:    https://mobbin.com/flows/dbc9c0e8-c87f-4b64-bb52-fe180f7c141c
//
//  Restyled using design-tokens/ios-apps/misc/duolingo/DESIGN.md (colors, type scale) and
//  reusing real components documented in the sibling DESIGN-swiftui.md — DuoPrimaryButton and
//  AnswerTile are copied from that file's own author-written implementation, not reinvented here.
//
//  GAP FLAGGED: Duolingo has zero commerce/checkout vocabulary in its design system — no cart,
//  payment, or price-row components, since it's a gamified language app with no e-commerce
//  surface. Every layout below is improvised from primitives (rows, dividers) or repurposed from
//  an unrelated real component: the free-shipping progress bar reuses Duolingo's lesson-progress
//  bar exactly, Under Armour's reward points reuse the HUD-chip pattern, and IKEA's pickup-location
//  picker reuses AnswerTile's idle/selected states verbatim. None of this reads with the same
//  confidence as a documented commerce component, because none of it is one.
//
//  IMPORTANT — this file has NOT been compiled or previewed. Written by hand in a Claude Code
//  sandbox with no Swift toolchain and no macOS, so there is no way to verify it builds. Open in
//  Xcode (or a Swift Playground) to confirm before trusting it.
//
//  Typography note: Feather Bold / DIN Next Rounded Pro are proprietary and not bundled here.
//  Using the documented SF Pro Rounded fallback via `Font.duoRounded(_:weight:)` throughout —
//  for pixel-exact type, bundle the real TTFs per DESIGN-swiftui.md's font-registration notes.
//

import SwiftUI

// MARK: - Duolingo design tokens (design-tokens/ios-apps/misc/duolingo/DESIGN.md)

extension Color {
    static let duoFeatherGreen     = Color(red: 0.345, green: 0.800, blue: 0.008) // #58CC02
    static let duoMaskGreen        = Color(red: 0.537, green: 0.886, blue: 0.098) // #89E219
    static let duoButtonGreenLedge = Color(red: 0.345, green: 0.655, blue: 0.000) // #58A700
    static let duoSnow             = Color.white                                  // #FFFFFF
    static let duoPolar            = Color(red: 0.969, green: 0.969, blue: 0.969) // #F7F7F7
    static let duoSwan             = Color(red: 0.898, green: 0.898, blue: 0.898) // #E5E5E5
    static let duoEel              = Color(red: 0.294, green: 0.294, blue: 0.294) // #4B4B4B
    static let duoHare             = Color(red: 0.686, green: 0.686, blue: 0.686) // #AFAFAF
    static let duoMacawBlue        = Color(red: 0.110, green: 0.690, blue: 0.965) // #1CB0F6
    static let duoBeeYellow        = Color(red: 1.000, green: 0.784, blue: 0.000) // #FFC800
    static let duoTileSelectedFill   = Color(red: 0.867, green: 0.957, blue: 1.000) // #DDF4FF
    static let duoTileSelectedBorder = Color(red: 0.518, green: 0.847, blue: 1.000) // #84D8FF
}

extension Font {
    // Documented fallback per DESIGN-swiftui.md: SF Pro Rounded stands in for the proprietary
    // Feather Bold / DIN Next Rounded Pro faces until those TTFs are bundled.
    static func duoRounded(_ size: CGFloat, weight: Font.Weight = .bold) -> Font {
        .system(size: size, weight: weight, design: .rounded)
    }
}

// MARK: - Reused signature component: The 3D Primary Button (copied from DESIGN-swiftui.md)

struct DuoPrimaryButton: View {
    let title: String
    var variant: Variant = .primary
    let action: () -> Void

    enum Variant {
        case primary, neutral
        var topColor: Color { self == .primary ? .duoFeatherGreen : .duoSnow }
        var ledgeColor: Color { self == .primary ? .duoButtonGreenLedge : .duoSwan }
        var textColor: Color { self == .primary ? .white : .duoEel }
    }

    var body: some View {
        Button(action: action) {
            Text(title.uppercased())
                .font(.duoRounded(17, weight: .heavy))
                .tracking(0.4)
                .foregroundStyle(variant.textColor)
                .frame(maxWidth: .infinity, minHeight: 56)
                .background(
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 16).fill(variant.ledgeColor).offset(y: 4)
                        RoundedRectangle(cornerRadius: 16).fill(variant.topColor)
                            .overlay(
                                variant == .neutral
                                    ? RoundedRectangle(cornerRadius: 16).stroke(Color.duoSwan, lineWidth: 2)
                                    : nil
                            )
                    }
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Reused signature component: Answer Tile, repurposed as a selectable location card

struct DuoSelectableCard: View {
    let title: String
    let subtitle: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title).font(.duoRounded(16, weight: .bold)).foregroundStyle(Color.duoEel)
                    Text(subtitle).font(.duoRounded(13, weight: .medium)).foregroundStyle(Color.duoHare)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(Color.duoMacawBlue)
                }
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.duoTileSelectedFill : Color.duoSnow)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isSelected ? Color.duoTileSelectedBorder : Color.duoSwan, lineWidth: 2)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Etsy cart -> Duolingo

struct EtsyCartView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Your Cart").font(.duoRounded(28, weight: .bold)).foregroundStyle(Color.duoEel)

            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 12).fill(Color.duoSwan).frame(width: 64, height: 64)
                VStack(alignment: .leading, spacing: 4) {
                    Text("OUROBOROS Iron-On Patch").font(.duoRounded(16, weight: .medium)).foregroundStyle(Color.duoEel)
                    Text("Qty 1 · Red").font(.duoRounded(14, weight: .medium)).foregroundStyle(Color.duoHare)
                }
                Spacer()
                Text("$6.06").font(.duoRounded(18, weight: .bold)).foregroundStyle(Color.duoFeatherGreen)
            }

            // GAP: reuses Duolingo's lesson-progress-bar exactly, repurposed for shipping progress
            VStack(alignment: .leading, spacing: 6) {
                Text("Get free shipping when you spend $28.94 more")
                    .font(.duoRounded(13, weight: .medium)).foregroundStyle(Color.duoHare)
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule().fill(Color.duoSwan)
                        Capsule().fill(Color.duoMaskGreen).frame(width: geo.size.width * 0.24)
                    }
                }
                .frame(height: 12)
            }

            DuoPrimaryButton(title: "Apply coupon code", variant: .neutral) {}

            HStack {
                Text("Estimated total").font(.duoRounded(16, weight: .medium)).foregroundStyle(Color.duoEel)
                Spacer()
                Text("$6.06").font(.duoRounded(20, weight: .bold)).foregroundStyle(Color.duoEel)
            }

            DuoPrimaryButton(title: "Go to checkout", variant: .primary) {}
        }
        .padding(24)
        .background(Color.duoSnow)
    }
}

// MARK: - Under Armour bag -> Duolingo

struct UnderArmourBagView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Bag").font(.duoRounded(28, weight: .bold)).foregroundStyle(Color.duoEel)

            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 12).fill(Color.duoSwan).frame(width: 64, height: 64)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Men's UA Launch Unlined Shorts").font(.duoRounded(16, weight: .medium)).foregroundStyle(Color.duoEel)
                    Text("XL · Castlerock").font(.duoRounded(14, weight: .medium)).foregroundStyle(Color.duoHare)
                }
                Spacer()
                Text("$38.00").font(.duoRounded(18, weight: .bold)).foregroundStyle(Color.duoFeatherGreen)
            }

            // GAP: reuses Duolingo's HUD-chip pattern (icon + Feather-Bold number) for reward points
            HStack(spacing: 6) {
                Image(systemName: "diamond.fill").font(.system(size: 18, weight: .bold)).foregroundStyle(Color.duoBeeYellow)
                Text("Points you'll earn").font(.duoRounded(14, weight: .medium)).foregroundStyle(Color.duoEel)
                Spacer()
                Text("+190").font(.duoRounded(18, weight: .bold)).foregroundStyle(Color.duoBeeYellow)
            }
            .padding(.horizontal, 12).padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 500).fill(Color.duoPolar))

            VStack(spacing: 8) {
                HStack {
                    Text("Subtotal").font(.duoRounded(15, weight: .medium)).foregroundStyle(Color.duoHare)
                    Spacer()
                    Text("$38.00").font(.duoRounded(15, weight: .medium)).foregroundStyle(Color.duoEel)
                }
                HStack {
                    Text("Shipping").font(.duoRounded(15, weight: .medium)).foregroundStyle(Color.duoHare)
                    Spacer()
                    Text("$8.00").font(.duoRounded(15, weight: .medium)).foregroundStyle(Color.duoEel)
                }
                HStack {
                    Text("Estimated total").font(.duoRounded(16, weight: .bold)).foregroundStyle(Color.duoEel)
                    Spacer()
                    Text("$46.00").font(.duoRounded(20, weight: .bold)).foregroundStyle(Color.duoEel)
                }
            }

            DuoPrimaryButton(title: "Checkout", variant: .primary) {}
        }
        .padding(24)
        .background(Color.duoSnow)
    }
}

// MARK: - IKEA checkout -> Duolingo

struct IKEACheckoutView: View {
    @State private var selected = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Where would you like\nto pick up?")
                .font(.duoRounded(24, weight: .bold)).foregroundStyle(Color.duoEel)

            // GAP: reuses AnswerTile's idle/selected color states verbatim for location selection
            VStack(spacing: 12) {
                DuoSelectableCard(title: "IKEA East Palo Alto", subtitle: "1700 East Bayshore Road", isSelected: selected == 0) { selected = 0 }
                DuoSelectableCard(title: "IKEA Colma, CA Pick-up point", subtitle: "35 Colma Blvd.", isSelected: selected == 1) { selected = 1 }
                DuoSelectableCard(title: "IKEA Market Street", subtitle: "440 Stevenson Street", isSelected: selected == 2) { selected = 2 }
            }

            HStack {
                Text("Total").font(.duoRounded(16, weight: .bold)).foregroundStyle(Color.duoEel)
                Spacer()
                Text("$5.29").font(.duoRounded(20, weight: .bold)).foregroundStyle(Color.duoEel)
            }

            DuoPrimaryButton(title: "Continue", variant: .primary) {}
        }
        .padding(24)
        .background(Color.duoSnow)
    }
}

#Preview("Etsy Cart") { EtsyCartView() }
#Preview("Under Armour Bag") { UnderArmourBagView() }
#Preview("IKEA Checkout") { IKEACheckoutView() }
