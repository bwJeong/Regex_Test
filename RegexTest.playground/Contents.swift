import UIKit

// **참고자료**
// https://www.youtube.com/watch?v=t3M6toIflyQ
// https://tngusmiso.tistory.com/62

let pattern = "(\\+82-10-\\d{4}-\\d{4})|(010-\\d{4}-\\d{4})|(010\\d{8})"
let str = "01054679988, 010-1234-4567, +82-10-2341-2834, 01023448865"

// MARK: - 해당 패턴에 해당하는 문자열이 있는지만을 확인하는 방법
if let _ = str.range(of: pattern, options: .regularExpression) {
    print("True!")
} else {
    print("False!")
}

// MARK: - 해당 패턴에 해당하는 모든 문자열을 확인하는 방법
do {
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    let matches = regex.matches(in: str, options: [], range: NSRange(location: 0, length: str.count))
    
    for match in matches {
        let range = Range(match.range, in: str)!
        
        print(str[range])
    }
} catch {
    print(error.localizedDescription)
}
