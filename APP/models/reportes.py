import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import warnings


class Reportes:
    def __init__(self, conexion):
        self.conexion = conexion

    
    def pedidos_por_cliente(self):
        query= """
            SELECT
            c.nombres || ' ' || c.apellidos AS Nombre,
            c.correo AS Correo,
            c.distrito AS Distrito,
            COUNT(p.id) AS Total_pedidos

            FROM clientes c
            -- left porque puede que haya clientes sin pedidos
            LEFT JOIN pedidos p 
                ON c.id = p.cliente_id

            GROUP BY c.nombres, c.apellidos, c.correo, c.distrito
            ORDER BY Total_pedidos DESC
        """

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
    

        