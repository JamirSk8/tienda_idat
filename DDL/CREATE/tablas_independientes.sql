
-- =================== 
-- PROVEDORES
-- =================== <- no es IA
CREATE TABLE proveedores (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    correo VARCHAR2(100) NOT NULL,

    fecha_creacion DATE DEFAULT SYSDATE,

    CONSTRAINT unique_proveedores_correo UNIQUE(correo)
);

-- ===================
-- CATEGORIAS
-- ===================
CREATE TABLE categorias(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    categoria VARCHAR2(100) NOT NULL,

    CONSTRAINT unique_categorias_categoria UNIQUE(categoria)
);

-- ===================
-- CLIENTES
-- ===================
CREATE TABLE clientes(
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombres VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(100) NOT NULL,
    dni VARCHAR2(8) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR2(100) NOT NULL,
    numero VARCHAR2(15),
    distrito VARCHAR2(50),

    fecha_creacion DATE DEFAULT SYSDATE,

    CONSTRAINT unique_clientes_dni UNIQUE(dni),
    CONSTRAINT unique_clientes_correo UNIQUE(correo),
    CONSTRAINT check_clientes_dni CHECK(LENGTH(dni) = 8)
);