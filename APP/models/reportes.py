import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import warnings

from .lector_sql import cargar_sql




class Reportes:
    def __init__(self, conexion):
        self.conexion = conexion

    
    def pedidos_por_cliente(self):
        query= cargar_sql("../REPORTES/CLIENTES/01_pedidos_por_cliente.sql")

        with self.conexion.conectar() as conexion:
            with warnings.catch_warnings():
                warnings.filterwarnings(
                    "ignore",
                    category=UserWarning,
                )
                return pd.read_sql(query, conexion)
            

    def visualizar_pedidos_por_cliente(self):
        df = self.pedidos_por_cliente()

        print(df.columns)
        sns.barplot(
            data=df,
            x= "NOMBRE",
            y= "TOTAL_PEDIDOS"
        )

        plt.title("Total de Pedidos por Cliente")
        plt.xticks(rotation=45)
        plt.tight_layout()
        plt.show()
    

    def gasto_por_cliente(self):
        query= cargar_sql("../REPORTES/CLIENTES/02_gasto_por_cliente.sql")

        with self.conexion.conectar() as conexion:
            with warnings.catch_warnings():
                warnings.filterwarnings(
                    "ignore",
                    category=UserWarning,
                )
                return pd.read_sql(query, conexion)
            
    def visualizar_gasto_por_cliente(self):
        df = self.gasto_por_cliente()

        print(df.columns)
        sns.barplot(
            data=df,
            x= "NOMBRE",
            y= "GASTO_TOTAL"
        )

        plt.title("Total de Gasto por Cliente")
        plt.xticks(rotation=45)
        plt.tight_layout()
        plt.show()

        