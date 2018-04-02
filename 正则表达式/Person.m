//
//  Person.m
//  正则表达式
//
//  Created by 李达志 on 2018/3/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "Person.h"

@implementation Person
+(instancetype)personWithName:(NSString *)name sex:(NSString *)sex age:(NSString *)age{
    Person*person=[[Person alloc]init];
    person.name=name;
    person.sex=sex;
    person.age=age;
    return person;
}
@end
