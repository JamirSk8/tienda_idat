

from models.conector import ConectorOracle
from models.reportes import Reportes



def run():
    usuario = "tienda_idat"
    password = "123"
    base_datos = "localhost:1521/XEPDB1"

    conexion = ConectorOracle(usuario, password, base_datos)
    reporte = Reportes(conexion)

    resultado = reporte.pedidos_por_cliente()

    print(resultado)


if __name__ == "__main__":
    run()