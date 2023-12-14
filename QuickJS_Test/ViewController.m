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
    self.jscontainer = [SQBJSContainer new];
    [self setupSubviews];
}


- (void)action1 { // 同步&打印机方法
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self.jscontainer eval:@"console.log('>>>>' + WOSAI.system.env)"];
}

- (void)action4 { //同步&无入参&无回调 //很奇怪 用let result 来接受返回内容 调用过一次就不行咯
    NSLog(@"%@",NSStringFromSelector(_cmd));
//    [self.jscontainer eval:@"let result = WOSAI.system.env();"];
    [self.jscontainer eval:@"console.log('>>>>' + WOSAI.system.env())"];
//    [self.jscontainer eval:@"let result = WOSAI.system.env(); console.log('>>>>' + JSON.stringify(result));"];
}

- (void)action5 { //异步&有入参&有回调&2种写法
    NSLog(@"%@",NSStringFromSelector(_cmd));
//    [self.jscontainer eval:@"WOSAI.location.position({ a: 1 },(param) => {console.log('>>>>' + JSON.stringify(param));});"];
    [self.jscontainer eval:@"WOSAI.location.position({ a: 1 },function(param){console.log('>>>>' + JSON.stringify(param));});"];
}

- (void)action6 { //同步&有入参&入参是函数&无回调 //因为参数是个回调方法所以不会执行 其实感觉可以稍微改造下通过判断参数是什么来做具体操作
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self.jscontainer eval:@"WOSAI.web.callSync(function(param){console.log('>>>>' + JSON.stringify(param));});"];
}

- (void)action7 { //同步&有入参&无回调 //很奇怪 用let result 来接受返回内容 调用过一次就不行咯
    NSLog(@"%@",NSStringFromSelector(_cmd));
//    [self.jscontainer eval:@"let result = WOSAI.web.callSync({module:'aaa',method:'bbb',params:{cccc:'dddd'}});"];
    [self.jscontainer eval:@"console.log('>>>>' + WOSAI.web.callSync({module:'aaa',method:'bbb',params:{cccc:'dddd'}}))"];
//    [self.jscontainer eval:@"let result = WOSAI.web.callSync({module:'aaa',method:'bbb',params:{cccc:'dddd'}}); console.log('>>>>' + JSON.stringify(result));"];
}

- (void)action8 { //异步&有入参&有回调
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self.jscontainer eval:@"WOSAI.web.callAsync({module:'aaa',method:'bbb',params:{cccc:'dddd'}},(param) => {console.log('>>>>' + JSON.stringify(param));});"];
}


- (void)setupSubviews {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = 0;
    CGFloat y = 100;
    CGFloat h = 40;
    CGFloat space = 20;
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"同步&打印机方法" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"同步&无入参&无回调" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action4) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"异步&有入参&有回调&2种写法" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action5) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"同步&有入参&入参是函数&无回调" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action6) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"同步&有入参&无回调" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action7) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        y = y + h + space;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(x , y, screenW - x*2, h);
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"异步&有入参&有回调" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(action8) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
}



@end


//native传参数给jsenv
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@{@"HELLO":@"world"}];
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@[@"1",@"2"]];
//    [self.jscontainer eval:@"console.log(JSON.stringify(WOSAI.query));" :@"test"];
  

//    {
//        Class class = NSClassFromString(@"QuickJS_Test.SQBJSModuleSystem");
//        NSLog(@"%@",class);
//    }

//    {
//        Class class = NSClassFromString(@"SQBJSResponse");
//        NSLog(@"%@",class);
//    }
