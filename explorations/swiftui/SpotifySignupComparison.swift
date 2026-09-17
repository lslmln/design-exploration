//
//  SpotifySignupComparison.swift
//
//  Three iOS sign-up/account-creation flows restyled into Spotify's design system, for
//  side-by-side comparison — the multi-brand-by-default behavior of the design-exploration skill:
//
//   - Klarna's "Creating an account":   https://mobbin.com/flows/21001ba9-0cb7-4eb2-9f4f-83b030d02029
//   - Photoroom's "Creating an account": https://mobbin.com/flows/78a00926-ecaa-401f-ad9d-7a69ef449ba3
//   - Woolworths' "Onboarding" (verify step): https://mobbin.com/flows/07c45373-1c90-4fdb-9378-9e55c04eeaf0
//
//  Restyled using design.md/ios-apps/music/spotify/DESIGN.md (colors, type, component specs) and
//  reusing the Color/Font extensions and SpotifyPillButton pattern documented in the sibling
//  DESIGN-swiftui.md, rather than inventing a parallel token set.
//
//  GAP FLAGGED: Spotify's own search-bar input style and primary pill CTA are genuine matches —
//  both are real, documented components. But Spotify has no "continue with Google/Apple/Facebook"
//  OAuth button component (account creation in the real app doesn't use third-party button stacks),
//  so Photoroom's social buttons below are improvised from the filled/outline pill pattern, not a
//  real documented component. Woolworths' step-progress bar is likewise invented — Spotify's only
//  real progress indicator is the Now Playing scrubber, repurposed here at a thinner scale.
//
//  IMPORTANT — this file has NOT been compiled or previewed. Written by hand in a Claude Code
//  sandbox with no Swift toolchain and no macOS, so there is no way to verify it builds. Open in
//  Xcode (File > Open, then Editor > Canvas for the #Preview below) to confirm before trusting it.
//
//  Typography note: Spotify Mix is proprietary and not bundled here. Using the documented fallback
//  stack from DESIGN.md via `Font.spotify(_:weight:)` (system font, default design) throughout —
//  for pixel-exact type, bundle the real Spotify Mix TTFs per DESIGN-swiftui.md's font-registration notes.
//

import SwiftUI

// MARK: - Spotify design tokens (design.md/ios-apps/music/spotify/DESIGN.md, DESIGN-swiftui.md)

extension Color {
    static let spotifyCanvas        = Color(red: 0.071, green: 0.071, blue: 0.071) // #121212
    static let spotifySurface2      = Color(red: 0.157, green: 0.157, blue: 0.157) // #282828
    static let spotifyDivider       = Color(red: 0.165, green: 0.165, blue: 0.165) // #2A2A2A
    static let spotifyTextSecondary = Color(red: 0.702, green: 0.702, blue: 0.702) // #B3B3B3
    static let spotifyTextTertiary  = Color(red: 0.416, green: 0.416, blue: 0.416) // #6A6A6A
    static let spotifyGreen         = Color(red: 0.114, green: 0.725, blue: 0.329) // #1DB954
}

extension Font {
    // Documented fallback per DESIGN.md's own font-substitution note: Spotify Mix is proprietary,
    // falls back to the system font at default design (not .rounded — that's this repo's Duolingo
    // convention, not Spotify's).
    static func spotify(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        .system(size: size, weight: weight, design: .default)
    }
}

// MARK: - Reused signature component: Primary Pill CTA (copied from DESIGN-swiftui.md's SpotifyPillButton)

struct SpotifyPillButton: View {
    let title: String
    var style: Style = .filled
    let action: () -> Void

    enum Style { case filled, outline }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.spotify(16, weight: .bold))
                .foregroundStyle(style == .filled ? .black : .white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Capsule().fill(style == .filled ? Color.spotifyGreen : .clear))
                .overlay(
                    Capsule().strokeBorder(style == .outline ? Color.spotifyTextSecondary : .clear, lineWidth: 1)
                )
        }
    }
}

// MARK: - Reused input style: Search Bar spec (white fill, 44pt, 6pt radius) repurposed for text entry

