CREATE TABLE tipo_usuario (
  ID_tipo INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL
);

CREATE TABLE usuarios (
  ID_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  ID_tipo INT NOT NULL,
  FOREIGN KEY (ID_tipo) REFERENCES tipo_usuario(ID_tipo)
);

CREATE TABLE roles (
  ID_rol INT PRIMARY KEY AUTO_INCREMENT,
  rol VARCHAR(50) NOT NULL
);

CREATE TABLE administradores (
  ID_administrador INT PRIMARY KEY AUTO_INCREMENT,
  ID_usuario INT NOT NULL,
  correo_electronico VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  ID_rol INT NOT NULL,
  FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario),
  FOREIGN KEY (ID_rol) REFERENCES roles(ID_rol)
);

CREATE TABLE area (
  ID_area INT PRIMARY KEY AUTO_INCREMENT,
  nombre_area VARCHAR(100) NOT NULL
);

CREATE TABLE ubicacion (
  ID_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
  ID_area INT NOT NULL,
  ubicacion VARCHAR(100) NOT NULL,
  FOREIGN KEY (ID_area) REFERENCES area(ID_area)
);

CREATE TABLE tecnicos (
  ID_tecnico INT PRIMARY KEY AUTO_INCREMENT,
  ID_usuario INT NOT NULL,
  correo VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  certificacion VARCHAR(100),
  ID_area INT NOT NULL,
  especialidad VARCHAR(100),
  contraseña VARCHAR(255) NOT NULL,
  FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario),
  FOREIGN KEY (ID_area) REFERENCES area(ID_area)
);

CREATE TABLE servicios (
  ID_servicio INT PRIMARY KEY AUTO_INCREMENT,
  tipo_servicio VARCHAR(100) NOT NULL
);

CREATE TABLE prioridades (
  ID_prioridad INT PRIMARY KEY AUTO_INCREMENT,
  nivel_prioridad VARCHAR(50) NOT NULL
);

CREATE TABLE estatus (
  ID_estatus INT PRIMARY KEY AUTO_INCREMENT,
  estado VARCHAR(50) NOT NULL
);

CREATE TABLE descripciones (
  ID_descripcion INT PRIMARY KEY AUTO_INCREMENT,
  descripcion_general TEXT,
  evidencias_fotos TEXT
);

CREATE TABLE reportes (
  ID_reporte INT PRIMARY KEY AUTO_INCREMENT,
  ID_estatus INT NOT NULL,
  ID_usuario INT NOT NULL,
  ID_area INT NOT NULL,
  ID_tecnico INT NOT NULL,
  fecha DATE NOT NULL,
  ID_descripcion INT NOT NULL,
  ID_prioridad INT NOT NULL,
  ID_servicio INT NOT NULL,
  FOREIGN KEY (ID_estatus) REFERENCES estatus(ID_estatus),
  FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario),
  FOREIGN KEY (ID_area) REFERENCES area(ID_area),
  FOREIGN KEY (ID_tecnico) REFERENCES tecnicos(ID_tecnico),
  FOREIGN KEY (ID_descripcion) REFERENCES descripciones(ID_descripcion),
  FOREIGN KEY (ID_prioridad) REFERENCES prioridades(ID_prioridad),
  FOREIGN KEY (ID_servicio) REFERENCES servicios(ID_servicio)
);

CREATE TABLE trabajo_realizado (
  ID_trabajo INT PRIMARY KEY AUTO_INCREMENT,
  ID_reporte INT NOT NULL,
  ID_tecnico INT NOT NULL,
  descripcion_trabajo_realizado TEXT,
  FOREIGN KEY (ID_reporte) REFERENCES reportes(ID_reporte),
  FOREIGN KEY (ID_tecnico) REFERENCES tecnicos(ID_tecnico)
);
