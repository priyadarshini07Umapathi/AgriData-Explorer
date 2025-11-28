import pandas as pd
from pymysql import Connect
from sqlalchemy import create_engine, text
def create_connection():
    try:
        db_user = 'root'
        db_password = 'pachu'
        db_host = 'localhost'
        db_name = 'db_eda'
        engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}')
        with engine.connect() as connection:
            print("Successfully connected to the database!")
        return connection
    except Exception as e:
      print(f"Database connection error:{e}")
      return None
#create_connection()
def fetch_data(query):
      try:
          db_user = 'root'
          db_password = 'pachu'
          db_host = 'localhost'
          db_name = 'db_eda'
          engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}')
          conn=engine.connect()
          sql_query=pd.read_sql_query(query,conn)
          df=pd.DataFrame(sql_query)
         # print(df)
          return df
      except Exception as e:
       print(f"Database connection error:{e}")
       return None
sql_query1="Select * from agri"
data=fetch_data(sql_query1)
print(data)