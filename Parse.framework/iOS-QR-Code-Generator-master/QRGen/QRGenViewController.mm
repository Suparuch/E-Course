//
//  QRGenViewController.m
//  QRGen
//
//  Created by Patrick Hogan on 7/26/11.
//  Copyright 2011 Kuapay LLC. All rights reserved.
//

#import "QRGenViewController.h"
#import "FileManager.h"

#import "Barcode.h"

@implementation QRGenViewController
@synthesize imageView;


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *code = @"1001012023034";
    
    Barcode *barcode = [[Barcode alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [barcode setupQRCode:code];
    self.imageView.image = barcode.qRBarcode;

//    Uncomment for one dimensional code 128 barcode.
//    [barcode setupOneDimBarcode:code type:CODE_128];
//    self.imageView.image = barcode.oneDimBarcode;

//    Uncomment for one dimensional ean 13 barcode.
//    [barcode setupOneDimBarcode:code type:EAN_13];
//    self.imageView.image = barcode.oneDimBarcode;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    self.imageView = nil;
}



- (void)dealloc
{
    [super dealloc];
    [imageView release];
}


@end
