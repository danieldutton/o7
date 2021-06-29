import Foundation

// MARK: - GalnetNews
struct GalnetNews: Codable {
    //let jsonapi: Jsonapi
    let data: [Datum]
    //let meta: GalnetNewsMeta
    //let links: GalnetNewsLinks
    var newsItems: [NewsItem] {
        var newsItems: [NewsItem] = []
        for dat in data {
            let newsItem = NewsItem(id: dat.id, title: dat.attributes.title, date: dat.attributes.fieldGalnetDate, content: dat.attributes.body.processed)
            newsItems.append(newsItem)
        }
        return newsItems
    }
}

extension Datum {
    var newsItem: NewsItem {
        NewsItem(
            id: id,
            title: attributes.title,
            date: attributes.fieldGalnetDate,
            content: attributes.body.processed
        )
    }
}

// MARK: - Datum
struct Datum: Codable {
    let type: DatumType
    let id: String
    let links: DatumLinks
    let attributes: Attributes
    let relationships: Relationships
}

// MARK: - Attributes
struct Attributes: Codable {
    let drupalInternalNid, drupalInternalVid: Int
    let langcode: Langcode
    let revisionTimestamp: String
    let revisionLog: String?
    let status: Bool
    let title: String
    let created: String
    let changed: String
    let promote, sticky, defaultLangcode, revisionTranslationAffected: Bool
    let moderationState: String?
    let path: Path
    let publishOn, unpublishOn: String?
    let contentTranslationSource: ContentTranslationSource
    let contentTranslationOutdated: Bool
    let publishedAt: String
    let body: Body
    let fieldGalnetDate, fieldGalnetGUID, fieldGalnetImage, fieldSlug: String

    enum CodingKeys: String, CodingKey {
        case drupalInternalNid = "drupal_internal__nid"
        case drupalInternalVid = "drupal_internal__vid"
        case langcode
        case revisionTimestamp = "revision_timestamp"
        case revisionLog = "revision_log"
        case status, title, created, changed, promote, sticky
        case defaultLangcode = "default_langcode"
        case revisionTranslationAffected = "revision_translation_affected"
        case moderationState = "moderation_state"
        case path
        case publishOn = "publish_on"
        case unpublishOn = "unpublish_on"
        case contentTranslationSource = "content_translation_source"
        case contentTranslationOutdated = "content_translation_outdated"
        case publishedAt = "published_at"
        case body
        case fieldGalnetDate = "field_galnet_date"
        case fieldGalnetGUID = "field_galnet_guid"
        case fieldGalnetImage = "field_galnet_image"
        case fieldSlug = "field_slug"
    }
}

// MARK: - Body
struct Body: Codable {
    let value: String
    let format: String?
    let processed: String
    let summary: String?
}

enum ContentTranslationSource: String, Codable {
    case und = "und"
}

enum Langcode: String, Codable {
    case en = "en"
}

// MARK: - Path
struct Path: Codable {
    let alias, pid: String?
    let langcode: Langcode
}

// MARK: - DatumLinks
struct DatumLinks: Codable {
    let linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Next
struct Next: Codable {
    let href: String
}

// MARK: - Relationships
struct Relationships: Codable {
    let nodeType, revisionUid, uid: NodeType

    enum CodingKeys: String, CodingKey {
        case nodeType = "node_type"
        case revisionUid = "revision_uid"
        case uid
    }
}

// MARK: - NodeType
struct NodeType: Codable {
    let data: DataClass
    let links: NodeTypeLinks
}

// MARK: - DataClass
struct DataClass: Codable {
    let type: DataType
    let id: String
}

enum DataType: String, Codable {
    case nodeTypeNodeType = "node_type--node_type"
    case userUser = "user--user"
}

// MARK: - NodeTypeLinks
struct NodeTypeLinks: Codable {
    let related, linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case related
        case linksSelf = "self"
    }
}

enum DatumType: String, Codable {
    case nodeGalnetArticle = "node--galnet_article"
}

// MARK: - GalnetNewsLinks
struct GalnetNewsLinks: Codable {
    let next, linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case next
        case linksSelf = "self"
    }
}

// MARK: - GalnetNewsMeta
struct GalnetNewsMeta: Codable {
    let omitted: Omitted
}

// MARK: - Omitted
struct Omitted: Codable {
    let detail: String
    let links: OmittedLinks
}

// MARK: - OmittedLinks
struct OmittedLinks: Codable {
    let help: Next
    let itemFFZRKY1: ItemFFZRKY1

    enum CodingKeys: String, CodingKey {
        case help
        case itemFFZRKY1 = "item--FFZRKY1"
    }
}

// MARK: - ItemFFZRKY1
struct ItemFFZRKY1: Codable {
    let href: String
    let meta: ItemFFZRKY1Meta
}

// MARK: - ItemFFZRKY1Meta
struct ItemFFZRKY1Meta: Codable {
    let rel, detail: String
}
