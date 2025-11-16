extends Node

@export var levelname: String
@export var levelname_spa: String
@export var levelname_fre: String
@export var levelname_ita: String
@export var levelname_ger: String
@export var levelname_jpn: String
@export var levelcreator: String
@onready var leveldesc = "Watch out! Here comes Pop-Out Pete!
This tricky ol' ad-pop up window is always up to no good with his pop-up attacks, and his Sticknode protection.
It's about that time to use that E-mail Shooter for a good use. When open, shoot him down!
Careful, this dude can teleport!"

@onready var leveldesc_spa = "¡Cuidado! ¡Aquí viene Pop-Out Pete!
Esta ventanita emergente tan traicionera siempre está tramando algo malo con sus ataques emergentes y su protección Sticknode.
Es hora de darle un buen uso al E-mail Shooter. Cuando se abra, ¡dispárale!
¡Cuidado, este tipo puede teletransportarse!"

@onready var leveldesc_fre = "Attention ! Voici Pop-Out Pete !
Cette fenêtre publicitaire pop-up sournoise n'a rien de bon à offrir avec ses attaques pop-up et sa protection Sticknode.
Il est temps d'utiliser cet E-mail Shooter à bon escient. Quand il s'ouvre, abattez-le !
Attention, ce type peut se téléporter !"

@onready var leveldesc_ita = "Attenzione! Arriva Pop-Out Pete!
Questo vecchio e subdolo pop-up pubblicitario è sempre pronto a combinare guai con i suoi attacchi pop-up e la sua protezione Sticknode.
È ora di usare l'E-mail Shooter per una buona causa. Quando si apre, abbattilo!
Attenzione, questo tizio può teletrasportarsi!"

@onready var leveldesc_ger = "Aufpassen! Da kommt Pop-Out Pete!
Dieses hinterhältige Pop-up-Fenster hat mit seinen Pop-up-Angriffen und seinem Sticknode-Schutz immer nur Unfug im Sinn.
Es wird Zeit, dass du deinen E-Mail-Shooter mal sinnvoll einsetzt. Sobald er erscheint, schieß ihn ab!
Vorsicht, dieser Typ kann sich teleportieren!"

@onready var leveldesc_jpn = "気をつけろ！ポップアウト・ピートが登場だ！
この厄介な広告ポップアップウィンドウは、ポップアップ攻撃とスティックノードによる防御で、いつも悪さを企んでいる。
そろそろ、E メール シューターを有効に活用する時期です。奴が開いたら、撃ち落とせ！
気をつけろ、こいつはテレポートできるぞ！"

@export var levelthumb: CompressedTexture2D
