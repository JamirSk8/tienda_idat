import oracledb

# se instala  con pip install oracledb


class ConectorOracle:
    def __init__(self, usuario, password, base_datos):
        
        self.usuario = usuario
        self.password = password
        self.base_datos = base_datos

    def conectar(self):
        return oracledb.connect(
            user=self.usuario,
            password=self.password,
            dsn=self.base_datos
        )