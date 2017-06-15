//
//  View.m
//  block
//
//  Created by kede on 16/8/31.
//  Copyright © 2016年 jinyueyang. All rights reserved.
//

#import "btnView.h"

@implementation btnView



- (IBAction)clickBtnChangeViewColor:(UIButton *)sender {
//    if ([self.delegate respondsToSelector:@selector(changeColor)]) {
//        [self.delegate changeColor];
//    }
    
    if (self.cBtn) {
        self.cBtn();
    }
    
}

- (void)click1:(void (^)())block {
    block();
}

- (void)click2:(void (^)(NSString *))block {
    NSString *text = @"zhuoyang1";
    block(text);
}
- (void)click3:(NSString *(^)(NSString *))block {
    NSString *text = @"zhuoayng2";
    block(text);
    
}

- (void)click4:(void (^)(NSInteger))block {
    NSInteger index = 1;
    block(index);
}
//点击搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeText" object:searchBar.text];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeText" object:nil userInfo:@{@"txt":searchBar.text,@"color":[UIColor orangeColor]}];
}
@end
