//
//  String+mapboxCacheDBPath.swift
//  GeographyClass
//
//  Copyright © 2021 ePi Rational, Inc.. All rights reserved.
//

import Foundation

/// Usage
/**
 ```
print("# Use this log output to open the folder to `cache.db` in macOS Finder")
print("  open \"\(NSHomeDirectory().mapboxCacheDBPath)\"")
```
 */
extension String {

    /// Returns the path to either the user’s or application’s home directory
    static let HOME_DIRECTORY = NSHomeDirectory()
    
    /// Application Path & Bundle Identifier
    static let APPLICATION_SUPPORT_PATH = "/Library/Application Support/\(Bundle.main.bundleIdentifier ?? "bundleIdentifier")"
    
    /// Hidden folder of path to `cache.db`
    static let CACHE_DB_PATH = "/.mapbox"

    /// String extension to print out path information to the Mapbox `cache.db`.
    /// To open the cache database on macOS, use
    /// [DB Browser for SQLite](https://sqlitebrowser.org),  *an open source, freeware visual tool used to create, design and edit SQLite database files.*
    var mapboxCacheDBPath: String { return .HOME_DIRECTORY + .APPLICATION_SUPPORT_PATH + .CACHE_DB_PATH}
}
