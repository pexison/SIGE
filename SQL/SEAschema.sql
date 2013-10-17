CREATE TABLE EXPEDIENTE(
    CODIGO_EXPEDIENTE    CHAR(12)    NOT NULL, -- Codigo que identifica al expediente
    CODIGO_PLANILLA      CHAR(12)    NOT NULL, -- Codigo de la planilla de referencia
    FECHA_SOLICITUD      DATE        NOT NULL, -- Fecha en la que se genero la solicitud
    CODIGO_INSTITUCION   CHAR(12)    NOT NULL, -- Codigo de la institucion de procedencia      
    CODIGO_CARRERA       VARCHAR(12) NOT NULL, -- Codigo de la carrera referenciada
    ESTADO_SOLICITUD     VARCHAR(12) NOT NULL, -- Refiere el estado actual de la solicitud
    TIPO_EQUIVALENCIA    VARCHAR(15) NOT NULL  -- El tipo de la solicitud hecha
);

CREATE TABLE CARRERA(
    CODIGO_CARRERA       CHAR(12)        NOT NULL, -- Codigo de la carrera
    CODIGO_INSTITUCION   CHAR(12)        NOT NULL, -- Codigo de la institucion que ofrece la carrera
    NOMBRE_CARRERA       VARCHAR(50)     NOT NULL  -- Nombre de la carrera
);

CREATE TABLE INSTITUCION(
    CODIGO_INSTITUCION      CHAR(12)     NOT NULL, -- Codigo de la institucion
    NOMBRE_INSTITUCION      VARCHAR(100) NOT NULL, -- Nombre de la institucion
    DIRECCION               VARCHAR(100) NOT NULL, -- Direccion de la institucion
    PAIS                    VARCHAR(50)  NOT NULL  -- Pais de la institucion
);

CREATE TABLE PAIS(
    NOMBRE                  VARCHAR(50) NOT NULL -- Nombre del Pais
);

CREATE TABLE PLANILLA(
    CEDULA_ASPIRANTE        CHAR(20)     NOT NULL, -- Cedula de identidad del aspirante
    CODIGO_PLANILLA         CHAR(12)     NOT NULL, -- Codigo de la planilla
    ESTADO_PLANILLA         VARCHAR(12)  NOT NULL, -- Estado actual de la planilla
    TIPO_INGRESO            VARCHAR(15)  NOT NULL, -- Tipo de equivalencia solicitada
    INSTITUCION_ORIGEN      VARCHAR(100) NOT NULL, -- Institucion de origen del aspirante
    INSTITUCION_DESTINO     VARCHAR(100) NOT NULL, -- Institucion de destino del aspirante
    CARRERA_ORIGEN          VARCHAR(50)  NOT NULL, -- Carrera de origen del aspirante
    CARRERA_DESTINO         VARCHAR(50)  NOT NULL  -- Carrera de destino del aspirante
);

CREATE TABLE RECAUDO(
    CODIGO_PLANILLA         CHAR(12)        NOT NULL, -- Codigo de la planilla asociada
    TIPO_RECAUDO            TEXT            NOT NULL, -- Tipo que identifica al recaudo
    DATOS_RECAUDO           VARCHAR(1000)   NOT NULL  -- Contiene los datos del archivo
);

CREATE TABLE ASPIRANTE(
    ID_USUARIO              VARCHAR(14)    NOT NULL, -- ID del usuario remitente
    CEDULA                  CHAR(20)       NOT NULL, -- CI del aspirante
    SEXO                    VARCHAR(10)    NOT NULL, -- Sexo del aspirante
    EDAD                    INTEGER        NOT NULL, -- Edad del aspirante
    PAIS                    VARCHAR(50)    NOT NULL, -- Pais de residencia del aspirante
    ESTADO_CIVIL            VARCHAR(10)    NOT NULL, -- Estado Civil del aspirante
    LUGAR_NACIMIENTO        VARCHAR(100)   NOT NULL, -- Lugar de nacimiento del aspirante
    NACIONALIDAD            VARCHAR(30)    NOT NULL  -- Nacionalidad del aspirante
);

