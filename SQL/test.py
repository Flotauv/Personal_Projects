## Libraries to import

import mysql.connector




## Connection au serveur SQL 

connecteur = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = '@SQLserveur',
    database= 'DLC'
)

cursor = connecteur.cursor()

