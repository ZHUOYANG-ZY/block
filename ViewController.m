//
//  ViewController.m
//  block
//
//  Created by kede on 16/8/31.
//  Copyright © 2016年 jinyueyang. All rights reserved.
//

#import "ViewController.h"
#import "btnView.h"

#define YYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface ViewController ()<btnViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *willchangeView;
@property (weak, nonatomic) IBOutlet UILabel *willChangeLabel;

@property (copy, nonatomic) void (^testblock)();


@end

@implementation ViewController
NSString *str = @"zhuoyang";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.topView.frame = CGRectMake(20, 50, 200, 100);
    [self.view addSubview:self.topView];
    
    __weak __typeof(self) weakSelf = self;
    NSInteger index = 1;
    self.testblock = ^{
        NSLog(@"%ld",index);
        
    };
    NSLog(@"%@",self.testblock);
    
    int i=1;
    NSLog(@"%@",^{NSLog(@"%d",i); });
    
    NSLog(@"%@",^{NSLog(@"%@",self.willChangeLabel);});
    
    void (^testBlock)() = ^{
    
        NSLog(@"%d",i);
    };
    NSLog(@"%@",testBlock);
    
    
    
    self.topView.cBtn = ^{
        weakSelf.willchangeView.backgroundColor = YYRandomColor;
    };
    NSLog(@"%@",self.topView.cBtn);
    
    
    [self.topView click1:^{
        weakSelf.willchangeView.backgroundColor = [UIColor orangeColor];
    }];
    
    [self.topView click2:^(NSString * text) {
        weakSelf.willChangeLabel.text = text;
    }];
    
    [self.topView click3:^NSString *(NSString * text) {
        weakSelf.willChangeLabel.text = text;
        return weakSelf.willChangeLabel.text;
    }];
    
    [self.topView click4:^(NSInteger index) {
        weakSelf.willChangeLabel.tag = index;
        NSLog(@"tag --  %ld",weakSelf.willChangeLabel.tag);
    }];
    [self registerNotif];
}

- (void)changeColor {
    
    self.willchangeView.backgroundColor = YYRandomColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)registerNotif {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText:) name:@"changeText" object:nil];
}
- (void)changeText:(NSNotification*)nsnotification {
    self.willChangeLabel.text = nsnotification.userInfo[@"txt"];
    NSLog(@"%@", self.willChangeLabel.text);
    self.willChangeLabel.backgroundColor = nsnotification.userInfo[@"color"];
}

- (btnView *)topView {
    if (!_topView) {
        _topView = [[NSBundle mainBundle]loadNibNamed:@"View" owner:self options:nil][0];

        _topView.delegate = self;
    }
    return _topView;
}
@end
