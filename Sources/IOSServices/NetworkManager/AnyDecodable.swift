//
//  AnyDecodable.swift
//
//
//  Created by Ranjith Kumar on 25/07/24.
//

import Foundation
internal struct AnyDecodable: Decodable {
  let value: Any

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if let boolValue = try? container.decode(Bool.self) {
      value = boolValue
    } else if let intValue = try? container.decode(Int.self) {
      value = intValue
    } else if let doubleValue = try? container.decode(Double.self) {
      value = doubleValue
    } else if let stringValue = try? container.decode(String.self) {
      value = stringValue
    } else if let arrayValue = try? container.decode([Self].self) {
      value = arrayValue.map { $0.value }
    } else if let dictionaryValue = try? container.decode([String: Self].self) {
      value = dictionaryValue.mapValues { $0.value }
    } else {
      throw DecodingError.dataCorruptedError(in: container,
                          debugDescription: "The container contains nothing decodable.")
    }
  }
}
