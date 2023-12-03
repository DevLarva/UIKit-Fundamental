//
//  AuthResponse.swift
//  Spotify_UIKit
//
//  Created by 백대홍 on 12/4/23.
//

import Foundation


struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String
    let scope: String
    let token_type: String
}
