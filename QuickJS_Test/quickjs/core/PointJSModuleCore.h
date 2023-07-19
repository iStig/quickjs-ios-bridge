//
//  PointJSModuleCore.h
//  Point
//
//  Created by matrixme on 2023/7/18.
//

#import <Foundation/Foundation.h>
#import <QuickJS_iOS.h>

NS_ASSUME_NONNULL_BEGIN

@interface PointJSModuleCore : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, weak, readonly) QJSRuntime *runtime;
@property (nonatomic, weak, readonly) QJSContext *context;

- (instancetype)initWithRuntime:(QJSRuntime *)rt andContext:(QJSContext *)ctx;

- (NSString *)callSync:(NSString *)json;
- (void)call:(NSString *)json;

@end

NS_ASSUME_NONNULL_END