CREATE TABLE TELEFONO(
    CEDULA_ASPIRANTE       CHAR(20)        NOT NULL, -- Cedula del aspirante asociado 
    NUMERO                 CHAR(20)        NOT NULL  -- Numero de telefono
);

CREATE TABLE USUARIO(
    ID_USUARIO      VARCHAR(14)     NOT NULL, -- Id del usuario
    CLAVE           VARCHAR(14)     NOT NULL, -- Clave asociada al usuario
    NOMBRE          VARCHAR(80)     NOT NULL, -- Nombre del usuario
    APELLIDO        VARCHAR(80)     NOT NULL, -- Apellido del usuario
    EMAIL           VARCHAR(50)     NOT NULL, -- Correo electronico del usuario
    TIPO_USUARIO    VARCHAR(80)     NOT NULL  -- Tipo / Rol del usuario
);


CREATE TABLE TIPO_USUARIO(
    TIPO_USUARIO    VARCHAR(80)     NOT NULL
);


CREATE TABLE ENVIA_MEMO(
    ID_EMISOR           VARCHAR(14)     NOT NULL, -- Id del usuario emisor
    ID_RECEPTOR         VARCHAR(14)     NOT NULL, -- Id del usuario receptor
    CODIGO_EXPEDIENTE   CHAR(12)        NOT NULL, -- Codigo que identifica al expediente
    FECHA               DATE            NOT NULL, -- Fecha de envio del memo
    MENSAJE             VARCHAR(5000)   NOT NULL  -- Mensaje asociado al memo
);


CREATE TABLE ADMINISTRA(
    ID_USUARIO          VARCHAR(14)     NOT NULL, -- Id del usuario encargado del expediente
    CODIGO_EXPEDIENTE   CHAR(12)        NOT NULL, -- Codigo del expediente a administrar
    FECHA_ASIGNACION    DATE            NOT NULL  -- Fecha en la que se asigna la administracion
);


CREATE TABLE PROVIENE_DE(
    CODIGO_EXPEDIENTE   CHAR(12)     NOT NULL, -- Codigo del expediente 
    CODIGO_INSTITUCION  CHAR(12)     NOT NULL, -- Codigo de la institucion de la cual proviene el aspirante
    CODIGO_CARRERA      CHAR(12)     NOT NULL  -- Codigo de la carrera de la cual proviene el aspirante
);


CREATE TABLE INFORME(
    CODIGO_EXPEDIENTE       CHAR(12)     NOT NULL, -- Codigo del expediente 
    FECHA_CREACION          DATE         NOT NULL, -- Fecha en la que se genero el informe
    PORCENTAJE_EQUIVALENCIA REAL         NOT NULL, -- Porcentaje de materias equivalidas
    RESULTADO_SOLICITUD     VARCHAR(30)  NOT NULL, -- Resultado final del proceso de equivalencia
    RESUMEN_EQUIVALENCIA    VARCHAR(800) NOT NULL, -- Comentarios / Resumen sobre la solicitud
    NUM_ESTUDIANTES_ACTIVOS INTEGER              , -- Numero de estudiantes activos
    CUPOS_DISPONIBLES       INTEGER              , -- Numero de cupos disponibles en la institucion
    INDICE_USB              REAL                 , -- Indice en escala USB
    INDICE_PROMEDIO         REAL                   -- Indice promedio del aspirante
);


CREATE TABLE ASIGNATURA(
    CODIGO_INSTITUCION      CHAR(12)     NOT NULL, -- Codigo de la institucion asociada
    CODIGO_ASIGNATURA       CHAR(12)     NOT NULL, -- Codigo de la asignatura
    NOMBRE_ASIGNATURA       VARCHAR(80)  NOT NULL, -- Nombre de la asignatura
    CREDITOS                INTEGER      NOT NULL  -- Numero de creditos de la asignatura
);


