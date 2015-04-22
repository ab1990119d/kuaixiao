//
//  AutoFormView.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/17.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//   自定义表单的视图展示
#define PHONTO_VIEW_HEIGHT 140
#define LADBL_HEIGHT 20
#define TEXT_FIELD_HEIGHT 80
#define NORMAL 30

#import <UIKit/UIKit.h>
#import "KSVisitrecord.h"
#import "FormField.h"
#import "NetWorkUtil.h"
#import "MessagePhotoView.h"
#import "LXHTextFieldView.h"
#import "FormFieldItem.h"
#import "SelectView.h"
#import "QRadioButton.h"
#import "AppUtiles.h"
#import "PicOperation.h"
#import "FormFieldSubmit.h"

@protocol AutoFormViewDelegate <NSObject>

@optional
-(void)addPicker:(UIImagePickerController *)picker; 

@end

@interface AutoFormView : UIView<MessagePhotoViewDelegate,UIActionSheetDelegate,MyNavigationBarDelegate,QRadioButtonDelegate,SelectViewDelegate,UITextFieldDelegate,LXHTextFieldDelegate>

@property (nonatomic, assign) id <AutoFormViewDelegate> delegate;

@property (nonatomic ,strong) NSArray *formFields;
@property (nonatomic ,strong) FormField *formField;
@property (nonatomic ,strong) NSMutableArray *imageFields;
@property (nonatomic , strong)NSString *formDefId; 

@property (nonatomic)CGFloat height;


-(void)initDataView;
//上传照片
-(void)uploadImages;
-(BOOL)fileValidate;

@end
