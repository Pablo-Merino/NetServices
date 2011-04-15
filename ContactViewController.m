//
//  ContactViewController.m
//  iNET
//
//  Created by Pablo Merino on 19/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"


@implementation ContactViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
- (void)viewDidLoad {
    [super viewDidLoad];
	[scroller setScrollEnabled:YES];
	[scroller setContentSize:CGSizeMake(320, 370)];
}
-(IBAction)sendmemail:(id)sender {
	MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setToRecipients:[NSArray arrayWithObjects:@"pablo.perso1995@gmail.com",nil]];
    [controller setSubject:@"I want to tell you something:"];
    [controller setMessageBody:[NSString stringWithFormat:@""]isHTML:NO];
    [self presentModalViewController:controller animated:YES];
    [controller release];
}
-(IBAction)sendemail:(id)sender {
	NSString *mrAPI = [NSString stringWithFormat:@"http://ifconfig.me/ip"];
	NSString *trimURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:mrAPI]
												 encoding:NSASCIIStringEncoding
													error:nil];
	
		NSString *ipaddress = [NSString stringWithFormat:@"My IP info: %@", trimURL];
	MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
	controller.mailComposeDelegate = self;
	[controller setToRecipients:[NSArray arrayWithObjects:nil]];
	[controller setSubject:@"IP Adddress"];
	[controller setMessageBody:[NSString stringWithFormat:ipaddress]isHTML:NO];
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
}
	
/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
