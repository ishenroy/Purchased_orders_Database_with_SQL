CREATE TABLE `customers` (
  `customerId` mediumint(8) unsigned NOT NULL auto_increment,
  `firstName` varchar(255) default NULL,
  `lastName` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `city` varchar(255),
  `country` varchar(100) default NULL,
  PRIMARY KEY (`customerId`)
) AUTO_INCREMENT=1;

CREATE TABLE `orders` (
  `orderId` mediumint(8) unsigned NOT NULL auto_increment,
  `date` varchar(255),
  `currency` varchar(255) default NULL,
  `total` mediumint default NULL,
  `customerId` mediumint unsigned NOT NULL,
  PRIMARY KEY (`orderId`),
  FOREIGN KEY (`customerId`) REFERENCES customers(`customerId`)
) AUTO_INCREMENT=1;
INSERT INTO `customers` (`firstName`,`lastName`,`address`,`city`,`country`) 
VALUES ("Ursa","Vasquez","P.O. Box 878, 8416 Nullam St.","Worcester","United States"),
("Quyn","Meyer","P.O. Box 670, 7155 Tincidunt St.","Price","Canada"),
("Orli","Klein","4981 Gravida St.","Barrow-in-Furness","United Kingdom"),
("Tallulah","Hines","6279 Pellentesque Street","Omaha","United States"),
("Joel","Ross","P.O. Box 842, 4634 Egestas Avenue","Clovenfords","United Kingdom"),
("Charlotte","Ramos","794-1654 A Rd.","Akron","United States"),
("Dennis","Avery","P.O. Box 506, 4804 Molestie Avenue","Matlock","United Kingdom"),
("Igor","Malone","6627 Porttitor Rd.","Irvine","United Kingdom"),
("Connor","Witt","5979 Vel St.","Tain","United Kingdom"),
("Karen","Marquez","Ap #524-1173 Metus. Road","Annapolis Royal","Canada");

INSERT INTO `orders` (`date`,`currency`,`total`,`customerId`) 
VALUES ("2020-11-14","$",111,6),
("2020-07-07","£",958,4),
("2021-02-18","£",721,2),
("2020-05-25","$",834,4),
("2020-07-10","£",47,1),
("2021-02-27","£",587,4),
("2021-03-04","£",198,10),
("2020-09-03","$",200,3),
("2020-11-17","£",726,3),
("2020-12-29","$",200,5);