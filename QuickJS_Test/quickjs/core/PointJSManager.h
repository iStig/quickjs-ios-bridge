//
//  PointJSManager.h
//  Point
//
//  Created by matrixme on 2023/7/18.
//

#import <Foundation/Foundation.h>
#import "PointJSProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@class PointJSInject, PointJSCallArgv;

@interface PointJSManager : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, strong, readonly) QJSRuntime *runtime;
@property (nonatomic, strong) NSArray<PointJSInject *> *injections;

+ (instancetype)shared;

- (NSObject<PointJSCharacterSync> *)generateSyncCharacterBy:(PointJSCallArgv *)argv;
- (NSObject<PointJSCharacterAsync> *)generateAsyncCharacterBy:(PointJSCallArgv *)argv;

@end

NS_ASSUME_NONNULL_END
