//
//  Workflow.swift
//  Pods-WorkflowKit_Example
//
//  Created by Tomoya Hirano on 2018/09/25.
//

import UIKit

public class Workflow: Decodable {
  public let actions: [Workflow.Action]
  public let clientRelease: String
  public let clientVersion: String
  public let icon: Workflow.Icon
  public let importQuestions: [Workflow.ImportQuestion]
  public let inputContentItemClasses: [String]
  public let minimumClientVersion: Int
  public let types: [String]
  
  public enum CodingKeys: String, CodingKey {
    case actions = "WFWorkflowActions"
    case clientRelease = "WFWorkflowClientRelease"
    case clientVersion = "WFWorkflowClientVersion"
    case icon = "WFWorkflowIcon"
    case importQuestions = "WFWorkflowImportQuestions"
    case inputContentItemClasses = "WFWorkflowInputContentItemClasses"
    case minimumClientVersion = "WFWorkflowMinimumClientVersion"
    case types = "WFWorkflowTypes"
  }
}

extension Workflow {
  public class Action: Decodable {
    public let identifier: String
    //    let parameters: []
    
    public enum CodingKeys: String, CodingKey {
      case identifier = "WFWorkflowActionIdentifier"
    }
  }
  
  public class Icon: Decodable {
    public let glyphNumber: Int
    public let imageData: Data
    public let startColor: Color
    
    required public init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.glyphNumber = try container.decode(Int.self, forKey: .glyphNumber)
      self.imageData = try container.decode(Data.self, forKey: .imageData)
      let startColorValue = try container.decode(Int64.self, forKey: .startColor)
      self.startColor = UIColor(rgbaValue: startColorValue)
    }
    
    public enum CodingKeys: String, CodingKey {
      case glyphNumber = "WFWorkflowIconGlyphNumber"
      case imageData = "WFWorkflowIconImageData"
      case startColor = "WFWorkflowIconStartColor"
    }
  }
  
  public class ImportQuestion: Decodable {
  }
}

public protocol WorkflowInitializable where Self: Workflow {
  static func `init`(url: URL) -> Workflow?
  static func `init`(data: Data) -> Workflow?
}

extension Workflow: WorkflowInitializable {
  public static func `init`(url: URL) -> Workflow? {
    do {
      let data = try Data(contentsOf: url)
      let plistFile = try PropertyListSerialization.propertyList(from: data,
                                                                        options: [],
                                                                        format: nil)
      let xmlData = try PropertyListSerialization.data(fromPropertyList: plistFile,
                                                              format: .xml,
                                                              options: 0)
      return self.init(data: xmlData)
    } catch {
      print(error)
      return nil
    }
  }
  
  public static func `init`(data: Data) -> Workflow? {
    do {
      return try PropertyListDecoder().decode(Workflow.self, from: data)
    } catch {
      print(error)
      return nil
    }
  }
}
