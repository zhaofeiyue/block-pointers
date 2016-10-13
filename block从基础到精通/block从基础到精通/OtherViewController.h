//
//  OtherViewController.h
//  block从基础到精通
//
//  Created by 赵飞跃 on 16/10/10.
//  Copyright © 2016年 赵飞跃. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherViewController : UIViewController
{
    
}
@property (nonatomic, copy)void (^stringxing) (NSString * a) ;
- (void)hahah :(void(^ )(NSString *error)) error;
- (void)FunPonters;

@end
