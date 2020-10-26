# BodyFat Calculator UserGuide
STAT 628 GROUP PROJECT

originally created by Jingshan Huang, Xiaotian Wang and Yuanyou Yao

## How to use this calculator?

1. Open your browser and go to this link: http://dashan0313.shinyapps.io/first_try_app

2. Measure some body data that our algorithm needs for calculating your body fat. 

    In order to get a precise result, we need
    
        Abdomen 2 circumference (cm)  
        Weight (lbs)  
        Wrist circumference (cm)  
        Forearm circumference (cm)  
        Neck circumference (cm)  
        Age (years)  
        Thigh circumference (cm)  
        Knee circumference (cm)  
        Hip circumference (cm)  
        Chest circumference (cm)  
        
    Measurement standards are listed in Benhke and Wilmore (1974), pp. 45-48 where, for instance, the abdomen 2 circumference is measured "laterally, at the level of the iliac crests, and anteriorly, at the umbilicus." 

3. Click on the blue "calculate" bottom, you will see your estimated body fat result in the following box.

## Here is what the app looks like
![image](https://github.com/dashan0313/BodyFat/blob/master/image/app_shot.png)

## Some explanations for files in code/

1.run modeling.R and you will get our model and some statistical inference. What's more, some relevent analysis images will be saved in image/

2.run shortreport.Rmd, which creates a shortreport.pdf, a summary version of the report.
