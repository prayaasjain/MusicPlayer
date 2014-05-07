//
//  AccelerometerViewController.m
//  AddMusic
//
//  Created by Akhil Khemani on 06/05/14.
//
//

#import "AccelerometerViewController.h"

@interface AccelerometerViewController ()

@end

@implementation AccelerometerViewController
@synthesize plots, totals, accel;

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	xLabel.text = [NSString stringWithFormat: @"%f", 100*acceleration.x];
	yLabel.text = [NSString stringWithFormat: @"%f", 100*acceleration.y];
	zLabel.text = [NSString stringWithFormat: @"%f", 100*acceleration.z];
	
	[[self view] setNeedsDisplay];
    
    
    BOOL drawOnlyWhenMoving = NO; //change this if you want it only to update the graph when the movement is over a threshold value
    float minimumAcceleration =0.9f;
    
    if (drawOnlyWhenMoving) {
        if (abs(acceleration.x)+abs(acceleration.y)+abs(acceleration.z) > minimumAcceleration) {
            [self.plots insertObject:acceleration atIndex:0];
            NSNumber *n = [NSNumber numberWithDouble:(fabs(acceleration.x)+fabs(acceleration.y)+fabs(acceleration.z))];
            [self.totals insertObject:n atIndex:0];
            
        }
    }
	else {
        [self.plots insertObject:acceleration atIndex:0];
        NSNumber *n = [NSNumber numberWithDouble:(fabs(acceleration.x)+fabs(acceleration.y)+fabs(acceleration.z))];
        [self.totals insertObject:n atIndex:0];
    }
	
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    accel = [UIAccelerometer sharedAccelerometer];
	[accel setUpdateInterval: 0.01];
	[accel setDelegate:self];
	
	self.plots = [NSMutableArray arrayWithCapacity:100];
	self.totals = [NSMutableArray arrayWithCapacity:100];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
-(IBAction)screenTouched{
	self.plots = [NSMutableArray arrayWithCapacity:100];
	self.totals = [NSMutableArray arrayWithCapacity:100];
	[[self view] setNeedsDisplay];
}



- (void)dealloc {
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
    [super dealloc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
