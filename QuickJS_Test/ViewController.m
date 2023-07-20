//
//  ViewController.m
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/18.
//

#import "ViewController.h"
#import "SQBJSContainer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SQBJSContainer *jscontainer = [SQBJSContainer new];
//    [jscontainer eval:@"console.log(WOSAI.system.env)"];
    //同步
    [jscontainer eval:@"let result = WOSAI.system.env(console.log('******')); console.log('<<<'+JSON.stringify(result))"];
    //异步
    [jscontainer eval:@"WOSAI.location.position((param) => {console.log('>>>><<<<'+JSON.stringify(param));});"];
    
//    [jscontainer eval:@"WOSAI.location.position(function(param){console.log('>>>>'+JSON.stringify(param));});"];

    

//    {
//        Class class = NSClassFromString(@"QuickJS_Test.SQBJSModuleSystem");
//        NSLog(@"%@",class);
//    }
//
//    {
//        Class class = NSClassFromString(@"SQBJSResponse");
//        NSLog(@"%@",class);
//    }
}


@end