struct SpotifyTextField: View {
    let label: String
    let placeholder: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label.uppercased())
                .font(.spotify(12, weight: .semibold))
                .foregroundStyle(Color.spotifyTextSecondary)
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.spotify(16))
            .foregroundStyle(Color.spotifyCanvas)
            .padding(.horizontal, 12)
            .frame(height: 44)
            .background(RoundedRectangle(cornerRadius: 6).fill(.white))
            .keyboardType(keyboardType)
        }
    }
}

// MARK: - Klarna's account form -> Spotify

struct KlarnaSignupView: View {
    @State private var email = ""
    @State private var phone = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Create your account")
                .font(.spotify(28, weight: .bold))
                .foregroundStyle(.white)
            Text("We'll send a code to verify it's you.")
                .font(.spotify(15))
                .foregroundStyle(Color.spotifyTextSecondary)
                .padding(.bottom, 12)

            SpotifyTextField(label: "Email address", placeholder: "you@example.com", keyboardType: .emailAddress, text: $email)
            SpotifyTextField(label: "Phone number", placeholder: "(650) 000-0000", keyboardType: .phonePad, text: $phone)

            SpotifyPillButton(title: "Sign up", action: {})
                .padding(.top, 4)

            Text("By continuing, you agree to Spotify's Terms and Privacy Policy.")
                .font(.spotify(12))
                .foregroundStyle(Color.spotifyTextTertiary)
                .padding(.top, 8)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.spotifyCanvas)
    }
}

// MARK: - Photoroom's social sign-up -> Spotify (GAP: OAuth buttons improvised, not a real Spotify component)

struct PhotoroomSignupView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.spotifyGreen)
                .frame(width: 48, height: 48)
                .padding(.bottom, 8)

            Text("Create your account")
                .font(.spotify(24, weight: .bold))
                .foregroundStyle(.white)
            Text("Sign up to save playlists and pick up where you left off.")
                .font(.spotify(14))
                .foregroundStyle(Color.spotifyTextSecondary)
                .padding(.bottom, 16)

            SpotifyPillButton(title: "Continue with Google", style: .filled, action: {})
            SpotifyPillButton(title: "Continue with Apple", style: .outline, action: {})
            SpotifyPillButton(title: "Continue with Facebook", style: .outline, action: {})
            SpotifyPillButton(title: "Continue with Email", style: .outline, action: {})

            Text("By continuing, you agree to Spotify's Terms and acknowledge you've read our Privacy Policy.")
                .font(.spotify(12))
                .foregroundStyle(Color.spotifyTextTertiary)
                .padding(.top, 8)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.spotifyCanvas)
    }
}

// MARK: - Woolworths' verify step -> Spotify (GAP: step-progress bar improvised from the scrubber)

struct WoolworthsVerifyView: View {
    @State private var code = ""

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Verify your email")
                    .font(.spotify(13, weight: .semibold))
                    .foregroundStyle(Color.spotifyTextSecondary)
                Spacer()
                Text("2 of 2")
                    .font(.spotify(13, weight: .semibold))
                    .foregroundStyle(Color.spotifyTextSecondary)
            }
            Capsule().fill(Color.spotifyGreen).frame(height: 4)

            VStack(spacing: 8) {
                Text("Enter your code")
                    .font(.spotify(24, weight: .bold))
                    .foregroundStyle(.white)
                Text("We've sent a verification code to your email")
                    .font(.spotify(14))
                    .foregroundStyle(Color.spotifyTextSecondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 12)

            TextField("• • • • • •", text: $code)
                .font(.spotify(18, weight: .semibold))
                .foregroundStyle(Color.spotifyCanvas)
                .multilineTextAlignment(.center)
                .frame(height: 44)
                .background(RoundedRectangle(cornerRadius: 6).fill(.white))
                .keyboardType(.numberPad)

            SpotifyPillButton(title: "Create account", action: {})

            Button("Send a new code", action: {})
                .font(.spotify(13, weight: .semibold))
                .foregroundStyle(Color.spotifyGreen)
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.spotifyCanvas)
    }
}

#Preview {
    KlarnaSignupView()
}

#Preview {
    PhotoroomSignupView()
}

#Preview {
    WoolworthsVerifyView()
}
