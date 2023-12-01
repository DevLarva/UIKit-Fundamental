//
//  AuthManager.swift
//  Spotify_UIKit
//
//  Created by 백대홍 on 11/29/23.
//

import Foundation


final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "b78b9eec7cfb4b9e904d3e2f63103e58"
        static let clientSecret = "a8b366d65aff4a469823e5d2748af4f4"
    }
    
    private init() {}
    
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://daebong-monk.tistory.com"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
