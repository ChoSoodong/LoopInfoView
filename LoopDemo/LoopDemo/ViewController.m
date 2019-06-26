//
//  ViewController.m
//  LoopDemo
//
//  Created by xialan on 2019/6/26.
//  Copyright © 2019 xialan. All rights reserved.
//

#import "ViewController.h"
#import "LoopManager.h"


@interface ViewController ()

/** <#  #> */
@property (nonatomic, strong) LoopManager *loop;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loop = [[LoopManager alloc] initWithFrame:CGRectMake(0, 300, 375, 60)];
    _loop.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_loop];
    
    _loop.dataSource = self.dataSource;
    
    
}


-(NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] initWithCapacity:10];
        for (NSInteger i = 0; i < 10; i++) {
            NSString *title = [NSString stringWithFormat:@"测试数据第%zd条",i];
            [_dataSource addObject:title];
        }
    }
    return _dataSource;
}

@end
