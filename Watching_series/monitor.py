import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


DATABASE = './Database/student_habits_performance.csv'

## Loading Database

df = pd.read_csv(DATABASE,sep=',')

## Describe Data base 





if __name__ =="__main__":

    df = pd.read_csv(DATABASE,sep=',')


print(df)

print(df.describe())





