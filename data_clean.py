import pandas as pd

df=pd.read_csv('customer_shopping_behavior.csv')
#print(df.columns)
#print(df.size())
df.columns=df.columns.str.strip().str.lower()
df.columns=df.columns.str.replace(' ', '_')
df=df.rename(columns={'purchase_amount_(usd)': 'purchase_amount'})
#print(df.columns)
#print(df[['customer_id', 'purchase_amount']].head(10))
#print(df.isnull().sum())
#print(df[['category', 'review_rating']].head(10))
df['review_rating']=df.groupby('category')['review_rating'].transform(lambda x:x.fillna(x.mean()))
#print(df.isnull().sum())
#print(df[['category', 'review_rating']].head(10))

print((df['discount_applied']==df['promo_code_used']).all())
df.drop('promo_code_used',axis=1)
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
df['purchase_gap_days']=df['frequency_of_purchases'].map(frequency_days)
print(df.isnull().sum())
print(df.head(50))
df.to_csv('E:\\Project_2\\Customer_Shopping_Analysis\\customer_shopping_behavior_cleaned.csv',index=False)
df.to_excel('E:\\Project_2\\Customer_Shopping_Analysis\\customer_shopping_behavior_cleaned.xlsx',index=False)