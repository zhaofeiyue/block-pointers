//
//  OtherViewController.m
//  block从基础到精通
//
//  Created by 赵飞跃 on 16/10/10.
//  Copyright © 2016年 赵飞跃. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController
void fun(int a){
    
    NSLog(@"hello ,world");
    NSLog(@"异类参数-- %d",a);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.stringxing (@"hahah");
    // Do any additional setup after loading the view.
}
/*
 下载数据
 函数指针  :指向函数的指针，指针里保存的是函数的地址
 构成 ：返回值 +  （*变量名）+ （参数列表）
 注意 ： *是函数指针的特有标示
 
 */
- (void)FunPonters{
    void(*hahahsmida)(int a) = fun;//此处的fun 是相当于调内联块时 ，块指针去寻找 函数实现，
    hahahsmida(6);// 这里相当于 带着参数 传给fun
}

- (void)hahah :(void(^ )(NSString *error)) error{//相当于初始化block
    NSString *hehe = @"卧槽，就那么成了";
    error(hehe); // 这里相当于 带着参数 传给fun
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
