import pandas as pd
from configparser import ConfigParser
import psycopg2
from sqlalchemy import create_engine


path = "D:\Ambientes\correlaciones_fuentes\\";
engine = create_engine('postgresql+psycopg2://postgres:qwerty@127.0.0.1:5432/correlacion_DB');


def FuncLoadFilesSQL(nombre_tabla,path):
    df_data = pd.read_csv(path + nombre_tabla, low_memory=False);
    v_nombre_tabla = nombre_tabla.rsplit('.', 1)[0];
    df_data.to_sql(v_nombre_tabla, con=engine, if_exists='replace', schema='sc_fuentes_data');
    print("Se cargo el archivo: " + nombre_tabla + ' En la tabla ' +  v_nombre_tabla);
    print(df_data);

with open('file_list.txt') as list:
    for archivo in list:
        print("Cargando el archivo: "+ archivo.rstrip());
        FuncLoadFilesSQL(archivo.rstrip(),path)
