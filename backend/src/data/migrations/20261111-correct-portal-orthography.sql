BEGIN;

UPDATE document_categories
SET description = 'Documentos técnicos en PDF'
WHERE name = 'Especificaciones';

UPDATE documents
SET description = CASE code
    WHEN 'solicitud-usuario' THEN 'Formulario de alta o habilitación de usuario institucional.'
    WHEN 'correo-institucional' THEN 'Formulario para la asignación de cuenta de correo institucional.'
    WHEN 'acceso-internet' THEN 'Formulario para la gestión de accesos a internet.'
    WHEN 'usuario-sistema-dgac' THEN 'Formulario para la asignación de acceso a sistemas institucionales.'
    WHEN 'solicitud-carpeta-compartida' THEN 'Solicitud para la habilitación de acceso a carpeta compartida institucional.'
    WHEN 'computadora-escritorio' THEN 'Especificaciones técnicas para equipo de cómputo de escritorio institucional.'
    WHEN 'computadora-portatil' THEN 'Documento con requerimientos y características para computadora portátil.'
    WHEN 'escaner' THEN 'Ficha de especificaciones para equipo de digitalización y escaneo institucional.'
    WHEN 'ups' THEN 'Especificaciones técnicas para sistema de respaldo y protección eléctrica.'
    ELSE description
END,
title = CASE code
    WHEN 'computadora-portatil' THEN 'Computadora portátil'
    WHEN 'escaner' THEN 'Escáner'
    ELSE title
END,
updated_at = NOW()
WHERE code IN (
    'solicitud-usuario',
    'correo-institucional',
    'acceso-internet',
    'usuario-sistema-dgac',
    'solicitud-carpeta-compartida',
    'computadora-escritorio',
    'computadora-portatil',
    'escaner',
    'ups'
);

UPDATE links
SET
    title = CASE
        WHEN title = 'Direccion General de Aeronautica Civil' THEN 'Dirección General de Aeronáutica Civil'
        WHEN title = 'Portal de tramites DGAC' THEN 'Portal de trámites DGAC'
        WHEN title = 'Radio TGW en linea' THEN 'Radio TGW en línea'
        ELSE title
    END,
    description = CASE
        WHEN description = 'Acceso para gestionar y autenticar tramites institucionales.' THEN 'Acceso para gestionar y autenticar trámites institucionales.'
        WHEN description = 'Acceso al sistema interno institucional para tramites, oficios y gestiones administrativas.' THEN 'Acceso al sistema interno institucional para trámites, oficios y gestiones administrativas.'
        WHEN description = 'Sitio oficial del ministerio para consultas, informacion y publicaciones.' THEN 'Sitio oficial del ministerio para consultas, información y publicaciones.'
        WHEN description = 'Portal interno institucional oficial de la Direccion General de Aeronautica Civil.' THEN 'Portal interno institucional oficial de la Dirección General de Aeronáutica Civil.'
        WHEN description = 'Acceso directo a la senal en linea de Radio TGW.' THEN 'Acceso directo a la señal en línea de Radio TGW.'
        ELSE description
    END
WHERE
    title IN (
        'Direccion General de Aeronautica Civil',
        'Portal de tramites DGAC',
        'Radio TGW en linea'
    )
    OR description IN (
        'Acceso para gestionar y autenticar tramites institucionales.',
        'Acceso al sistema interno institucional para tramites, oficios y gestiones administrativas.',
        'Sitio oficial del ministerio para consultas, informacion y publicaciones.',
        'Portal interno institucional oficial de la Direccion General de Aeronautica Civil.',
        'Acceso directo a la senal en linea de Radio TGW.'
    );

COMMIT;
