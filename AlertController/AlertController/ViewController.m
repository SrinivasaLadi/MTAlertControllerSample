//
//  ViewController.m
//  AlertController
//
//  Created by Srinivas on 11/26/15.
//  Copyright © 2015 mtuity. All rights reserved.
//

#import "ViewController.h"
#import "MTAlertController.h"
@interface ViewController ()
- (IBAction)btnAlertWithButtonsPressed:(id)sender;
- (IBAction)btnAlertWithInputText:(id)sender;
- (IBAction)btnAlertWithRenameText:(id)sender;
- (IBAction)btnShowActionSheet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAlertWithButtonsPressed:(id)sender {
    
    [MTAlertController showAlertWithMessage:@"Are you sure do you want to Signout now?" andTitle:@"MTAlertController" andOkButtonTitle:@"Yes" andCancelTitle:@"No" andtarget:self andAlertCancelBlock:^{
        
    } andAlertOkBlock:^(NSString *userName) {
        
    }];
}

- (IBAction)btnAlertWithInputText:(id)sender {
    [MTAlertController showAlertWithEmailText:@"Enter Text which want to rename" withPlaceHolder:@"Please enter text" andTitle:@"Input text " andOkButtonTitle:@"OK" andtarget:self asText:NO andAlertCancelBlock:^{
        
    } andAlertOkBlock:^(NSString *userName) {
        NSLog(@"Input String %@",userName);
    }];
}

- (IBAction)btnAlertWithRenameText:(id)sender {
    
    [MTAlertController showAlertWithEmailText:@"Enter Text which want to rename" withPlaceHolder:@"Please enter text" andTitle:@"Rename text " andOkButtonTitle:@"OK" andtarget:self asText:YES andAlertCancelBlock:^{
        
    } andAlertOkBlock:^(NSString *userName) {
        NSLog(@"Renamed String %@",userName);
    }];
}

- (IBAction)btnShowActionSheet:(id)sender {
    
    [MTAlertController showActionSheetTitles:[NSArray arrayWithObjects:@"Take Photo",@"Choose From Gallery", nil] target:self withCancelBlock:^{
        
    } andAlertOKBlock:^(NSInteger buttonIndex) {
        
        switch (buttonIndex) {
            case 0:
                NSLog(@"Take Photo Clicked");
                break;

            case 1:
                NSLog(@"Choose From Gallery");
                break;

                
            default:
                break;
        }
    }];
}
@end
