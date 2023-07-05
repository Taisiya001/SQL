CREATE TABLE `telephone`.`new_table1` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `manufacture` VARCHAR(45) NOT NULL,
  `product_count` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
INSERT INTO `telephone`.`new_table1` (`id`, `product_name`, `manufacture`, `product_count`, `price`) VALUES ('1', 'iPhone X', 'Apple', '3', '76000');
INSERT INTO `telephone`.`new_table1` (`id`, `product_name`, `manufacture`, `product_count`, `price`) VALUES ('2', 'iPhone 8', 'Apple', '2', '51000');
INSERT INTO `telephone`.`new_table1` (`id`, `product_name`, `manufacture`, `product_count`, `price`) VALUES ('3', 'Galaxy S9', 'Samsung', '2', '56000');
INSERT INTO `telephone`.`new_table1` (`id`, `product_name`, `manufacture`, `product_count`, `price`) VALUES ('4', 'Galaxy S8', 'Samsung', '1', '41000');
INSERT INTO `telephone`.`new_table1` (`id`, `product_name`, `manufacture`, `product_count`, `price`) VALUES ('5', 'P20 Pro', 'Huawei', '5', '36000');

SELECT * FROM telephone.new_table;
WHERE count > 2 AND model = 'Samsung';
WHERE product_name like 'iPhone';
WHERE product_name like 'Samsung';
WHERE price like '8';
