//
//  ViewController.m
//  Score Keeper
//
//  Created by Egan Anderson on 4/28/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scroll;
@property (nonatomic, strong) NSMutableArray *scoreLabels;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];

    
    float scrollHeight = self.view.frame.size.height;
    float scrollWidth = self.view.frame.size.height;
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollWidth, scrollHeight)];
    self.title = @"Score Keeper";
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scroll];
    for(int i = 0; i < 5; i++){
    [self addScoreView:i];
    }
    
    
    
}
- (void)addScoreView:(int)index{
    float scrollWidth = self.view.frame.size.height;
    float labelHeight = 50;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, index*labelHeight, scrollWidth, labelHeight)];
    view.backgroundColor = [UIColor whiteColor];
    UITextField *name = [[UITextField alloc] initWithFrame:CGRectMake(5, 18, 100, 15)];
    //name.backgroundColor = [UIColor whiteColor];
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 11, 40, 30)];
    scoreLabel.backgroundColor = [UIColor yellowColor];
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(211, 11, 100, 100)];
    [view addSubview:name];
    [view addSubview:scoreLabel];
    [view addSubview:stepper];
    stepper.maximumValue = 10;
    stepper.minimumValue = -10;
    name.placeholder = @"enter name";
    [stepper addTarget:self action:@selector(getStepperValue:) forControlEvents:UIControlEventValueChanged];
    [self.scroll addSubview:view];
   
    stepper.tag = index;
    [self.scoreLabels addObject:scoreLabel];
    
}

-(void)getStepperValue:(UIStepper *)stepper{
    
    NSInteger index = stepper.tag;
    UILabel *scoreLabel = self.scoreLabels[index];
    scoreLabel.text = [NSString stringWithFormat: @"%f", stepper.value];
    NSLog(scoreLabel.text);
    
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
