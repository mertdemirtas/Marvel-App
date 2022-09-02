// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let marvelComicsModel = try? newJSONDecoder().decode(MarvelComicsModel.self, from: jsonData)

import Foundation

// MARK: - MarvelComicsModel
struct MarvelComicsModel: Codable {
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: DataClassComics?
}

// MARK: - DataClass
struct DataClassComics: Codable {
    var offset, limit, total, count: Int?
    var results: [ComicsResult]?
}

// MARK: - Result
struct ComicsResult: Codable {
    var id, digitalID: Int?
    var title: String?
    var issueNumber: Int?
    var variantDescription: VariantDescription?
    var resultDescription: String?
    var modified, isbn, upc, diamondCode: String?
    var ean, issn: String?
    var format: Format?
    var pageCount: Int?
    var textObjects: [TextObject]?
    var resourceURI: String?
    var urls: [URLElement]?
    var series: Series?
    var variants: [Series]?
    var collections, collectedIssues: String?
    var dates: [DateElement]?
    var prices: [Price]?
    var thumbnail: ThumbnailComics?
    var images: [ThumbnailComics]?
    var creators: Creators?
    var characters: Characters?
    var stories: StoriesComics?
    var events: Characters?

    enum CodingKeys: CodingKey {
        case id
        case digitalID
        case title, issueNumber
        case resultDescription
        case modified, pageCount
    }
}

// MARK: - Characters
struct Characters: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [Series]?
    var returned: Int?
}

// MARK: - Series
struct Series: Codable {
    var resourceURI: String?
    var name: String?
}

// MARK: - Creators
struct Creators: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [CreatorsItem]?
    var returned: Int?
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    var resourceURI: String?
    var name, role: String?
}

// MARK: - DateElement
struct DateElement: Codable {
    var type: DateType?
    var date: String?
}

enum DateType: String, Codable {
    case digitalPurchaseDate = "digitalPurchaseDate"
    case focDate = "focDate"
    case onsaleDate = "onsaleDate"
    case unlimitedDate = "unlimitedDate"
}

enum Format: String, Codable {
    case comic = "Comic"
}

// MARK: - Thumbnail
struct ThumbnailComics: Codable {
    var path: String?
    var thumbnailExtension: Extension?

    enum CodingKeys: CodingKey {
        case path
        case thumbnailExtension
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}

// MARK: - Price
struct Price: Codable {
    var type: PriceType?
    var price: Double?
}

enum PriceType: String, Codable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"
}

// MARK: - Stories
struct StoriesComics: Codable {
    var available: Int?
    var collectionURI: String?
    var items: [StoriesItemComics]?
    var returned: Int?
}

// MARK: - StoriesItem
struct StoriesItemComics: Codable {
    var resourceURI: String?
    var name: String?
    var type: ItemType?
}

enum ItemType: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - TextObject
struct TextObject: Codable {
    var type, language, text: String?
}

// MARK: - URLElement
struct URLElementComics: Codable {
    var type: URLTypeComics?
    var url: String?
}

enum URLTypeComics: String, Codable {
    case detail = "detail"
    case inAppLink = "inAppLink"
    case purchase = "purchase"
    case reader = "reader"
}

enum VariantDescription: String, Codable {
    case empty = ""
    case spotlightVariant = "SPOTLIGHT VARIANT"
    case zombieVariant = "ZOMBIE VARIANT"
}
