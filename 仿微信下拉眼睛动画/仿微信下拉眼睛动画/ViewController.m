//
//  ViewController.m
//  仿微信下拉眼睛动画
//
//  Created by use on 16/2/24.
//  Copyright © 2016年 wjp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSArray *dataArray;



@property (strong, nonatomic) CAShapeLayer *eyeFirstLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeSecondLightLayer;
@property (strong, nonatomic) CAShapeLayer *eyeballLayer;
@property (strong, nonatomic) CAShapeLayer *topEyesocketLayer;
@property (strong, nonatomic) CAShapeLayer *bottomEyesocketLayer;

@property CGRect frame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _frame = CGRectMake(0, 0, 375, 200);
    NSArray *arr = @[@"咖啡", @"牛奶", @"绿茶", @"可乐", @"粥"];
    self.dataArray = arr;
    self.view.backgroundColor = [UIColor blackColor];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -200, self.view.frame.size.width, 200)];
    headerView.backgroundColor = [UIColor blackColor];
    
    [headerView.layer addSublayer:self.eyeFirstLightLayer];
    [headerView.layer addSublayer:self.eyeSecondLightLayer];
    [headerView.layer addSublayer:self.eyeballLayer];
    [headerView.layer addSublayer:self.topEyesocketLayer];
    [headerView.layer addSublayer:self.bottomEyesocketLayer];
    self.tableView.tableHeaderView = headerView;

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupAnimation];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAShapeLayer *)eyeFirstLightLayer {
    if (!_eyeFirstLightLayer) {
        _eyeFirstLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
//                                                            radius:CGRectGetWidth(self.frame) * 0.2
                                                            radius:25
                                                        startAngle:(230.f / 180.f) * M_PI
                                                          endAngle:(265.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeFirstLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeFirstLightLayer.lineWidth = 5.f;
        _eyeFirstLightLayer.path = path.CGPath;
        _eyeFirstLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeFirstLightLayer;
}

- (CAShapeLayer *)eyeSecondLightLayer {
    if (!_eyeSecondLightLayer) {
        _eyeSecondLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
//                                                            radius:CGRectGetWidth(self.frame) * 0.2
                                                            radius:25
                                                        startAngle:(211.f / 180.f) * M_PI
                                                          endAngle:(220.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeSecondLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeSecondLightLayer.lineWidth = 5.f;
        _eyeSecondLightLayer.path = path.CGPath;
        _eyeSecondLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeSecondLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeSecondLightLayer;
}

- (CAShapeLayer *)eyeballLayer {
    if (!_eyeballLayer) {
        _eyeballLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
//                                                            radius:CGRectGetWidth(self.frame) * 0.3
                                                            radius:30
                                                        startAngle:(0.f / 180.f) * M_PI
                                                          endAngle:(360.f / 180.f) * M_PI
                                                         clockwise:YES];
        _eyeballLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeballLayer.lineWidth = 1.f;
        _eyeballLayer.path = path.CGPath;
        _eyeballLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeballLayer.strokeColor = [UIColor whiteColor].CGColor;
        _eyeballLayer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return _eyeballLayer;
}

- (CAShapeLayer *)topEyesocketLayer {
    if (!_topEyesocketLayer) {
        _topEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame) / 2)];
                [path moveToPoint:CGPointMake(120, CGRectGetHeight(self.frame) / 2)];
//        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2)
//                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y - center.y - 20)];
        [path addQuadCurveToPoint:CGPointMake(255, CGRectGetHeight(self.frame) / 2)
                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y - 30 - 40)];
        
        _topEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _topEyesocketLayer.lineWidth = 1.f;
        _topEyesocketLayer.path = path.CGPath;
        _topEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _topEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _topEyesocketLayer;
}

- (CAShapeLayer *)bottomEyesocketLayer {
    if (!_bottomEyesocketLayer) {
        _bottomEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) / 2);
        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame) / 2)];
//        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) / 2)
//                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y + center.y + 20)];
        [path moveToPoint:CGPointMake(120, CGRectGetHeight(self.frame) / 2)];
        [path addQuadCurveToPoint:CGPointMake(255, CGRectGetHeight(self.frame) / 2)
                     controlPoint:CGPointMake(CGRectGetWidth(self.frame) / 2, center.y + 30 + 40)];

        
        _bottomEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _bottomEyesocketLayer.lineWidth = 1.f;
        _bottomEyesocketLayer.path = path.CGPath;
        _bottomEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _bottomEyesocketLayer;
}


- (void)setupAnimation {
    self.eyeFirstLightLayer.lineWidth = 0.f;
    self.eyeSecondLightLayer.lineWidth = 0.f;
    self.eyeballLayer.opacity = 0.f;
    _bottomEyesocketLayer.strokeStart = 0.5f;
    _bottomEyesocketLayer.strokeEnd = 0.5f;
    _topEyesocketLayer.strokeStart = 0.5f;
    _topEyesocketLayer.strokeEnd = 0.5f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat flag = -self.frame.size.height/2-30;
    CGFloat y = scrollView.contentOffset.y;
    if (y < flag) {
        if (self.eyeFirstLightLayer.lineWidth < 5.f) {
            self.eyeFirstLightLayer.lineWidth += 1.f;
            self.eyeSecondLightLayer.lineWidth += 1.f;
        }
    }
    if (y < flag-20) {
        if (self.eyeballLayer.opacity < 1.f) {
            self.eyeballLayer.opacity += 0.1f;
        }
    }
    if (y < flag-40) {
        if (self.topEyesocketLayer.strokeEnd < 1.f && self.topEyesocketLayer.strokeStart > 0.f) {
            self.topEyesocketLayer.strokeEnd += 0.1f;
            self.topEyesocketLayer.strokeStart -= 0.1f;
            self.bottomEyesocketLayer.strokeEnd += 0.1f;
            self.bottomEyesocketLayer.strokeStart -= 0.1f;
        }
    }
    
    if (y > flag-40) {
        if (self.topEyesocketLayer.strokeEnd > 0.5f && self.topEyesocketLayer.strokeStart < 0.5f) {
            self.topEyesocketLayer.strokeEnd -= 0.1f;
            self.topEyesocketLayer.strokeStart += 0.1f;
            self.bottomEyesocketLayer.strokeEnd -= 0.1f;
            self.bottomEyesocketLayer.strokeStart += 0.1f;
        }
    }
    if (y > flag-20) {
        if (self.eyeballLayer.opacity > 0.f) {
            self.eyeballLayer.opacity -= 0.1f;
        }
    }
    if (y > flag) {
        if (self.eyeFirstLightLayer.lineWidth > 0.f) {
            self.eyeFirstLightLayer.lineWidth -= 1.f;
            self.eyeSecondLightLayer.lineWidth -= 1.f;
        }
    }
}

@end
