extends Node

@export var levelname: String
@export var levelname_spa: String
@export var levelname_fre: String
@export var levelname_ita: String
@export var levelname_ger: String
@export var levelname_jpn: String
@export var levelcreator: String
@onready var leveldesc = "OH NO! It's the devious big mean of a square, Monstequare!
He's here to stop you on your journey and use any of his attacks against you.
Perhaps those green squares that he'll spit out at times might help you out.
But other than that, face against Monstequare, and take him out. This is your first boss battle."

@onready var leveldesc_spa = "¡OH NO! ¡Es el malvado y astuto cuadrado gigante, Monstequare!
Está aquí para detenerte en tu viaje y usará todos sus ataques contra ti.
Quizás esos cuadrados verdes que escupirá de vez en cuando te sean de ayuda.
Pero, aparte de eso, enfréntate a Monstequare y derrótalo. Esta es tu primera batalla contra un jefe."

@onready var leveldesc_fre = "OH NON ! C'est le monstrueux et perfide carré, Monstequare !
Il est là pour vous arrêter dans votre voyage et utiliser toutes ses attaques contre vous.
Peut-être que ces carrés verts qu'il crache parfois pourraient vous être utiles.
Mais à part ça, affrontez Monstequare et éliminez-le. C'est votre premier combat de boss."

@onready var leveldesc_ita = "OH NO! È arrivato il perfido e malvagio quadrato gigante, Monstequare!
Lui è qui per fermarti nel tuo viaggio e usare contro di te tutti i suoi attacchi.
Forse quei quadrati verdi che sputerà di tanto in tanto potrebbero esserti d'aiuto.
Ma a parte questo, affronta Monstequare e sconfiggilo. Questa è la tua prima battaglia contro un boss."

@onready var leveldesc_ger = "OH NEIN! Es ist das hinterlistige, gemeine Quadrat, Monstequare!
Er ist hier, um dich auf deiner Reise aufzuhalten und wird all seine Angriffe gegen dich einsetzen.
Vielleicht können dir die grünen Quadrate, die er ab und zu ausspuckt, ja helfen.
Aber abgesehen davon, stell dich Monstequare und schalte ihn aus. Dies ist dein erster Bosskampf."

@onready var leveldesc_jpn = "大変だ！邪悪で巨大な四角形、モンスタースクエアが現れた！
彼は君の旅を阻止するためにやってきて、あらゆる攻撃を仕掛けてくるだろう。
時々吐き出す緑色の四角が役に立つかもしれません。
それ以外は、モンスタースクエアに立ち向かい、奴を倒せ！これが君にとって最初のボス戦だ。"
@export var levelthumb: CompressedTexture2D