CREATE TABLE TIENE_CALIFICACION(
    CODIGO_EXPEDIENTE  CHAR(12)     NOT NULL, -- Codigo del expediente
    CODIGO_INSTITUCION CHAR(12)     NOT NULL, -- Codigo de la institucion
    CODIGO_ASIGNATURA  CHAR(12)     NOT NULL, -- Codigo de la asignatura
    NOTA               REAL         NOT NULL  -- Calificacion obtenida en la asignatura
);


CREATE TABLE TABLA_EQUIVALENCIA(
    CODIGO_INSTITUCION_ORIG CHAR(12)  NOT NULL, -- Codigo de la institucion de origen
    CODIGO_CARRERA_ORIG     CHAR(12)  NOT NULL, -- Codigo de la carrera de origen
    CODIGO_INSTITUCION_DEST CHAR(12)  NOT NULL, -- Codigo de la institucion de destinado
    CODIGO_CARRERA_DEST     CHAR(12)  NOT NULL, -- Codigo de la carrera de destino
    FECHA_MODIFICACION      DATE      NOT NULL  -- Fecha de la ultima modificacion
);

CREATE TABLE REQUIERE(
    CODIGO_ASIGNATURA       CHAR(12)     NOT NULL, -- Codigo de la asignatura requerida
    CODIGO_INSTITUCION      CHAR(12)     NOT NULL, -- Codigo de la institucion que posee la carrera
    CODIGO_CARRERA          CHAR(12)     NOT NULL  -- Codigo de la carrera que requiere dicha asignatura
);


CREATE TABLE EQUIVALENCIA(
    CODIGO_INSTITUCION_ORIG     CHAR(12)    NOT NULL, -- Codigo de la institucion de origen
    CODIGO_CARRERA_ORIG         CHAR(12)    NOT NULL, -- Codigo de la carrera de origen
    CODIGO_INSTITUCION_DEST     CHAR(12)    NOT NULL, -- Codigo de la institucion de destino
    CODIGO_CARRERA_DEST         CHAR(12)    NOT NULL, -- Codigo de la carrera de destino
    CODIGO_EQUIVALENCIA         INTEGER    NOT NULL  -- Codigo para diferenciar las equivalencias de una tabla
);


CREATE TABLE INCLUYE(
    CODIGO_INSTITUCION_ORIG     CHAR(12)    NOT NULL, -- Codigo de la institucion de origen
    CODIGO_CARRERA_ORIG         CHAR(12)    NOT NULL, -- Codigo de la carrera de origen
    CODIGO_ASIGNATURA           CHAR(12)    NOT NULL,  -- Codigo de la asignatura que se incluye
    CODIGO_INSTITUCION_DEST     CHAR(12)    NOT NULL, -- Codigo de la institucion de destino
    CODIGO_CARRERA_DEST         CHAR(12)    NOT NULL, -- Codigo de la carrera de destino
    CODIGO_EQUIVALENCIA         INTEGER     NOT NULL  -- Codigo de la equivalencia
);

CREATE TABLE EQUIVALE(
    CODIGO_INSTITUCION_ORIG     CHAR(12)    NOT NULL, -- Codigo de la institucion de origen
    CODIGO_CARRERA_ORIG         CHAR(12)    NOT NULL, -- Codigo de la carrera de origen
    CODIGO_INSTITUCION_DEST     CHAR(12)    NOT NULL, -- Codigo de la institucion de destino
    CODIGO_CARRERA_DEST         CHAR(12)    NOT NULL, -- Codigo de la carrera de destino
    CODIGO_ASIGNATURA           CHAR(12)    NOT NULL, -- Codigo de la asignatura que se equivale
    CODIGO_EQUIVALENCIA         INTEGER     NOT NULL  -- Codigo de la equivalencia
);


ALTER TABLE TIPO_USUARIO 
    ADD CONSTRAINT PK_TIPO_USUARIO PRIMARY KEY (TIPO_USUARIO);

ALTER TABLE USUARIO
    ADD CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO),
    ADD CONSTRAINT FK_USUARIO_TIPO_USUARIO FOREIGN KEY (TIPO_USUARIO) REFERENCES TIPO_USUARIO(TIPO_USUARIO);

