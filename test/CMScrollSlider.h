
#import <UIKit/UIKit.h>

@class CMScrollSlider;

@protocol CMScrollSliderDelegate <NSObject>

-(void)CMScrollSlider:(CMScrollSlider *)slider ValueChange:(int )value;
-(void)CMScrollSliderMove:(CMScrollSlider *)slider ValueChange:(int )value;
@optional
-(void)CMScrollSliderDidTouch:(CMScrollSlider *)slider;

@end

@interface CMScrollSlider : UIView

@property (nonatomic, assign ,readonly) int minValue;
@property (nonatomic, assign ,readonly) int maxValue;
@property (nonatomic, assign ,readonly) int step;
@property (nonatomic, weak) id<CMScrollSliderDelegate> delegate;


@property (nonatomic, strong) UILabel      *valueTF;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView      *redLine;

@property (nonatomic, assign) float realValue;

-(void)setRealValue:(float)realValue Animated:(BOOL)animated;

-(instancetype)initWithFrame:(CGRect)frame MinValue:(int)minValue MaxValue:(int)maxValue Step:(int)step;

@end
