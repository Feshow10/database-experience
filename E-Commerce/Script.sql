-- MySQL Script generated by MySQL Workbench
-- Fri Sep 23 20:46:39 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Carro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Carro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Carro` (
  `idCarro` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Placa` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idCarro`, `Cliente_idCliente`),
  INDEX `fk_Carro_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Carro_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClientePF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ClientePF` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ClientePF` (
  `idClientePF` INT NOT NULL,
  `CPF` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idClientePF`, `Cliente_idCliente`),
  INDEX `fk_ClientePF_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ClientePF_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClientePJ`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ClientePJ` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ClientePJ` (
  `idClientePJ` INT NOT NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idClientePJ`, `Cliente_idCliente`),
  INDEX `fk_ClientePJ_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_ClientePJ_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disponibilizando um produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Disponibilizando um produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilizando um produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrega`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Entrega` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Entrega` (
  `idEntrega` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `Rastreamento` VARCHAR(45) NULL,
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`idEntrega`, `Terceiro - Vendedor_idTerceiro - Vendedor`, `Pedido_idPedido`),
  INDEX `fk_Entrega_Terceiro - Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
  INDEX `fk_Entrega_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Entrega_Terceiro - Vendedor1`
    FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`)
    REFERENCES `mydb`.`Terceiro - Vendedor` (`idTerceiro - Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Entrega_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Estoque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Forma de Pagamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Forma de Pagamento` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Forma de Pagamento` (
  `idForma de Pagamento` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  PRIMARY KEY (`idForma de Pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Fornecedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecânicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecânicos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mecânicos` (
  `idMecânicos` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Área de atuação` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecânicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecânicos da Ordem de Serviço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Mecânicos da Ordem de Serviço` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Mecânicos da Ordem de Serviço` (
  `Mecânicos_idMecânicos` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Mecânicos_idMecânicos`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Mecânicos_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Mecânicos_has_Ordem de Serviço_Mecânicos1_idx` (`Mecânicos_idMecânicos` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânicos_has_Ordem de Serviço_Mecânicos1`
    FOREIGN KEY (`Mecânicos_idMecânicos`)
    REFERENCES `mydb`.`Mecânicos` (`idMecânicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecânicos_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ordem de Serviço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ordem de Serviço` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Emissão` DATETIME NULL,
  `Conclusão` DATETIME NULL,
  `Status` VARCHAR(45) NULL,
  `Carro_idCarro` INT NOT NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idOrdem de Serviço`, `Carro_idCarro`),
  INDEX `fk_Ordem de Serviço_Carro1_idx` (`Carro_idCarro` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem de Serviço_Carro1`
    FOREIGN KEY (`Carro_idCarro`)
    REFERENCES `mydb`.`Carro` (`idCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Partes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Partes` (
  `idPartes` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idPartes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partes da Ordem de Serviço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Partes da Ordem de Serviço` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Partes da Ordem de Serviço` (
  `Partes_idPartes` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Partes_idPartes`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Partes_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Partes_has_Ordem de Serviço_Partes1_idx` (`Partes_idPartes` ASC) VISIBLE,
  CONSTRAINT `fk_Partes_has_Ordem de Serviço_Partes1`
    FOREIGN KEY (`Partes_idPartes`)
    REFERENCES `mydb`.`Partes` (`idPartes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partes_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Status do pedido` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Frete` FLOAT NULL,
  `Forma de Pagamento_idForma de Pagamento` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Forma de Pagamento_idForma de Pagamento`, `Cliente_idCliente`),
  INDEX `fk_Pedido_Forma de Pagamento1_idx` (`Forma de Pagamento_idForma de Pagamento` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Forma de Pagamento1`
    FOREIGN KEY (`Forma de Pagamento_idForma de Pagamento`)
    REFERENCES `mydb`.`Forma de Pagamento` (`idForma de Pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto em Estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produto em Estoque` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produto em Estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`),
  INDEX `fk_Produto_has_Estoque_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_Produto_has_Estoque_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Estoque_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos por Vendedor (Terceiro)`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Produtos por Vendedor (Terceiro)` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Produtos por Vendedor (Terceiro)` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`),
  INDEX `fk_Terceiro - Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1`
    FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`)
    REFERENCES `mydb`.`Terceiro - Vendedor` (`idTerceiro - Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relação Produto/Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Relação Produto/Pedido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Relação Produto/Pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Serviços`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Serviços` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Serviços` (
  `idServiços` INT NOT NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  PRIMARY KEY (`idServiços`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Serviços da OS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Serviços da OS` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Serviços da OS` (
  `Serviços_idServiços` INT NOT NULL,
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  PRIMARY KEY (`Serviços_idServiços`, `Ordem de Serviço_idOrdem de Serviço`),
  INDEX `fk_Serviços_has_Ordem de Serviço_Ordem de Serviço1_idx` (`Ordem de Serviço_idOrdem de Serviço` ASC) VISIBLE,
  INDEX `fk_Serviços_has_Ordem de Serviço_Serviços1_idx` (`Serviços_idServiços` ASC) VISIBLE,
  CONSTRAINT `fk_Serviços_has_Ordem de Serviço_Serviços1`
    FOREIGN KEY (`Serviços_idServiços`)
    REFERENCES `mydb`.`Serviços` (`idServiços`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serviços_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_idOrdem de Serviço`)
    REFERENCES `mydb`.`Ordem de Serviço` (`idOrdem de Serviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Terceiro - Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Terceiro - Vendedor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Terceiro - Vendedor` (
  `idTerceiro - Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
