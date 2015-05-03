//
//  ViewController.m
//
//  Created by Marek Helak on 15/04/15.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize locationManager, compass;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runLocationManager];
}

//Set Location Manager
- (void)runLocationManager {
  
    locationManager=[[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.headingFilter = 1;
    locationManager.delegate=self;
    [locationManager startUpdatingHeading];
}

//Event when update is heading
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    float oldRadian =  -manager.heading.trueHeading * M_PI / 180.0f;
    float newRadian =  -newHeading.trueHeading * M_PI / 180.0f;
  
    CABasicAnimation *animation;
    animation=[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.fromValue = [NSNumber numberWithFloat:oldRadian];
    animation.toValue=[NSNumber numberWithFloat:newRadian];
    animation.speed = 5.0f;
    animation.duration = 0.75f;
    
    [compass.layer addAnimation:animation forKey:@"rotate"];
    compass.transform = CGAffineTransformMakeRotation(newRadian);
}

@end
