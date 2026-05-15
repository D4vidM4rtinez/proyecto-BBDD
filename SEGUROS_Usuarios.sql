use seguros;
CREATE USER 'rese'@'localhost' IDENTIFIED BY 'rese';
GRANT SELECT ON seguros.* TO 'rese'@'localhost';

CREATE USER 'kadha'@'localhost' IDENTIFIED BY 'kadha';
GRANT SELECT ON seguros.* TO 'kadha'@'localhost';

CREATE USER 'mecanico'@'localhost' IDENTIFIED BY 'mecanico';
GRANT SELECT ON seguros.personas TO 'mecanico'@'localhost';
GRANT SELECT ON seguros.taller TO 'mecanico'@'localhost';
GRANT SELECT ON seguros.mecanico TO 'mecanico'@'localhost';
GRANT SELECT ON seguros.mecanico_repara TO 'mecanico'@'localhost';
