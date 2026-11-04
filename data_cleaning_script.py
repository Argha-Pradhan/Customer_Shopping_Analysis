import pandas as pd

df=pd.read_csv('customer_shopping_behavior.csv')
#print(df.columns) //Checking the column names of the dataset
#print(df.size())// checking the size of the dataset
df.columns=df.columns.str.strip().str.lower()
df.columns=df.columns.str.replace(' ', '_')
df=df.rename(columns={'purchase_amount_(usd)': 'purchase_amount'})

#print(df.isnull().sum()) //Checking for null values in the dataset

df['review_rating']=df.groupby('category')['review_rating'].transform(lambda x:x.fillna(x.mean()))
#print(df.isnull().sum()) //Checking for null values in the dataset after filling the missing values in review_rating column


print((df['discount_applied']==df['promo_code_used']).all())
df=df.drop('promo_code_used',axis=1) # Dropping the promo_code_used column as it is redundant with discount_applied column
print(df[['frequency_of_purchases']].groupby('frequency_of_purchases').size())

frequency_days={
    "Annually"          : 365,
    "Bi-Weekly"         : 3.5,
    "Every 3 Months"    : 90,
    "Fortnightly"       : 14,
    "Monthly"           : 30,
    "Quarterly"         : 90,
    "Weekly"            : 7 

}
df['purchase_gap_days']=df['frequency_of_purchases'].map(frequency_days) # Mapping the frequency_of_purchases column to the corresponding number of days and creating a new column purchase_gap_days
print(df.isnull().sum())
print(df.head(50))
# Saving the cleaned dataset to a new CSV and Excel file
df.to_csv('customer_shopping_behavior_cleaned.csv',index=False)
df.to_excel('customer_shopping_behavior_cleaned.xlsx',index=False)