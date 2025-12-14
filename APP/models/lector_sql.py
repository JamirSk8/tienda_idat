from pathlib import Path


def cargar_sql(ruta_sql):
    sql = Path(ruta_sql).read_text(encoding="utf-8")
    return sql.replace(";", "")