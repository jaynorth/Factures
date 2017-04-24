
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/24/2017 15:10:45
-- Generated from EDMX file: C:\Users\jayweb\GIT Avril 2017\Factures\Factures\ModelFactIDEC.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FactIDEC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Facture_Client]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facture] DROP CONSTRAINT [FK_Facture_Client];
GO
IF OBJECT_ID(N'[dbo].[FK_LigneFacture_Article]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneFacture] DROP CONSTRAINT [FK_LigneFacture_Article];
GO
IF OBJECT_ID(N'[dbo].[FK_LigneFacture_Client]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneFacture] DROP CONSTRAINT [FK_LigneFacture_Client];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Article]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article];
GO
IF OBJECT_ID(N'[dbo].[Client]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Client];
GO
IF OBJECT_ID(N'[dbo].[Facture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facture];
GO
IF OBJECT_ID(N'[dbo].[LigneFacture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LigneFacture];
GO
IF OBJECT_ID(N'[dbo].[Utilisateur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Utilisateur];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(50)  NOT NULL,
    [Prix] decimal(18,2)  NOT NULL,
    [Num] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(50)  NOT NULL,
    [Prenom] nvarchar(50)  NOT NULL,
    [DateNaissance] datetime  NOT NULL,
    [Rue] nvarchar(50)  NOT NULL,
    [Npa] int  NOT NULL,
    [Localite] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Factures'
CREATE TABLE [dbo].[Factures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Numero] nvarchar(50)  NOT NULL,
    [DateFacture] datetime  NOT NULL,
    [ClientId] int  NOT NULL
);
GO

-- Creating table 'LigneFactures'
CREATE TABLE [dbo].[LigneFactures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ArticleId] int  NULL,
    [FactureId] int  NULL,
    [Quantite] int  NOT NULL,
    [Montant] decimal(18,2)  NOT NULL
);
GO

-- Creating table 'Utilisateurs'
CREATE TABLE [dbo].[Utilisateurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Utilisateur1] nvarchar(50)  NOT NULL,
    [MotDePasse] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures'
ALTER TABLE [dbo].[Factures]
ADD CONSTRAINT [PK_Factures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [PK_LigneFactures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Utilisateurs'
ALTER TABLE [dbo].[Utilisateurs]
ADD CONSTRAINT [PK_Utilisateurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ArticleId] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [FK_LigneFacture_Article]
    FOREIGN KEY ([ArticleId])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LigneFacture_Article'
CREATE INDEX [IX_FK_LigneFacture_Article]
ON [dbo].[LigneFactures]
    ([ArticleId]);
GO

-- Creating foreign key on [ClientId] in table 'Factures'
ALTER TABLE [dbo].[Factures]
ADD CONSTRAINT [FK_Facture_Client]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Facture_Client'
CREATE INDEX [IX_FK_Facture_Client]
ON [dbo].[Factures]
    ([ClientId]);
GO

-- Creating foreign key on [FactureId] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [FK_LigneFacture_Client]
    FOREIGN KEY ([FactureId])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LigneFacture_Client'
CREATE INDEX [IX_FK_LigneFacture_Client]
ON [dbo].[LigneFactures]
    ([FactureId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------