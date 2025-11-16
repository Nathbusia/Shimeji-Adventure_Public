extends Node

@export var levelname: String
@export var levelname_spa: String
@export var levelname_fre: String
@export var levelname_ita: String
@export var levelname_ger: String
@export var levelname_jpn: String
@export var levelcreator: String
@onready var leveldesc = "Welcome to the internet! Where the sky is technogical blue, and the connections always rule!
Here, there are a few tasks to complete. One fellow named Clara might need your help to find those Orb Balls.
If you succeed, you'll be rewarded greatly!
Also, watch out for Flownets! Those blue flowing creatures can't be taken down with!"

@onready var leveldesc_spa = "¡Bienvenido a internet! Donde el cielo es de un azul tecnológico, ¡y las conexiones siempre mandan!
Aquí, tienes algunas tareas que completar. Una chica llamada Clara podría necesitar tu ayuda para encontrar esas esferas.
Si lo consigues, ¡serás recompensado generosamente!
Además, ¡ten cuidado con los Flownets! ¡Esas criaturas azules y fluidas no pueden ser derrotadas!"

@onready var leveldesc_fre = "Bienvenue sur internet ! Ici, le ciel est d'un bleu technologique et les connexions sont reines !
Vous avez quelques tâches à accomplir. Une certaine Clara a besoin de votre aide pour retrouver ces boules d'énergie.
Si vous réussissez, vous serez généreusement récompensé !
Attention aussi aux Flownets ! Ces créatures bleues et fluides sont invincibles !"

@onready var leveldesc_ita = "Benvenuti su internet! Dove il cielo è di un blu tecnologico e le connessioni regnano sovrane!
Qui, ci sono alcuni compiti da completare. Una tipa di nome Clara potrebbe aver bisogno del tuo aiuto per trovare quelle Orb Ball.
Se ci riuscirai, sarai ricompensato generosamente!
Inoltre, fai attenzione ai Flownet! Quelle creature blu fluenti non possono essere abbattute!"

@onready var leveldesc_ger = "Willkommen im Internet! Wo der Himmel technogisch blau ist und Verbindungen immer das Sagen haben!
Hier gibt es ein paar Aufgaben zu erledigen. Eine gewisse Clara könnte Ihre Hilfe benötigen, um diese Orb-Bälle zu finden.
Wenn du Erfolg hast, wirst du reichlich belohnt!
Pass außerdem auf die Flownets auf! Diese blauen, fließenden Kreaturen sind unbesiegbar!"

@onready var leveldesc_jpn = "インターネットへようこそ！ここでは空はテクノロジーブルーに輝き、ネットワーク接続がすべてを支配しています！
さて、いくつかこなすべきタスクがあります。クララという人物が、オーブボールを探すのにあなたの助けを必要としているようです。
成功すれば大きな報酬が得られます！
また、フローネットにも注意してください!あの青く流れるような生き物は、倒すことができません！"

@export var levelthumb: CompressedTexture2D
