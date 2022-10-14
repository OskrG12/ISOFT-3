var brinco: int = 600
var gravedad: int = 800
var vel: Vector2 = Vector2()
var piso: bool = false
onready var sprite = $Sprite
var jump_ani_playing = false

onready var animatedSprite = $AnimatedSprite

func _physics_process(delta):
	vel.x = 0
	if Input.is_action_pressed("ui_left")
		vel.x -= velocidad
	if Input.is_action_pressed("ui_right")
		vel.x += velocidad
	vel = move_and_slide(vel,Vector2)
	vel.y += gravedad * delta
	if Input.is_action_pressed("ui_up")
		vel.y -= brinco
	pass

func _ process(delta):
	if Input.is_action_pressed("ui_left")
		animatedSprite.play("left")
	elif Input.is_action_pressed("ui_right")
		animatedSprite.play("right")
	elif Input.is_action_pressed("ui_up")
		animatedSprite.play("jump")
	else:
		animatedSprite.play("idle")
