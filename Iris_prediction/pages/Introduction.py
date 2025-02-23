import streamlit as st 




# --- Title ---

st.title("Les Fleurs") 

# --- Création colonnes ---

col1,col2 = st.columns(2,gap="small")

with col1:
    st.image("Iris_prediction/images/sepale.jpg",width=300)
with col2:
    st.image("Iris_prediction/images/sepale_2.png",width=900)


st.write("\n")
st.subheader(body="Les différents types de fleurs",anchor=False)

st.write("""
         Les différents types de fleurs que nous allons croisés sont 
         
         - Les tulipes
         - Les orchidées
         - Les pétuniats

         """
)