//
//  SQBJSInject.h
//  SQB
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SQBJSInjectType) {
    SQBJSInjectTypeModule,
    SQBJSInjectTypeGlobal,
};

@interface SQBJSInject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *file;
@property (nonatomic, assign) SQBJSInjectType type;
@property (nonatomic, copy) NSString *class;

@end

NS_ASSUME_NONNULL_END
