    //
    //  ViewController.m
    //  正则表达式
    //
    //  Created by 李达志 on 2018/3/13.
    //  Copyright © 2018年 LDZ. All rights reserved.
    //  关于正则表达式请参考http://www.runoob.com/try/try.php?filename=tryjsref_regexp1
    //  https://www.jianshu.com/p/4b2bad4ad3e8

#import "ViewController.h"
#import "PredicateTableController.h"
#import "ExtractTableController.h"
#import "ReplaceTableController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"正则表达式Demo";
    self.view.backgroundColor=[UIColor whiteColor];
    NSArray * titleArray=@[@"判断包含某个字符串",@"提取符合的字符串",@"替换某些字符串"];
    for (int i=0; i<3; i++) {
        UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        button.frame=CGRectMake(20, i*40+80, 200, 40);
        [self.view addSubview:button];
    }
//

}
-(void)buttonAction:(UIButton*)button{
    switch (button.tag) {
        case 0:{
            PredicateTableController*vc=[[PredicateTableController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            ExtractTableController*vc=[[ExtractTableController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
            ReplaceTableController*vc=[[ReplaceTableController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
