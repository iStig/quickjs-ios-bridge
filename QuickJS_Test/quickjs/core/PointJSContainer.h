//
//  PointJSContainer.h
//  Point
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>
#import <QuickJS_iOS.h>

NS_ASSUME_NONNULL_BEGIN

@interface PointJSContainer : NSObject

@property (nonatomic, strong, readonly) QJSRuntime *runtime;
@property (nonatomic, strong, readonly) QJSContext *context;

- (QJSValue *)eval:(NSString *)script;
- (QJSValue *)eval:(NSString *)script :(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END

