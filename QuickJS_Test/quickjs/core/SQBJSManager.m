//
//  SQBJSManager.m
//  SQB
//
//  Created by matrixme on 2023/7/18.
//

#import "SQBJSManager.h"
#import "SQBJSProtocols.h"
#import "SQBJSInject.h"
#import "SQBJSModuleCore.h"

#import <YYKit/YYKit.h>

@interface SQBJSManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, Class<SQBJSModule>> *modules;

@end

@implementation SQBJSManager

+ (instancetype)shared {
    static SQBJSManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SQBJSManager alloc] init];
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
    self.injections = [NSArray modelArrayWithClass:SQBJSInject.class json:jsonstr];
    for (SQBJSInject *inj in _injections) {
        if (inj.type == SQBJSInjectTypeModule) {
            //oc类
            Class clz = NSClassFromString(inj.class);
            if(!clz){//swift类
                NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
                NSString *appName = [info objectForKey:(NSString *)kCFBundleExecutableKey];
                clz = NSClassFromString([NSString stringWithFormat:@"%@.%@", appName, inj.class]);
            }
            
            if (class_conformsToProtocol(clz, @protocol(SQBJSModule))) {
                self.modules[inj.name] = (Class<SQBJSModule>)clz;
            }
        }
    }
}

- (NSObject<SQBJSCharacterSync> *)generateSyncCharacterBy:(SQBJSCallArgv *)argv {
    if (!argv || argv.type != SQBJSCallTypeSync) {
        return nil;
    }
    Class<SQBJSModule> mcls = self.modules[argv.module];
    if (!mcls) {
        return nil;
    }
    NSDictionary<NSString *, Class<SQBJSCharacterSync>> *syncs = [mcls performSelector:@selector(syncCharacters)];
    Class<SQBJSCharacterSync> ccls = syncs[argv.method];
    if (!ccls) {
        return nil;
    }
//    NSObject<SQBJSCharacterSync> *character = [ccls performSelector:NSSelectorFromString(@"new")];
    
    if (!ccls) { return nil; }
    SEL selector = NSSelectorFromString(@"new");
    IMP imp = [(NSObject *)ccls methodForSelector:selector];
    id (*func)(id, SEL) = (void *)imp;
    NSObject<SQBJSCharacterSync> *character = func(ccls, selector);
    return character;
}

- (NSObject<SQBJSCharacterAsync> *)generateAsyncCharacterBy:(nonnull SQBJSCallArgv *)argv {
    if (!argv || argv.type != SQBJSCallTypeAsync) {
        return nil;
    }
    Class<SQBJSModule> mcls = self.modules[argv.module];
    if (!mcls) {
        return nil;
    }
    NSDictionary<NSString *, Class<SQBJSCharacterAsync>> *syncs = [mcls performSelector:@selector(asyncCharacters)];
    Class<SQBJSCharacterAsync> ccls = syncs[argv.method];
    if (!ccls) {
        return nil;
    }
//    NSObject<SQBJSCharacterAsync> *character = [ccls performSelector:NSSelectorFromString(@"new")];
    
    if (!ccls) { return nil; }
    SEL selector = NSSelectorFromString(@"new");
    IMP imp = [(NSObject *)ccls methodForSelector:selector];
    id (*func)(id, SEL) = (void *)imp;
    NSObject<SQBJSCharacterAsync> *character = func(ccls, selector);
    return character;
}

@end
