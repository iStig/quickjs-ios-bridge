//
//  PointJSManager.m
//  Point
//
//  Created by matrixme on 2023/7/18.
//

#import "PointJSManager.h"
#import "PointJSProtocols.h"
#import "PointJSInject.h"
#import "PointJSModuleCore.h"

#import <YYKit/YYKit.h>

@interface PointJSManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, Class<PointJSModule>> *modules;

@end

@implementation PointJSManager

+ (instancetype)shared {
    static PointJSManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PointJSManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _modules = NSMutableDictionary.dictionary;
        _runtime = QJSRuntime.shared;
        [self prepare];
    }
    return self;
}

- (void)prepare {
    NSError *error;
    NSURL *url = [NSBundle.mainBundle URLForResource:@"injection" withExtension:@"json"];
    NSString *jsonstr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        return;
    }
    self.injections = [NSArray modelArrayWithClass:PointJSInject.class json:jsonstr];
    for (PointJSInject *inj in _injections) {
        if (inj.type == PointJSInjectTypeModule) {
            //oc类
            Class clz = NSClassFromString(inj.class);
            if(!clz){//swift类
                NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
                NSString *appName = [info objectForKey:(NSString *)kCFBundleExecutableKey];
                clz = NSClassFromString([NSString stringWithFormat:@"%@.%@", appName, inj.class]);
            }
            
            if (class_conformsToProtocol(clz, @protocol(PointJSModule))) {
                self.modules[inj.name] = (Class<PointJSModule>)clz;
            }
        }
    }
}

- (NSObject<PointJSCharacterSync> *)generateSyncCharacterBy:(PointJSCallArgv *)argv {
    if (!argv || argv.type != PointJSCallTypeSync) {
        return nil;
    }
    Class<PointJSModule> mcls = self.modules[argv.module];
    if (!mcls) {
        return nil;
    }
    NSDictionary<NSString *, Class<PointJSCharacterSync>> *syncs = [mcls performSelector:@selector(syncCharacters)];
    Class<PointJSCharacterSync> ccls = syncs[argv.method];
    if (!ccls) {
        return nil;
    }
//    NSObject<PointJSCharacterSync> *character = [ccls performSelector:NSSelectorFromString(@"new")];
    
    if (!ccls) { return nil; }
    SEL selector = NSSelectorFromString(@"new");
    IMP imp = [(NSObject *)ccls methodForSelector:selector];
    id (*func)(id, SEL) = (void *)imp;
    NSObject<PointJSCharacterSync> *character = func(ccls, selector);
    return character;
}

- (NSObject<PointJSCharacterAsync> *)generateAsyncCharacterBy:(nonnull PointJSCallArgv *)argv {
    if (!argv || argv.type != PointJSCallTypeAsync) {
        return nil;
    }
    Class<PointJSModule> mcls = self.modules[argv.module];
    if (!mcls) {
        return nil;
    }
    NSDictionary<NSString *, Class<PointJSCharacterAsync>> *syncs = [mcls performSelector:@selector(asyncCharacters)];
    Class<PointJSCharacterAsync> ccls = syncs[argv.method];
    if (!ccls) {
        return nil;
    }
//    NSObject<PointJSCharacterAsync> *character = [ccls performSelector:NSSelectorFromString(@"new")];
    
    if (!ccls) { return nil; }
    SEL selector = NSSelectorFromString(@"new");
    IMP imp = [(NSObject *)ccls methodForSelector:selector];
    id (*func)(id, SEL) = (void *)imp;
    NSObject<PointJSCharacterAsync> *character = func(ccls, selector);
    return character;
}

@end
