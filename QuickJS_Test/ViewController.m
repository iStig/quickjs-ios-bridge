//
//  ViewController.m
//  QuickJS_Test
//
//  Created by zhangjianming on 2023/7/18.
//

#import "ViewController.h"
#import "SQBJSContainer.h"

@interface ViewController ()
@property (nonatomic, strong)  SQBJSContainer *jscontainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.jscontainer = [SQBJSContainer new];
//    [jscontainer eval:@"console.log(WOSAI.system.env)"];
    
    
    //同步
//    [jscontainer eval:@"let result = WOSAI.system.env(console.log('******')); console.log('<<<'+JSON.stringify(result))"];
    //异步
//    [jscontainer eval:@"WOSAI.location.position((param) => {console.log('>>>><<<<'+JSON.stringify(param));});"];
    //异步另外一种写法
//    [self.jscontainer eval:@"WOSAI.location.position(function(param){console.log('>>>>'+JSON.stringify(param));});"];

   //暂时没用
//    [self.jscontainer eval:@"WOSAI.web.callSync(function(param){console.log('>>>>'+JSON.stringify(param));});"];

    //同步
//      [self.jscontainer eval:@"let result =WOSAI.web.callSync({module:'aaa',method:'bbb',params:{cccc:'dddd'}});console.log('<<<'+JSON.stringify(result))"];

    //异步
    [self.jscontainer eval:@"WOSAI.web.callAsync({module:'aaa',method:'bbb',params:{cccc:'dddd'}},(param) => {console.log('>>>><<<<'+JSON.stringify(param));});"];

    
    
    //native传参数给jsenv
//    [jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@{@"HELLO":@"world"}];
//    [jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@[@"1",@"2"]];
//    [jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@"test"];
      


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
