//
//  ChapterOneModel.swift
//  Dot98
//
//  Created by Jake Connerly on 12/18/20.
//

import Foundation

struct ChapterOne: Codable {
    let chapterNumber: String
    let chapterTitle: String
    let sections: [Section]
    
    enum CodingKeys: String, CodingKey {
        case chapterNumber = "chapter_number"
        case chapterTitle = "chapter_title"
        case sections
    }
}

struct Section: Codable {
    let sectionNumber: String
    let sectionTitle: String
    let sectionContent: String
    let imageID: String?
    let sectionPageNumbers: String?
    let subsections: [Subsection]?
    
    enum CodingKeys: String, CodingKey {
        case sectionNumber = "section_number"
        case sectionTitle = "section_title"
        case sectionContent = "section_content"
        case imageID = "image_id"
        case sectionPageNumbers = "section_page_numbers"
        case subsections
    }
}

struct Subsection: Codable {
    let subsectionTitle: String?
    let subsectionContent: String?
    let subsectionImageID: String?
    let subsectionPageNumbers: String?
    
    enum CodingKeys: String, CodingKey {
        case subsectionTitle = "subsection_title"
        case subsectionContent = "subsection_content"
        case subsectionImageID = "subsection_image_id"
        case subsectionPageNumbers = "subsection_page_numbers"
    }
}
