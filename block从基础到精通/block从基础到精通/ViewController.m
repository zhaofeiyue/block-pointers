//
//  ViewController.m
//  block从基础到精通
//
//  Created by 赵飞跃 on 16/9/27.
//  Copyright © 2016年 赵飞跃. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"
@interface ViewController ()
@property (nonatomic, strong)NSString *string ;
@property (nonatomic, assign) NSUInteger texstIndex ;
@property (nonatomic, strong) NSObject* obj;
@end

typedef void (*ABExternalChangeCallback)(CFDictionaryRef info, void *context);
//起别名
typedef int myInt;
typedef int  老王;
typedef void (^myBlock1)(int a);
//别名构成  原来的 block 变量的位置被 block 别名取代
//        返回值 + （^别名） + （参数列表）；
typedef int(^sumBlock)(int a , int b) ;
typedef int(^myBlock2)(int a, int b, int c);
typedef int (^myblock3)(int a ,int b);
typedef int (^ youHHHBlock) (int a,int b );
@implementation ViewController

//void fun(int a){
//    
//    NSLog(@"hello ,world");
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self blockDemos];
    [self hahah:^(NSString *error) {
        NSLog(@"%@",error);
    }];
    OtherViewController *other = [[OtherViewController alloc]init];
    //利用内联块实现反向传值 不同类之间的数据传递
    [other hahah:^(NSString *error) {//相当于 block 实现 相当于带着参数 来到了“fun”函数实现 fun函数中可以利用参数实现东西;
        NSLog(@"%@",error);
    }];
    
    //利用函数指针实现的 不同类之间的传值
