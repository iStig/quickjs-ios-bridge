//
//  PointJSInject.h
//  Point
//
//  Created by matrixme on 2023/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PointJSInjectType) {
    PointJSInjectTypeModule,
    PointJSInjectTypeGlobal,
};

@interface PointJSInject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *file;
@property (nonatomic, assign) PointJSInjectType type;
@property (nonatomic, copy) NSString *class;

@end

NS_ASSUME_NONNULL_END
