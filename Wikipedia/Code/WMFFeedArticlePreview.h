#import <Mantle/Mantle.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMFFeedArticlePreview : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *displayTitle;

@property (nonatomic, copy, readwrite, nullable) NSString *wikidataDescription;

@property (nonatomic, copy, readwrite, nullable) NSString *snippet;

@property (nonatomic, copy, readwrite) NSString *language;

@property (nonatomic, copy, readwrite, nullable) NSURL *thumbnailURL;

@property (nonatomic, copy, readwrite, nonnull) NSURL *articleURL;

@end

@interface WMFFeedTopReadArticlePreview : WMFFeedArticlePreview

@property (nonatomic, copy, readwrite) NSNumber *numberOfViews;

@property (nonatomic, copy, readwrite) NSNumber *rank;

@end

NS_ASSUME_NONNULL_END