//    [other FunPonters];
    
    //[self __blockActionsDemo];
    // Do any additional setup after loading the view, typically from a nib.
}
void fun1(int a){
    
    NSLog(@"hello ,world");
    
}
//基础知识的 demo
- (void)blockDemos{
    
  //返回值类型 （^ block的名称）（参数）
    void(^myHaha) ()= ^{
        
    };
    
    myHaha = ^{
        int er = 15;
        er = 14;
    };
    //NSLog(@"%@",myHaha);
    int (^ hahasmia)( int a) = ^(int a){
        return a ;
    };
    int ss = hahasmia(5);
    NSLog(@"%d",ss);
    
    int (^bianliangming) (int a,int b) ;
    bianliangming = ^(int a,int b){
        return a +b;
    };
    //通过 类型定义 （type definition）
    youHHHBlock block = ^ (int a, int b){
       
        return  a + b;
    };
    block(1,4);
    
    //
    
     OtherViewController *other = [[OtherViewController alloc]init];
    //可以把 这里面的值 传到第二个类 ，相反的你可以 反过来传
    other.stringxing = ^(NSString *a){
        NSLog(@"我就看你出来么-- %@",a);
        self.string = @"haha";
       
    };
//    sleep(1);
//    [self.navigationController pushViewController:other animated:YES];
    
    // 关于 block里会出现循环引用的问题， 示例 假如想在block跳转到下一页
    
    __weak OtherViewController *MYOTHER = other;//弱化其中一个对象 防止循环引用
    youHHHBlock block1 = ^ (int a, int b){
        //[self.navigationController pushViewController:other animated:YES];  //直接用other对象会产生循环引用
        [self.navigationController pushViewController:MYOTHER animated:YES];
        return  a + b;
    };
    block1(1,4);
    
    self.obj = [NSObject new];
    __block NSUInteger index;
    youHHHBlock block3 = ^ (int a, int b){
        index += 1;
        _texstIndex = index;
        NSLog(@"%lu",_texstIndex);
        [self textBlock:_obj];
        return  a + b;
    };
    block3(1,4);

    NSString *str = @"AAAAB3NzaC1yc2EAAAADAQABAAABAQDuVylcFmI2G/Ao4MsRygJ4o0zahpkBpUg93pBxwF2tl2sLtPJKrooCN14WFdBDgLU/P12LW/LeW33W5RFtor1dxURA+WnkgQTKOqjzI2K8nhlg0UIbbyLUotbvV1MXyrcbLT8YDNoxWbqxGPy6l3lS2f6AKvRjq4lk0oPgnpo10IIDRPvUZbMViSqFLstlzRIyebyW8cwdkYmtkDlIEjI6pZGwfqqu+PyLRU/JSMHJgtQmjTWjiTUICFW6iShpIKMtyHkuke26QjT3O6B01VMWYX2qMzOpimPZBYtMtyg8crHkjCG7gT0cIzB3//Rgz9cQ3VCQ+Uzml8iGOEXX/tED zhaofeiyue@zhaofeiyuedeMacBook-Pro.local";
    NSLog(@"这是我的第一个开源库的ssh%@",str);
}
- (void)textBlock : (id)obj{
    
}
/*
 下载数据
 函数指针  :指向函数的指针，指针里保存的是函数的地址
 构成 ：返回值 +  （*变量名）+ （参数列表）
 注意 ： *是函数指针的特有标示
*/
#pragma mark -- 曾经的教程
- (void)initialBlockdemo{
    void(*funp)(int a)= fun1;
    //调用 方法函数 指针变量 + （实参列表）
    funp(4);
    myblock3 block3 = ^int(int a,int b){
        return a + b;
    };
    int a = block3(1,2);
    NSLog(@"a=%d",a);
    //block
    // 定义； 指向代码块的的指针，指针里保存的是代码块的地址。
    // 构成  返回值  (^变量名) +(参数)
    //  void (^myBlock)(int a);
    
    
    
    //代码块？
    // 构成：^ + 返回值 + （参数列表）+{ 功能的实现 } + ；
    //        ^void(int a){
    //
    //
    //        };
    //声明定义初始化了一个block
    myBlock1 blooc  = ^void(int a){
        
        NSLog(@"a:%i",a);
    };
    //注意:1. block的返回值与参数 要与代码块的一一对应
    //    2. 在创建block 时参数尽量写上名字
    //    3. 必须要通过调用block 变量  代码块才会执行，否则永远不执行
    // 调用   构成 block 变量+ （参数列表）
    blooc(6);
    //起别名
    
    myBlock2 block2 = ^int (int a, int b, int c){
        
        return a*b*c;
    };
    int hah = block2(1,2,3);
    NSLog(@"%i",hah);
    //求两个数 和
    
    //        int(^sumBlock)(int a , int b)
    sumBlock mysumBlock = ^int(int a, int b){
        return a+b ;
    };
    int sum = mysumBlock(2,5);
    NSLog(@"sum:%i",sum);
    
//    int aa = 5;
//    void (^tempBlock)(int c);
    //_block 变量 外部的变量只有变成 __block变量后才能在代码快中应用，否则只能简单使用，
    
    //总结 block 作用 ：可以提高程序的效率
    // 场景 : 数组排序 转场 ，反向传值， 动画，自定义，控件 （按钮），与GCD配合使用
    
    //使用block 进行数组排序，
    
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"fanbingbing",@"libing",@"gaoyuanyuan",@"zhouxun",@"liuyifei",@"lizhiling", nil];
    //注意： 通过block 我们需要给数组排序指定交换条件
    //升序排列
    [ array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2]== NSOrderedDescending;
    }];
    
    //       NSComparisonResult hehe = [array[1]compare:array[0]];
    NSLog(@"array:%@",array);
    //        NSLog(@"%ld  ",hehe);
}
- (void)hahah :(void(^ )(NSString *error)) error{
    NSString *hehe = @"hhhhh";
    error(hehe);
}
#pragma mark 关于__block 的讲解用法
- (void)__blockActionsDemo{
    
    int a = 0;
    void (^blo)() = ^{
        NSLog(@"Input:b=%d",a);
    };
    a = 3;
    blo();
    /**
     *    Input:b=0
     */
    //错误示例， 可打开
//    int b = 0;
//    void (^blo)() = ^{
//        b = 3;
//    };
    // 正确示例
    __block int b = 0;// __block的原理作用其实就是复制了一下外部变量的指针，从而可以使之通过指针改变外部变量,在没有用__block 的时候 指针在栈里 会被销毁之类的，置于更深的还需探讨；
    void (^blo1)() = ^{
        b = 3;
    };
    NSLog(@"前result == %d",b);
    blo1();
    NSLog(@"后result == %d",b);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
