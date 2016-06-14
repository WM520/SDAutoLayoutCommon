//
//  PDMessageModel.h
//  消息界面
//
//  Created by David on 16/6/14.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDMessageModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * iconUrl;
@property (nonatomic, copy) NSString * time;
@property (nonatomic, copy) NSString * content;

@end
