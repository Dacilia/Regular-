//
//  ExtractTableController.m
//  正则表达式
//
//  Created by 李达志 on 2018/3/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "ExtractTableController.h"

@interface ExtractTableController ()
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) NSArray * regularItems;
@end

@implementation ExtractTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray=@[@"提取小名的小啊小，打死到陈丁曼几点的小啊大"];
    self.regularItems=@[@"陈丁曼"];




}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
    }
    
    cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self regularStr:[self.regularItems objectAtIndex:indexPath.row] originStr:[self.titleArray objectAtIndex:indexPath.row]];
}
-(void)regularStr:(NSString*)regularStr originStr:(NSString*)originStr{
    NSRegularExpression*rep=[[NSRegularExpression alloc]initWithPattern:regularStr options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray*array=[rep matchesInString:originStr options:0 range:NSMakeRange(0, originStr.length)];
    for (NSTextCheckingResult*result in array) {
        NSRange range=result.range;
        NSLog(@"%@",[originStr substringWithRange:range]);
    }
    [rep enumerateMatchesInString:originStr options:0 range:NSMakeRange(0, originStr.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        NSLog(@"%@",[originStr substringWithRange:result.range]);
    }];
}


@end
