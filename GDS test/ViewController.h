//
//  ViewController.h
//
//  Created by Marek Helak on 15/04/15.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreFoundation/CoreFoundation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

//Image
@property (weak, nonatomic) IBOutlet UIImageView *compass;

//Location Manager
@property (nonatomic,retain) CLLocationManager *locationManager;

@end

