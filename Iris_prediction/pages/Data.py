import streamlit as st 
from sklearn.datasets import load_iris
# --- Title ---


st.title("Découverte des données")


# --- DataBase 

db = load_iris()

st.dataframe(db)


  