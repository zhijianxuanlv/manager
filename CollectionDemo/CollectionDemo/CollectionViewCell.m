//
//  CollectionViewCell.m
//  CollectionDemo
//
//  Created by 罗成 on 15/11/25.
//  Copyright © 2015年 罗成. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        CGFloat viewW = self.frame.size.width;
        
        
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        

        
//        CGFloat viewH = self.frame.size.height;
        CGFloat cityX = 0;
        CGFloat cityY = 0;
        CGFloat cityW = viewW;
        CGFloat cityH = cityW;
        
        UIButton *cityBtn = [[UIButton alloc]initWithFrame:CGRectMake(cityX, cityY, cityW, cityH)];
        cityBtn.layer.cornerRadius = 2;
        [cityBtn addTarget:self action:@selector(cityClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:cityBtn];
        self.cityBtn = cityBtn;
        
                
        CGFloat deleteY = 0;
        CGFloat deleteW = 20;
        CGFloat deleteH = 20;
        CGFloat deleteX = cityW - deleteW + 5;
        
        UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(deleteX, 0, deleteW, deleteH)];
        deleteBtn.hidden = YES;
        deleteBtn.layer.cornerRadius = 2;
        deleteBtn.layer.masksToBounds = YES;
        deleteBtn.clipsToBounds = YES;
        deleteBtn.backgroundColor = [UIColor redColor];
        [self.cityBtn addSubview:deleteBtn];
        self.deleteBtn = deleteBtn;
        
    }

    return self;
}

- (void)cityClick:(UIButton *)btn {

    if ([self.delegate respondsToSelector:@selector(addCityClick:)]) {
        
        [self.delegate addCityClick:btn];
    }
}


@end
