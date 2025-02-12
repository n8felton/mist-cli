//
//  DownloadInstallerOptions.swift
//  Mist
//
//  Created by Nindi Gill on 26/8/21.
//

import ArgumentParser

struct DownloadInstallerOptions: ParsableArguments {

    @Argument(help: """
    Specify a macOS name, version or build to download:
    * macOS Ventura
    * macOS Monterey
    * macOS Big Sur
    * macOS Catalina
    * macOS Mojave
    * macOS High Sierra
    * 13.x (macOS Ventura)
    * 12.x (macOS Monterey)
    * 11.x (macOS Big Sur)
    * 10.15.x (macOS Catalina)
    * 10.14.x (macOS Mojave)
    * 10.13.x (macOS High Sierra)
    * 22E (macOS Ventura 13.3.x)
    * 21G (macOS Monterey 12.6.x)
    * 20G (macOS Big Sur 11.7.x)
    * 19H (macOS Catalina 10.15.7)
    * 18G (macOS Mojave 10.14.6)
    * 17G (macOS High Sierra 10.13.6)
    Note: Specifying a macOS name will assume the latest version and build of that particular macOS.
    Note: Specifying a macOS version will assume the latest build of that particular macOS.
    """)
    var searchString: String

    @Argument(help: """
    Specify the requested output type(s):
    * application to generate a macOS Installer Application Bundle (.app).
    * image to generate a macOS Disk Image (.dmg).
    * iso to generate a Bootable macOS Disk Image (.iso), for use with virtualization software (ie. Parallels Desktop, VMware Fusion, VirtualBox).
    Note: This option will fail when targeting macOS Catalina 10.15 and older on Apple Silicon Macs.
    * package to generate a macOS Installer Package (.pkg).
    """)
    var outputType: [DownloadOutputType]

    @Flag(name: [.customShort("b"), .long], help: """
    Include beta macOS Installers in search results.
    """)
    var includeBetas: Bool = false

    @Flag(name: .long, help: """
    Only include macOS Installers that are compatible with this Mac in search results.
    """)
    var compatible: Bool = false

    @Option(name: .shortAndLong, help: """
    Override the default Software Update Catalog URLs.
    """)
    var catalogURL: String?

    @Flag(name: .long, help: """
    Cache downloaded files in the temporary downloads directory.
    """)
    var cacheDownloads: Bool = false

    @Flag(name: .shortAndLong, help: """
    Force overwriting existing macOS Downloads matching the provided filename(s).
    Note: Downloads will fail if an existing file is found and this flag is not provided.
    """)
    var force: Bool = false

    @Option(name: .long, help: """
    Specify the macOS Installer output filename. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    """)
    var applicationName: String = .filenameTemplate + ".app"

    @Option(name: .long, help: """
    Specify the macOS Disk Image output filename. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    """)
    var imageName: String = .filenameTemplate + ".dmg"

    @Option(name: .long, help: """
    Codesign the exported macOS Disk Image (.dmg).
    Specify a signing identity name, eg. "Developer ID Application: Name (Team ID)".
    """)
    var imageSigningIdentity: String?

    @Option(name: .long, help: """
    Specify the Bootable macOS Disk Image output filename. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    """)
    var isoName: String = .filenameTemplate + ".iso"

    @Option(name: .long, help: """
    Specify the macOS Installer Package output filename. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    """)
    var packageName: String = .filenameTemplate + ".pkg"

    @Option(name: .long, help: """
    Specify the macOS Installer Package identifier. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    * Spaces will be replaced with hyphens -
    """)
    var packageIdentifier: String = .packageIdentifierTemplate

    @Option(name: .long, help: """
    Codesign the exported macOS Installer Package (.pkg).
    Specify a signing identity name, eg. "Developer ID Installer: Name (Team ID)".
    """)
    var packageSigningIdentity: String?

    @Option(name: .long, help: """
    Specify a keychain path to search for signing identities.
    Note: If no keychain is specified, the default user login keychain will be used.
    """)
    var keychain: String?

    @Option(name: .shortAndLong, help: """
    Specify the output directory. The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    Note: Parent directories will be created automatically.
    """)
    var outputDirectory: String = .outputDirectory

    @Option(name: .shortAndLong, help: """
    Specify the temporary downloads directory.
    Note: Parent directories will be created automatically.
    """)
    var temporaryDirectory: String = .temporaryDirectory

    @Option(name: [.customShort("e"), .customLong("export")], help: """
    Specify the path to export the download results to one of the following formats:
    * /path/to/export.json (JSON file)
    * /path/to/export.plist (Property List file)
    * /path/to/export.yaml (YAML file)
    The following variables will be dynamically substituted:
    * %NAME% will be replaced with 'macOS Monterey'
    * %VERSION% will be replaced with '12.0'
    * %BUILD% will be replaced with '21A5304g'
    Note: The file extension will determine the output file format.
    Note: Parent directories will be created automatically.
    """)
    var exportPath: String?

    @Flag(name: .long, help: """
    Remove all ANSI escape sequences (ie. strip all color and formatting) from standard output.
    """)
    var noAnsi: Bool = false

    @Option(name: .long, help: """
    Number of times to attempt resuming a download before failing.
    """)
    var retries: Int = 10

    @Option(name: .long, help: """
    Number of seconds to wait before attempting to resume a download.
    """)
    var retryDelay: Int = 30

    @Flag(name: .shortAndLong, help: """
    Suppress verbose output.
    """)
    var quiet: Bool = false
}
