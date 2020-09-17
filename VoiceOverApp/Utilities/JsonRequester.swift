//
//  JsonRequester.swift
//  VoiceOverApp
//
//  Created by Oscar Castillo on 9/14/20.
//

import Foundation

public enum JsonDecoderMockError: Error, LocalizedError {
    case dataParseError
    case jsonDecodeError
    
    public var errorDescription: String? {
        switch self {
        case .jsonDecodeError:
            return "Could not decode to target object"
        case .dataParseError:
            return "Could not parse json file to data"
        }
    }
}

class JsonRequester {
    
    static var bundle: Bundle {
        Bundle.main
    }
    
    static func readJsonData(fileName: String) -> Data? {
        do {
            if let file = bundle.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                return data
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    static func getMockObject<T>(type: T, fileName: String) throws -> T where T: Decodable {
        guard let data = readJsonData(fileName: fileName) else {
            throw JsonDecoderMockError.dataParseError
        }
        
        let decoder = JSONDecoder()
        let mock = try decoder.decode(T.self, from: data)
        return mock
    }
    
    static func getMockObjectArray<T>(fileName: String) throws -> [T] where T: Decodable {
        guard let data = readJsonData(fileName: fileName) else {
            throw JsonDecoderMockError.dataParseError
        }
        
        let decoder = JSONDecoder()
        let mock = try decoder.decode([T].self, from: data)
        return mock
    }
}
