







#import "LoopManager.h"
#import "LoopInfoView.h"

@interface LoopManager(){
    NSInteger _count; //数据个数
    NSInteger _index; //取值索引
}

/** 第一条 */
@property (nonatomic, strong) LoopInfoView *topInfoView;
/** 第二条 */
@property (nonatomic, strong) LoopInfoView *downInfoView;



@end

@implementation LoopManager

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _topInfoView = [[LoopInfoView alloc] initWithFrame:self.bounds];
        [self addSubview:_topInfoView];
        
        _downInfoView = [[LoopInfoView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topInfoView.frame), self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_downInfoView];
        
        self.layer.masksToBounds = YES;
        
        
    }
    return self;
}


-(void)start{
    
    CGFloat height = self.bounds.size.height;
 
    _topInfoView.text = _dataSource[_index % _count];//0
    _downInfoView.text = _dataSource[++_index % _count];//1
    
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:3 animations:^{
        
        weakSelf.topInfoView.transform = CGAffineTransformMakeTranslation(0, -height);
        weakSelf.downInfoView.transform = CGAffineTransformMakeTranslation(0,-height);
        
    } completion:^(BOOL finished) {
        
        weakSelf.topInfoView.text = weakSelf.dataSource[self->_index % self->_count];//1
        weakSelf.downInfoView.text = weakSelf.dataSource[++self->_index % self->_count];//2
        
        self.topInfoView.transform = CGAffineTransformIdentity;
        self.downInfoView.transform = CGAffineTransformIdentity;
        --self->_index;
        
        //开启无限滚动
        [self start];
    }];
    
}

-(void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    
    _count = dataSource.count;
    
    if (dataSource.count > 2) {
        //赋默认值
        _topInfoView.text = dataSource[0];
        _downInfoView.text = dataSource[1];
    }
    
    //开始滚动
    [self start];
   
}

@end
