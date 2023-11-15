//
//  URLType.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 15/11/2023.
//

import Foundation
enum URLType
{

  case name(String)

  case url(URL)




  var url: URL? {

    switch self {

      case .name(let name):

        return Bundle.main.url(forResource: name, withExtension: "GIF")

      case .url(let remoteURL):

        return remoteURL

    }

  }

}
