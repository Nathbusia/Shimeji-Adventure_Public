extends Node

@export var levelname: String
@export var levelname_spa: String
@export var levelname_fre: String
@export var levelname_ita: String
@export var levelname_ger: String
@export var levelname_jpn: String
@export var levelcreator: String
@onready var leveldesc = "This here is just a test level to test out some simple mechanics like running, jumping, and attacking on enemies."

@onready var leveldesc_spa = "Este es un nivel de prueba diseñado para evaluar algunas mecánicas básicas, como correr, saltar y atacar enemigos."

@onready var leveldesc_fre = "Il s'agit d'un niveau de test conçu pour tester certaines mécaniques de base, notamment la course, le saut et l'attaque des ennemis."

@onready var leveldesc_ita = "Questo è un livello di prova progettato per testare alcune meccaniche di base, tra cui la corsa, il salto e l'attacco ai nemici."

@onready var leveldesc_ger = "Dies ist ein Testlevel, der dazu dient, einige grundlegende Spielmechaniken zu testen, darunter Laufen, Springen und das Angreifen von Feinden."

@onready var leveldesc_jpn = "これは、走る、ジャンプする、敵を攻撃するなど、いくつかの基本的な操作メカニズムをテストするために設計されたテストレベルです。"
@export var levelthumb: CompressedTexture2D
