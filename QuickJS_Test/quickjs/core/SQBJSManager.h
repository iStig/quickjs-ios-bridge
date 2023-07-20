//
//  SQBJSManager.h
//  SQB
//
//  Created by matrixme on 2023/7/18.
//

#import <Foundation/Foundation.h>
#import "SQBJSProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@class SQBJSInject, SQBJSCallArgv;

@interface SQBJSManager : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@property (nonatomic, strong, readonly) QJSRuntime *runtime;
@property (nonatomic, strong) NSArray<SQBJSInject *> *injections;

+ (instancetype)shared;

- (NSObject<SQBJSCharacterSync> *)generateSyncCharacterBy:(SQBJSCallArgv *)argv;
- (NSObject<SQBJSCharacterAsync> *)generateAsyncCharacterBy:(SQBJSCallArgv *)argv;

@end

NS_ASSUME_NONNULL_END
