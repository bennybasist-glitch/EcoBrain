-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2026 a las 06:40:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_ecobrain`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id_noticia` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  `fecha_publicacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id_noticia`, `titulo`, `contenido`, `fecha_publicacion`) VALUES
(1, '¡Gran Concurso de Reciclaje!', 'Este viernes premiaremos al salón que logre juntar más botellas de plástico. ¡Participa con tu grupo!', '2026-01-20'),
(2, 'Taller de Huertos Escolares', 'Aprende a sembrar tus propios vegetales este miércoles en la hora del recreo. Trae una maceta pequeña.', '2026-01-21'),
(3, 'Brigada de Limpieza', 'Nuestros Eco-Héroes de 5to grado realizaron una jornada de limpieza en el patio principal. ¡Gracias por su ayuda!', '2026-01-22'),
(4, 'Día Mundial del Agua', 'Recuerda cerrar bien las llaves de los lavabos. Cada gota cuenta para salvar nuestro planeta.', '2026-01-22'),
(5, 'Nueva sección en Eco-Brain', '¡Ya puedes usar \"El Cerebro\" para saber exactamente dónde tirar tus residuos de sándwich!', '2026-01-22'),
(6, '¡Bienvenidos al Proyecto Eco-Brain!', 'Hoy iniciamos el uso de nuestro nuevo sistema experto para aprender a reciclar mejor en la escuela.', '2026-01-22'),
(7, 'Gran Recolección de PET', 'Este viernes traeremos todas las botellas de plástico vacías al patio central para el concurso de reciclaje.', '2026-01-23'),
(8, 'Consejo del Día: El Papel', 'Recuerda que el papel debe ir en el contenedor AZUL, pero solo si está seco y sin grasa.', '2026-01-22'),
(9, 'Visita al Huerto Escolar', 'Los alumnos de 4to grado aprenderán a crear composta usando los residuos orgánicos registrados en el sistema.', '2026-01-24'),
(10, 'Eco-Héroe de la Semana', 'Felicidades a los alumnos de 3ro B por ser los que más han consultado \"El Cerebro\" esta semana.', '2026-01-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residuo`
--

CREATE TABLE `residuo` (
  `id_residuo` int(11) NOT NULL,
  `nombreObjeto` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `instruccion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `residuo`
--

INSERT INTO `residuo` (`id_residuo`, `nombreObjeto`, `categoria`, `instruccion`) VALUES
(1, 'Botella de agua', 'Contenedor AMARILLO', 'Vacía el líquido, quita la tapa y aplástala.'),
(2, 'Cuaderno', 'Contenedor AZUL', 'Quita el espiral de metal antes de reciclar las hojas.'),
(3, 'Lata de jugo', 'Contenedor AMARILLO', 'Enjuaga para evitar malos olores y hormigas.'),
(4, 'Cáscara de fruta', 'Contenedor ORGÁNICO', 'Deposita en el bote café para hacer composta.'),
(5, 'Caja de cereal', 'Contenedor AZUL', 'Aplasta la caja para que ocupe menos espacio.'),
(6, 'Hojas', 'Contenedor AZUL', 'Asegúrate de que no tengan grapas ni clips.'),
(7, 'Restos de sándwich', 'Contenedor ORGÁNICO', 'Solo comida, sin servilletas de papel.'),
(8, 'Bote de yogur', 'Contenedor AMARILLO', 'Es muy importante lavarlo bien.'),
(9, 'Cartulina', 'Contenedor AZUL', 'Quita cualquier rastro de cinta adhesiva o pegamento.'),
(10, 'Vidrio de ventana roto', 'Punto LIMPIO', 'No lo tires al bote normal, avisa a un maestro por seguridad.'),
(11, 'Pilas o baterías', 'Punto LIMPIO', 'Busca el contenedor especial de pilas en la dirección.'),
(12, 'Envoltura de papas', 'Contenedor GRIS / RESTO', 'Lamentablemente este plástico no se recicla en la escuela.'),
(13, 'Revista', 'Contenedor AZUL', 'Reciclable siempre que no tenga pastas plastificadas.'),
(14, 'Caja de leche (Tetrapak)', 'Contenedor AMARILLO', 'Escurre el resto de leche, aplástalo y cierra la tapa.'),
(15, 'Envoltura de papas', 'Contenedor AMARILLO', 'Asegúrate de que no tenga migajas de comida.'),
(16, 'Periódico viejo', 'Contenedor AZUL', 'Mantener seco y libre de grasa o aceite.'),
(17, 'Núcleo de manzana', 'Contenedor ORGÁNICO', 'Restos de fruta natural sin etiquetas de plástico.'),
(18, 'Hojas de examen usadas', 'Contenedor AZUL', 'Retira cualquier grapa o clip metálico antes de tirar.'),
(19, 'Bote de pegamento vacío', 'Contenedor AMARILLO', 'Solo si es de plástico y está totalmente seco por dentro.'),
(20, 'Cáscara de huevo', 'Contenedor ORGÁNICO', 'Restos orgánicos ideales para la composta escolar.'),
(21, 'Vaso de cartón de café', 'Contenedor GRIS', 'Si tiene recubrimiento plástico por dentro, va al contenedor gris.'),
(22, 'Papel aluminio limpio', 'Contenedor AMARILLO', 'Hazlo bolita para que sea más fácil de procesar.'),
(23, 'Servilletas usadas', 'Contenedor ORGÁNICO', 'Si solo tienen restos de comida o agua, son orgánicas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT 'Alumno',
  `puntos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `password`, `rol`, `puntos`) VALUES
(1, 'benjamin hernandez', 'bennybasist@gmail.com', 'Wakeupdead132*', 'Alumno', 80),
(2, 'Javier montalvo', 'silvestre@gmail.com', 'Wakeupdead132*', 'Maestro', 50),
(3, 'Benjamín Hernández', 'bennybasist@gmail.com', '12345', 'Maestro', 10),
(4, 'Gabriela Maestra', 'gaby@escuela.com', 'profe123', 'Maestro', 0),
(5, 'Luis Contador', 'luis@escuela.com', 'conta2026', 'Maestro', 0),
(6, 'Juan Pérez', 'juan@alumno.com', '123', 'Alumno', 50),
(7, 'María García', 'maria@alumno.com', '123', 'Alumno', 120),
(8, 'Carlos Ruiz', 'carlos@alumno.com', '123', 'Alumno', 30),
(9, 'Ana López', 'ana@alumno.com', '123', 'Alumno', 200),
(10, 'Diego Sosa', 'diego@alumno.com', '123', 'Alumno', 10),
(11, 'Elena Torres', 'elena@alumno.com', '123', 'Alumno', 85),
(12, 'Fernando Paz', 'fer@alumno.com', '123', 'Alumno', 150),
(13, 'Sofía Luna', 'sofia@alumno.com', '123', 'Alumno', 45),
(14, 'Mateo Villa', 'mateo@alumno.com', '123', 'Alumno', 0),
(15, 'Valentina Sol', 'vale@alumno.com', '123', 'Alumno', 95),
(16, 'Jair Compu', 'jair@alumno.com', '123', 'Alumno', 110),
(17, 'Nadia Eco', 'nadia@alumno.com', '123', 'Alumno', 75),
(18, 'Payo Recicla', 'payo@alumno.com', '123', 'Alumno', 20),
(19, 'Karen Verde', 'karen@alumno.com', '123', 'Alumno', 180),
(20, 'Pedro Planeta', 'pedro@alumno.com', '123', 'Alumno', 5),
(21, 'Benjamín Hernández', 'bennybasist@gmail.com', '12345', 'Maestro', 10),
(22, 'Gabriela Maestra', 'gaby@escuela.com', 'profe123', 'Maestro', 0),
(23, 'Luis Contador', 'luis@escuela.com', 'conta2026', 'Maestro', 0),
(24, 'Juan Pérez', 'juan@alumno.com', '123', 'Alumno', 50),
(25, 'María García', 'maria@alumno.com', '123', 'Alumno', 120),
(26, 'Carlos Ruiz', 'carlos@alumno.com', '123', 'Alumno', 30),
(27, 'Ana López', 'ana@alumno.com', '123', 'Alumno', 200),
(28, 'Diego Sosa', 'diego@alumno.com', '123', 'Alumno', 10),
(29, 'Elena Torres', 'elena@alumno.com', '123', 'Alumno', 85),
(30, 'Fernando Paz', 'fer@alumno.com', '123', 'Alumno', 150),
(31, 'Sofía Luna', 'sofia@alumno.com', '123', 'Alumno', 45),
(32, 'Mateo Villa', 'mateo@alumno.com', '123', 'Alumno', 0),
(33, 'Valentina Sol', 'vale@alumno.com', '123', 'Alumno', 95),
(34, 'Jair Compu', 'jair@alumno.com', '123', 'Alumno', 110),
(35, 'Nadia Eco', 'nadia@alumno.com', '123', 'Alumno', 75),
(36, 'Payo Recicla', 'payo@alumno.com', '123', 'Alumno', 20),
(37, 'Karen Verde', 'karen@alumno.com', '123', 'Alumno', 180),
(38, 'Pedro Planeta', 'pedro@alumno.com', '123', 'Alumno', 5),
(39, 'Juan Pérez', 'juan@alumno.com', '123', 'Alumno', 50),
(40, 'María García', 'maria@alumno.com', '123', 'Alumno', 120),
(41, 'Carlos Ruiz', 'carlos@alumno.com', '123', 'Alumno', 30),
(42, 'Ana López', 'ana@alumno.com', '123', 'Alumno', 200),
(43, 'Diego Sosa', 'diego@alumno.com', '123', 'Alumno', 10),
(44, 'Elena Torres', 'elena@alumno.com', '123', 'Alumno', 85),
(45, 'Fernando Paz', 'fer@alumno.com', '123', 'Alumno', 150),
(46, 'Sofía Luna', 'sofia@alumno.com', '123', 'Alumno', 45),
(47, 'Mateo Villa', 'mateo@alumno.com', '123', 'Alumno', 0),
(48, 'Valentina Sol', 'vale@alumno.com', '123', 'Alumno', 95),
(49, 'Jair Compu', 'jair@alumno.com', '123', 'Alumno', 110),
(50, 'Nadia Eco', 'nadia@alumno.com', '123', 'Alumno', 75),
(51, 'Payo Recicla', 'payo@alumno.com', '123', 'Alumno', 20),
(52, 'Karen Verde', 'karen@alumno.com', '123', 'Alumno', 180),
(53, 'Pedro Planeta', 'pedro@alumno.com', '123', 'Alumno', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id_noticia`);

--
-- Indices de la tabla `residuo`
--
ALTER TABLE `residuo`
  ADD PRIMARY KEY (`id_residuo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `residuo`
--
ALTER TABLE `residuo`
  MODIFY `id_residuo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
