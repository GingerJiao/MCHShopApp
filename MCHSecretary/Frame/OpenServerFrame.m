//
//  OpenServerFrame.m
//  MCHSecretary
//
//  Created by zhujin zhujin on 16/8/26.
//  Copyright © 2016年 朱进. All rights reserved.
//

#import "OpenServerFrame.h"
#import "AppPacketInfo.h"

#define mScreenWidth [[UIScreen mainScreen] bounds].size.width
#define mScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ViewHeight 100

@implementation OpenServerFrame{
    
    
}

-(void) setData:(AppPacketInfo*)firstApp secondApp:(AppPacketInfo*)secondApp{
    _leftApp = firstApp;
    _rightApp = secondApp;
    
    CGFloat viewWeight = mScreenWidth / 2;
    
    self.leftViewFrame = CGRectMake(0, 0, viewWeight, ViewHeight);
    
    self.leftImageFrame = CGRectMake(5, 10, 40, 40);
    
    CGFloat leftnameX = CGRectGetMaxX(self.leftImageFrame) + 3;
    self.leftNameFrame = CGRectMake(leftnameX, 10, viewWeight - leftnameX, 12);
    
    CGFloat leftserverY = CGRectGetMaxY(self.leftNameFrame) + 5;
    self.leftServerFrame = CGRectMake(leftnameX, leftserverY + 2, 20, 10);
    
    CGFloat leftdiscountX = CGRectGetMaxX(self.leftServerFrame) + 3;
    self.leftDiscountFrame = CGRectMake(leftdiscountX, leftserverY, 20, 15);
    
    
    
    self.rightViewFrame = CGRectMake(viewWeight, 0, viewWeight, ViewHeight);
    
    self.rightImageFrame = CGRectMake(5, 10, 40, 40);
    
    CGFloat rightnameX = CGRectGetMaxX(self.leftImageFrame) + 3;
    self.rightNameFrame = CGRectMake(rightnameX, 10, viewWeight - rightnameX, 12);
    
    CGFloat rightserverY = CGRectGetMaxY(self.leftNameFrame) + 5;
    self.rightServerFrame = CGRectMake(rightnameX, rightserverY + 2, 20, 10);
    
    CGFloat rightdiscountX = CGRectGetMaxX(self.leftServerFrame) + 3;
    self.rightDiscountFrame = CGRectMake(rightdiscountX, rightserverY, 20, 15);
    
    
    
    
    CGFloat lineY = CGRectGetMaxY(self.rightViewFrame);
    self.lineFrame = CGRectMake(0, lineY, mScreenWidth, 1);
    
    self.cellHeight = CGRectGetMaxY(self.lineFrame);
}

@end
