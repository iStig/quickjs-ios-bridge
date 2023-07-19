//
//  PointJSProtocols.h
//  mr.chat
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>
#import "PointJSCallArgv.h"
#import "PointJSResponse.h"
#import <QuickJS_iOS.h>

#ifndef PointJSProtocols_h
#define PointJSProtocols_h

// MARK: - PointJSCharacter

@protocol PointJSCharacter <NSObject>

@required
- (NSString *)characterName;
- (PointJSCallType)characterType;

@end

@protocol PointJSCharacterAsync <NSObject, PointJSCharacter>

@required
- (void)jsResponse:(QJSContext *)context withArgv:(PointJSCallArgv *)argv callback:(void(^)(PointJSResponse *resp))cb;

@end

@protocol PointJSCharacterSync <NSObject, PointJSCharacter>

@required
- (PointJSResponse *)jsResponse:(QJSContext *)context withArgv:(PointJSCallArgv *)argv;

@end

// MARK: - PointJSModule

@protocol PointJSModule <NSObject>

+ (NSString *)moduleName;
+ (NSDictionary<NSString *, Class<PointJSCharacterSync>> *)syncCharacters;
+ (NSDictionary<NSString *, Class<PointJSCharacterAsync>> *)asyncCharacters;

@end


#endif /* PointJSProtocols_h */
