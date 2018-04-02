//
//  PredicateTableController.m
//  正则表达式
//
//  Created by 李达志 on 2018/3/14.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "PredicateTableController.h"
#import "Person.h"
@interface PredicateTableController ()<UITextFieldDelegate>
@property (nonatomic,strong) NSMutableArray * titlesItems;
@property (nonatomic,copy)   NSString * regularStr;
@property (nonatomic,weak)   UITextField * textfield;
@end

@implementation PredicateTableController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField*textfield=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    textfield.delegate=self;
    textfield.backgroundColor=[UIColor orangeColor];
    self.textfield=textfield;
    //^[0-9]*$用来判断输入框输入的是不是数字
    //^[\u4e00-\u9fa5]*$判断输入的是否是汉字
    // 主要是在
    NSArray *array=@[@"^[0-9]+$",@"^[0-9]*$",@"^[\u4e00-\u9fa5]*$",@"测试一下NSPredicate"];
    self.titlesItems=[NSMutableArray arrayWithArray:array];
    [self.view addSubview:textfield];


}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.titlesItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDCELL"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IDCELL"];
    }
    cell.textLabel.text=[self.titlesItems objectAtIndex:indexPath.row];

    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self testNSPredicate];
    self.regularStr=[self.titlesItems objectAtIndex:indexPath.row];
}

/**
 UITextField 代理方法

 @param textField textField description
 @param range 输入或者是删除的文字 range
 @param string 输入或者删除的文字
 @return YES可以编辑NO不可以编辑
 */
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // NSPredicate 参考http://www.cocoachina.com/ios/20160111/14926.html
    NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regularStr];
    return [numberPredicate evaluateWithObject:string];
}
-(void)testNSPredicate{
    NSArray*array=@[[Person personWithName:@"jsonname" sex:@"男" age:@"25"],[Person personWithName:@"json" sex:@"男" age:@"25"],[Person personWithName:@"name" sex:@"男" age:@"25"],[Person personWithName:@"jsonnam" sex:@"男" age:@"25"]];
    NSPredicate*pre=[NSPredicate predicateWithFormat:@"name CONTAINS 'name'"];
    NSArray*newArray=[array filteredArrayUsingPredicate:pre];
    NSLog(@"%@",newArray);
}
@end
