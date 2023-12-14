//
//  SQBJSInject.h
//  SQB
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SQBJSInjectType) {//默认模块级别
    SQBJSInjectTypeModule,// 模块 = 0
    SQBJSInjectTypeGlobal,// 全局 = 1
};

@interface SQBJSInject : NSObject

@property (nonatomic, copy) NSString *name;//模块名
@property (nonatomic, copy) NSString *file;//模块文件名（模块代码）
@property (nonatomic, assign) SQBJSInjectType type;//模块类型
@property (nonatomic, copy) NSString *class;//模块类

@end

NS_ASSUME_NONNULL_END
