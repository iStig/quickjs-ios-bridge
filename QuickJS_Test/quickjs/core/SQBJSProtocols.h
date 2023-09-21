//
//  SQBJSProtocols.h
//  mr.chat
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>
#import "SQBJSCallArgv.h"
#import "SQBJSResponse.h"
#import <libQuickJS_iOS/QuickJS_iOS.h>

#ifndef SQBJSProtocols_h
#define SQBJSProtocols_h

// MARK: - SQBJSCharacter

@protocol SQBJSCharacter <NSObject>

@required
- (NSString *)characterName;
- (SQBJSCallType)characterType;

@end

@protocol SQBJSCharacterAsync <NSObject, SQBJSCharacter>

@required
- (void)jsResponse:(QJSContext *)context withArgv:(SQBJSCallArgv *)argv callback:(void(^)(SQBJSResponse *resp))cb;

@end

@protocol SQBJSCharacterSync <NSObject, SQBJSCharacter>

@required
- (SQBJSResponse *)jsResponse:(QJSContext *)context withArgv:(SQBJSCallArgv *)argv;

@end

// MARK: - SQBJSModule

@protocol SQBJSModule <NSObject>

+ (NSString *)moduleName;
+ (NSDictionary<NSString *, Class<SQBJSCharacterSync>> *)syncCharacters;
+ (NSDictionary<NSString *, Class<SQBJSCharacterAsync>> *)asyncCharacters;

@end


#endif /* SQBJSProtocols_h */
