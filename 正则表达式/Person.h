//
//  Person.h
//  正则表达式
//
//  Created by 李达志 on 2018/3/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * sex;
@property (nonatomic,copy) NSString * age;
+(instancetype)personWithName:(NSString*)name sex:(NSString*)sex age:(NSString *)age;
@end
