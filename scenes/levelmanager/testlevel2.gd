extends Node

@export var levelname: String
@export var levelname_spa: String
@export var levelname_fre: String
@export var levelname_ita: String
@export var levelname_ger: String
@export var levelname_jpn: String
@export var levelcreator: String
@onready var leveldesc = "This is another test level, but now with more complex gameplay mechanics.
These include picking up objects, and throwing them, bounce pads, and even some buttons, and moving platforms.
Oh yeah! Climbing too."

@onready var leveldesc_spa = "Este es otro nivel de prueba, pero ahora con mecánicas de juego más complejas.
Estas incluyen recoger y lanzar objetos, plataformas de rebote e incluso botones, así como plataformas móviles.
¡Ah, sí! También escalar."

@onready var leveldesc_fre = "Voici un autre niveau de test, mais avec des mécanismes de jeu plus complexes.
Cela inclut la possibilité de ramasser et de lancer des objets, des plateformes rebondissantes, et même des boutons, ainsi que des plateformes mobiles.
Oh ouais! L'escalade aussi."

@onready var leveldesc_ita = "Questo è un altro livello di prova, ma ora con meccaniche di gioco più complesse.
Queste includono la possibilità di raccogliere e lanciare oggetti, piattaforme rimbalzanti e persino pulsanti, oltre a piattaforme mobili.
Ah, sì! Anche l'arrampicata."

@onready var leveldesc_ger = "Dies ist eine weitere Testebene, aber jetzt mit komplexeren Spielmechaniken.
Dazu gehören das Aufnehmen und Werfen von Objekten, Sprungplattformen und sogar Knöpfe sowie bewegliche Plattformen.
Ach ja! Klettern auch."

@onready var leveldesc_jpn = "これは別のテストレベルですが、今回はより複雑なゲームプレイメカニクスが導入されています。
具体的には、オブジェクトを拾って投げたり、バウンスパッド、ボタン、そして動く足場などがあります。
ああ、それからクライミングもできますよ。"

@export var levelthumb: CompressedTexture2D
