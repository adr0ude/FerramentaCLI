import Foundation

func countWords(in filePath: String) -> Int? {
    guard let content = try? String(contentsOfFile: filePath) else { 
        return nil 
    }
    return content.split { $0.isWhitespace }.count
}

func searchWord(in filePath: String, word: String) -> Int? {
    guard let content = try? String(contentsOfFile: filePath) else { 
        return nil 
    }
    return content.components(separatedBy: word).count - 1
}

func replaceWord(in filePath: String, target: String, replacement: String) -> Bool {
    guard var content = try? String(contentsOfFile: filePath) else { 
        return false 
    }
    content = content.replacingOccurrences(of: target, with: replacement)

    do {
        try content.write(toFile: filePath, atomically: true, encoding: .utf8)
        return true
    } catch {
        return false
    }
}

func sortWords(in filePath: String) {
    guard let content = try? String(contentsOfFile: filePath) else {
        print("Erro ao ler o arquivo.")
        return
    }

    let words = content.split { $0.isWhitespace }.map { String($0) }
    let sortedWords = words.sorted {
        $0.localizedStandardCompare($1) == .orderedAscending
    }
    //imprime o conteúdo, sem modificar o arquivo original
    print("Conteúdo ordenado:")
    for word in sortedWords {
        print(word)
    }
}

func printContent(in filePath: String) {
    guard let content = try? String(contentsOfFile: filePath) else {
        print("Erro ao ler o arquivo.")
        return
    }
    print("Conteúdo do arquivo:")
    print(content)
}

func main() {
    let arguments = CommandLine.arguments
    guard arguments.count > 2 else {
        print("Uso: swift main.swift <operação> <caminho_do_arquivo> [opções]")
        return
    }

    let operation = arguments[1]
    let filePath = arguments[2]

    switch operation {
    case "count":
        if let wordCount = countWords(in: filePath) {
            print("Contagem de palavras: \(wordCount)")
        } else {
            print("Erro ao ler o arquivo.")
        }
    case "search":
        guard arguments.count > 3 else {
            print("Uso: swift main.swift search <caminho_do_arquivo> <palavra>")
            return
        }
        let word = arguments[3]
        if let occurrences = searchWord(in: filePath, word: word) {
            print("Ocorrências da palavra '\(word)': \(occurrences)")
        } else {
            print("Erro ao ler o arquivo.")
        }
    case "replace":
        guard arguments.count > 4 else {
            print("Uso: swift main.swift replace <caminho_do_arquivo> <palavra_antiga> <palavra_nova>")
            return
        }
        let target = arguments[3]
        let replacement = arguments[4]
        if replaceWord(in: filePath, target: target, replacement: replacement) {
            print("Substituição bem-sucedida.")
        } else {
            print("Erro ao substituir no arquivo.")
        }
    case "sort":
        sortWords(in: filePath)
    case "print":
        printContent(in: filePath)
    default:
        print("Operação desconhecida.")
    }
}

main()