ALTER TABLE ASPIRANTE
    ADD CONSTRAINT PK_ASPIRANTE PRIMARY KEY (CEDULA),
    ADD CONSTRAINT FK_ASPIRANTE_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
    ADD CONSTRAINT DOM_CHECK_SEXO CHECK (SEXO IN ('Masculino','Femenino'));

ALTER TABLE TELEFONO
    ADD CONSTRAINT PK_TELEFONO PRIMARY KEY(CEDULA_ASPIRANTE),
    ADD CONSTRAINT FK_TELEFONO_USUARIO FOREIGN KEY (CEDULA_ASPIRANTE) REFERENCES ASPIRANTE (CEDULA);

ALTER TABLE PLANILLA
    ADD CONSTRAINT PK_PLANILLA PRIMARY KEY (CODIGO_PLANILLA),
    ADD CONSTRAINT FK_PLANILLA_ASPIRANTE FOREIGN KEY (CEDULA_ASPIRANTE) REFERENCES ASPIRANTE (CEDULA),
    ADD CONSTRAINT DOM_CHECK_ESTADO_PLANILLA CHECK (ESTADO_PLANILLA IN ('Aprobada','Pendiente','Rechazada')),
    ADD CONSTRAINT DOM_CHECK_TIPO_INGRESO CHECK (TIPO_INGRESO IN ('Graduado_Usb','Ingreso','Validacion'));

ALTER TABLE RECAUDO
    ADD CONSTRAINT PK_RECAUDO PRIMARY KEY (CODIGO_PLANILLA, TIPO_RECAUDO,DATO_RECAUDO),
    ADD CONSTRAINT FK_RECAUDO_PLANILLA FOREIGN KEY (CODIGO_PLANILLA) REFERENCES PLANILLA (CODIGO_PLANILLA),
    ADD CONSTRAINT DOM_CHECK_TIPO_RECAUDO CHECK (TIPO_RECAUDO IN ('A', 'B', 'C'));
   
ALTER TABLE INSTITUCION
    ADD CONSTRAINT PK_INSTITUCION PRIMARY KEY (CODIGO_INSTITUCION);
    
ALTER TABLE PAIS
    ADD CONSTRAINT PK_PAIS PRIMARY KEY (NOMBRE);    
    
ALTER TABLE CARRERA
    ADD CONSTRAINT PK_CARRERA PRIMARY KEY (CODIGO_INSTITUCION,CODIGO_CARRERA),
    ADD CONSTRAINT FK_CARRERA_INSTITUCION FOREIGN KEY (CODIGO_INSTITUCION) REFERENCES INSTITUCION(CODIGO_INSTITUCION);
    
ALTER TABLE EXPEDIENTE
    ADD CONSTRAINT PK_EXPEDIENTE PRIMARY KEY (CODIGO_EXPEDIENTE),
    ADD CONSTRAINT FK_EXPEDIENTE_CARRERA FOREIGN KEY(CODIGO_INSTITUCION,CODIGO_CARRERA) REFERENCES CARRERA(CODIGO_INSTITUCION,CODIGO_CARRERA),
    ADD CONSTRAINT FK_EXPEDIENTE_PLANILLA FOREIGN KEY(CODIGO_PLANILLA) REFERENCES PLANILLA(CODIGO_PLANILLA),
    ADD CONSTRAINT DOM_CHECK_TIPO_EQUIVALENCIA CHECK (TIPO_EQUIVALENCIA IN ('Graduado_Usb','Ingreso','Validacion')),
    ADD CONSTRAINT DOM_CHECK_ESTADO_SOLICITUD  CHECK (ESTADO_SOLICITUD IN ('Pendiente','Finalizada'));

