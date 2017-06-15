//
//  View.h
//  block
//
//  Created by kede on 16/8/31.
//  Copyright © 2016年 jinyueyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol btnViewDelegate <NSObject>

- (void)changeColor;

@end

@interface btnView : UIView <UISearchBarDelegate,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *search;


@property (weak, nonatomic) id <btnViewDelegate> delegate;

typedef void (^YYClickBtn)();

@property (copy, nonatomic) YYClickBtn cBtn;

@property (copy, nonatomic) void(^ZYClickBlock)();
@property (copy, nonatomic) void (^ZYClickBlock2)(NSString * clickBtn);

typedef void (^ZYClick)();

- (void)click1:(void(^)())block;
- (void)click2:(void(^)(NSString * text))block;
- (void)click3:(NSString *(^)(NSString *))block;
- (void)click4:(void(^)(NSInteger index))block;
@end
