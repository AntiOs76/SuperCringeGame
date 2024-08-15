extends CharacterBody2D

@export var startpos = Vector2(56,121)

@export var JUMP_VELOCITY = 250.0
@export var WALK_FORCE = 300.0
@export var WALK_MAX_SPEED = 50.0
@export var STOP_FORCE = 200.0

# 获得重力常数
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# 幽灵模式： set_collision_mask(0)

	# 加入重力
	if not is_on_floor():
		velocity.y += gravity * delta
	# 跳
	elif Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP_VELOCITY


	var walk = WALK_FORCE * (Input.get_axis("ui_left", "ui_right")) #摇杆支持
	# 摩擦力减速，如果不动
	if abs(walk) < WALK_FORCE * 0.2: #摇杆死区
		# 地面摩擦力减速，空中无摩擦力
		if is_on_floor():
			velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# 限速
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	
	# 处理动画
	# 若具有速度
	if not velocity.is_zero_approx():
		if velocity.x > 0.0:
			$Sprite2D.scale.x = 1.0
		else:
			$Sprite2D.scale.x = -1.0
		$AnimationPlayer.play("Walk")
	# 静止
	else:
		$AnimationPlayer.play("Idle")
		
	# 坠入虚空的处理	
	if position.y>1000:
		$Dead.visible = true
		# 重开吧
		if Input.is_action_just_pressed("restart"):
			set_position(startpos)
			$Dead.visible = false
			
	move_and_slide()