ALTER TABLE ENVIA_MEMO
    ADD CONSTRAINT PK_ENVIA_MEMO PRIMARY KEY (ID_EMISOR,ID_RECEPTOR,CODIGO_EXPEDIENTE,FECHA),
    ADD CONSTRAINT FK_ENVIA_MEMO_USUARIO_EMISOR FOREIGN KEY (ID_EMISOR) REFERENCES USUARIO (ID_USUARIO),
    ADD CONSTRAINT FK_ENVIA_MEMO_USUARIO_RECEPTOR FOREIGN KEY (ID_RECEPTOR) REFERENCES USUARIO (ID_USUARIO),
    ADD CONSTRAINT FK_ENVIA_MEMO_EXPEDIENTE FOREIGN KEY (CODIGO_EXPEDIENTE) REFERENCES EXPEDIENTE(CODIGO_EXPEDIENTE);
    
ALTER TABLE ADMINISTRA
    ADD CONSTRAINT PK_ADMINISTRA PRIMARY KEY(ID_USUARIO, CODIGO_EXPEDIENTE, FECHA_ASIGNACION),
    ADD CONSTRAINT FK_ADMINISTRA_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    ADD CONSTRAINT FK_ADMINISTRA_EXPEDIENTE FOREIGN KEY(CODIGO_EXPEDIENTE) REFERENCES EXPEDIENTE(CODIGO_EXPEDIENTE);

ALTER TABLE PROVIENE_DE
    ADD CONSTRAINT PK_PROVIENE_DE PRIMARY KEY(CODIGO_EXPEDIENTE, CODIGO_INSTITUCION, CODIGO_CARRERA),
    ADD CONSTRAINT FK_PROVIENE_DE_EXPEDIENTE FOREIGN KEY(CODIGO_EXPEDIENTE) REFERENCES EXPEDIENTE(CODIGO_EXPEDIENTE),
    ADD CONSTRAINT FK_PROVIENE_DE_CARRERA FOREIGN KEY(CODIGO_INSTITUCION, CODIGO_CARRERA) REFERENCES CARRERA(CODIGO_INSTITUCION, CODIGO_CARRERA);

ALTER TABLE TABLA_EQUIVALENCIA
    ADD CONSTRAINT PK_TABLA_EQUIV PRIMARY KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST),
    ADD CONSTRAINT FK_TABLA_EQUIV_CARRERA_ORIG FOREIGN KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG) REFERENCES CARRERA(CODIGO_INSTITUCION, CODIGO_CARRERA),
    ADD CONSTRAINT FK_TABLA_EQUIV_CARRERA_DEST FOREIGN KEY(CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST) REFERENCES CARRERA(CODIGO_INSTITUCION, CODIGO_CARRERA);

ALTER TABLE EQUIVALENCIA
    ADD CONSTRAINT PK_EQUIVALENCIA PRIMARY KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_EQUIVALENCIA),
    ADD CONSTRAINT FK_EQUIVALENCIA_TABLA_EQ FOREIGN KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST) REFERENCES TABLA_EQUIVALENCIA(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST);
    
ALTER TABLE ASIGNATURA
    ADD CONSTRAINT PK_ASIGNATURA PRIMARY KEY(CODIGO_INSTITUCION, CODIGO_ASIGNATURA),
    ADD CONSTRAINT FK_ASIGNATURA_INSTITUCION FOREIGN KEY(CODIGO_INSTITUCION) REFERENCES INSTITUCION(CODIGO_INSTITUCION),
    ADD CONSTRAINT DOM_CHECK_ASIGNATURA_CREDITOS CHECK (CREDITOS > 0);

