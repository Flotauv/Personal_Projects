
import streamlit as st


#Page Setup

about_page_intro = st.Page(
    page='pages/Introduction.py',
    title="Les fleurs  ",
    #icon = ":material/account_circle:",
    default=True

)

project_iris_page_1 = st.Page(
    page='pages/Data.py',
    title="Découverte des données",
    #icon=':material/bar_chart:',
    
)

# --- Navigation SETUP ---

#pg = st.navigation(pages=[about_page_intro,project_iris_page_1])



# --- Navugation Setup [With sections ] --- 

pg = st.navigation(
    {
        'Info' : [about_page_intro],
        'Données' : [project_iris_page_1]
    }
)





# --- Navigation RUN 

pg.run()















# --- Définition environnement principal --- #
def main():
    print("Hello world")

if main=="__main__":
    main()

    