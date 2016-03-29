//
//  ViewController.h
//  Braille2English
//
//  Created by Vinod Rathod on 09/03/16.
//  Copyright © 2016 Vinod Rathod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *brailleButtons;

-(IBAction)brailleButtonsPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

