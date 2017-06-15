//
//  BaseViewController.m
//  block
//
//  Created by kede on 16/8/31.
//  Copyright © 2016年 jinyueyang. All rights reserved.
//

#import "BaseViewController.h"
#import "btnView.h"

#define YYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface BaseViewController ()

@property (strong, nonatomic) btnView *btnView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.btnView];
    
    
    UIView *colorView = [[UIView alloc]initWithFrame:CGRectMake(0,300, 200, 200)];
    colorView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:colorView];
    
    self.btnView.cBtn = ^(){
        colorView.backgroundColor = YYRandomColor;
    };
}

- (btnView *)btnView {
    if (!_btnView) {
        _btnView = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil][0];
        
    }
    return _btnView;
}


@end
