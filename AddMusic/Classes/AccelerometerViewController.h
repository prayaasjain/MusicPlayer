//
//  AccelerometerViewController.h
//  AddMusic
//
//  Created by Akhil Khemani on 06/05/14.
//
//

#import <UIKit/UIKit.h>

@interface AccelerometerViewController : UIViewController<UIAccelerometerDelegate> {
    IBOutlet UILabel *xLabel;
	IBOutlet UILabel *yLabel;
	IBOutlet UILabel *zLabel;
	NSMutableArray *plots;
	NSMutableArray *totals;
}

@property(nonatomic, retain) NSMutableArray *plots;
@property(nonatomic, retain) NSMutableArray *totals;
@property(nonatomic, retain) UIAccelerometer *accel;
-(IBAction)screenTouched;

@end
