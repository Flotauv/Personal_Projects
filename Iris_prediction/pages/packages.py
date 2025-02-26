import os 
import streamlit as st 

result = os.popen('pip_list').read()
st.code(result)

print(os.name)