use SEGUROS;
CREATE USER 'rese'@'localhost' IDENTIFIED BY 'rese';
GRANT SELECT ON SEGUROS.* TO 'rese'@'localhost';

CREATE USER 'kadha'@'localhost' IDENTIFIED BY 'kadha';
GRANT SELECT ON SEGUROS.* TO 'kadha'@'localhost';

CREATE USER 'mecanico'@'localhost' IDENTIFIED BY 'mecanico';
GRANT SELECT ON SEGUROS.personas TO 'mecanico'@'localhost';
GRANT SELECT ON SEGUROS.taller TO 'mecanico'@'localhost';
GRANT SELECT ON SEGUROS.mecanico TO 'mecanico'@'localhost';
GRANT SELECT ON SEGUROS.mecanico_repara TO 'mecanico'@'localhost';
