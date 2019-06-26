






#import "LoopInfoView.h"

@interface LoopInfoView()

/** 图片 */
@property (nonatomic, strong) UIImageView *iconImgView;
/** 文字 */
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation LoopInfoView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.iconImgView];
        [self addSubview:self.textLabel];
    }
    return self;
}


#pragma mark - 懒加载
-(UIImageView *)iconImgView{
    if (_iconImgView == nil) {
        _iconImgView = [[UIImageView alloc] init];
        CGFloat h = self.bounds.size.height - 8;
        CGFloat w = h;
        CGFloat x = 8;
        CGFloat y = 4;
        _iconImgView.frame = CGRectMake(x, y, w, h);
        _iconImgView.backgroundColor = [UIColor redColor];
    }
    return _iconImgView;
}

-(UILabel *)textLabel{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.text = @"111112222223333333";
        CGFloat w = self.bounds.size.width - CGRectGetMaxX(self.iconImgView.frame) - 12;
        CGFloat h = self.bounds.size.height;
        CGFloat x = CGRectGetMaxX(self.iconImgView.frame)+4;
        CGFloat y = 0;
        _textLabel.frame = CGRectMake(x, y, w, h);
    }
    return _textLabel;
}

-(void)setText:(NSString *)text{
    _text = text;
    
    _textLabel.text = text;
}

@end