ALTER TABLE INFORME
    ADD CONSTRAINT PK_INFORME PRIMARY KEY(CODIGO_EXPEDIENTE),
    ADD CONSTRAINT FK_INFORME_EXPEDIENTE FOREIGN KEY(CODIGO_EXPEDIENTE) REFERENCES EXPEDIENTE(CODIGO_EXPEDIENTE),
    ADD CONSTRAINT DOM_CHECK_INFORME_PORCENTAJE CHECK (PORCENTAJE_EQUIVALENCIA >=0),
    ADD CONSTRAINT DOM_CHECK_INFORME_CUPOS CHECK (CUPOS_DISPONIBLES IS NULL OR CUPOS_DISPONIBLES >= 0),
    ADD CONSTRAINT DOM_CHECK_INDICE_PROMEDIO CHECK (INDICE_PROMEDIO IS NULL OR INDICE_PROMEDIO >= 0),
    ADD CONSTRAINT DOM_CHECK_INDICE_USB CHECK (INDICE_USB IS NULL OR INDICE_USB >= 1 AND INDICE_USB <= 5),
    ADD CONSTRAINT DOM_CHECK_NUM_ESTUDIANTES_ACTIVOS CHECK (NUM_ESTUDIANTES_ACTIVOS IS NULL OR NUM_ESTUDIANTES_ACTIVOS >= 0);

ALTER TABLE REQUIERE
    ADD CONSTRAINT PK_REQUIERE PRIMARY KEY(CODIGO_ASIGNATURA, CODIGO_INSTITUCION, CODIGO_CARRERA),
    ADD CONSTRAINT FK_REQUIERE_CARRERA FOREIGN KEY(CODIGO_INSTITUCION, CODIGO_CARRERA) REFERENCES CARRERA(CODIGO_INSTITUCION, CODIGO_CARRERA),
    ADD CONSTRAINT FK_REQUIERE_ASIGNATURA FOREIGN KEY(CODIGO_INSTITUCION, CODIGO_ASIGNATURA) REFERENCES ASIGNATURA(CODIGO_INSTITUCION, CODIGO_ASIGNATURA);

ALTER TABLE TIENE_CALIFICACION
    ADD CONSTRAINT PK_TIENE_CALIFICACION PRIMARY KEY(CODIGO_EXPEDIENTE, CODIGO_INSTITUCION, CODIGO_ASIGNATURA),
    ADD CONSTRAINT FK_TIENE_CALIFICACION_EXPEDIENTE FOREIGN KEY(CODIGO_EXPEDIENTE) REFERENCES EXPEDIENTE(CODIGO_EXPEDIENTE),
    ADD CONSTRAINT FK_TIENE_CALIFICACION_ASIGNATURA FOREIGN KEY(CODIGO_INSTITUCION, CODIGO_ASIGNATURA) REFERENCES ASIGNATURA(CODIGO_INSTITUCION, CODIGO_ASIGNATURA),
    ADD CONSTRAINT DOM_TIENE_CALIFICACION_NOTA CHECK (NOTA >= 0);

ALTER TABLE EQUIVALE
    ADD CONSTRAINT PK_EQUIVALE PRIMARY KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_ASIGNATURA, CODIGO_EQUIVALENCIA),
    ADD CONSTRAINT FK_EQUIVALE_EQUIVALENCIA FOREIGN KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_EQUIVALENCIA) REFERENCES EQUIVALENCIA(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_EQUIVALENCIA),
    ADD CONSTRAINT FK_EQUIVALE_ASIGNATURA FOREIGN KEY(CODIGO_INSTITUCION_DEST, CODIGO_ASIGNATURA) REFERENCES ASIGNATURA(CODIGO_INSTITUCION, CODIGO_ASIGNATURA);

ALTER TABLE INCLUYE
    ADD CONSTRAINT PK_INCLUYE PRIMARY KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_ASIGNATURA, CODIGO_EQUIVALENCIA),
    ADD CONSTRAINT FK_INCLUYE_EQUIVALENCIA FOREIGN KEY(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_EQUIVALENCIA) REFERENCES EQUIVALENCIA(CODIGO_INSTITUCION_ORIG, CODIGO_CARRERA_ORIG, CODIGO_INSTITUCION_DEST, CODIGO_CARRERA_DEST, CODIGO_EQUIVALENCIA),
    ADD CONSTRAINT FK_INCLUYE_ASIGNATURA FOREIGN KEY(CODIGO_INSTITUCION_ORIG, CODIGO_ASIGNATURA) REFERENCES ASIGNATURA(CODIGO_INSTITUCION, CODIGO_ASIGNATURA);
