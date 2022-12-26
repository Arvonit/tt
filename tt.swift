import Foundation

if CommandLine.argc <= 1 {
    print("Usage: tt <file>")
    exit(1)
}

let fm = FileManager.default
var trashedPath: NSURL!
var exitCode = 0

for i in 1..<CommandLine.arguments.count {
    let argument = CommandLine.arguments[i]
    if argument.starts(with: "--") || argument.starts(with: "-") {
        print("Usage: tt <file>")
        exit(1)
    }

    let filePath = URL(fileURLWithPath: argument)
    if !fm.fileExists(atPath: filePath.path()) {
        print("tt: \(argument): No such file or directory")
        exitCode = 1
        continue
    }

    do {
        try fm.trashItem(at: filePath, resultingItemURL: &trashedPath)
    } catch {
        print("tt: \(error)")
    }
}

exit(Int32(exitCode))
