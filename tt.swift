import Foundation

if CommandLine.argc <= 1 {
    print("Usage: tt <file>")
    exit(1)
}

let fm = FileManager.default
let cwd = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
var trashedPath: NSURL!

for i: Int in 1..<CommandLine.arguments.count {
    let argument = CommandLine.arguments[i]
    if argument.starts(with: "--") || argument.starts(with: "-") {
        print("Usage: tt <file>")
        exit(1)
    }

    let filePath = URL(fileURLWithPath: argument, relativeTo: cwd)

    do {
        try fm.trashItem(at: filePath, resultingItemURL: &trashedPath)   
    } catch {
        print("tt: \(argument): No such file or directory")
    }
}
