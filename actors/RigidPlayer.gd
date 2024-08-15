extends RigidBody2D

@export var startpos = Vector2(56,121)

@export var JUMP_VELOCITY = 300.0
@export var WALK_FORCE = 35.0
@export var WALK_MAX_SPEED = 75.0

# 获得重力常数
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# 脚底板
@onready var shape_cast = $ShapeCast2D
signal restart
func _physics_process(_delta):
	# 幽灵模式： set_collision_mask(0)

	#  刚体无需担心空中重力。刚体要在Inspector里禁止旋转。

	# 跳力
	if Input.is_action_just_pressed("ui_up") and on_floor():
		apply_central_impulse(Vector2(0,-JUMP_VELOCITY))

	var walk = Input.get_axis("ui_left", "ui_right") #摇杆支持。把WALK_FORCE下放了。
	# 摩擦力减速，如果不动
	if abs(walk) > 0.2: #摇杆死区
		
		"""
		# 地面摩擦力减速，空中无摩擦力.现在用物理材质实现，不用代码！
		if on_floor():
			pass
			# apply_central_impulse(Vector2(-linear_velocity.x,0).normalized() * STOP_FORCE)
		"""
	###
	# 限速地加速
		if abs(linear_velocity.x)<WALK_MAX_SPEED:
			apply_central_impulse(Vector2(walk*WALK_FORCE,0))
	
	# 处理动画
	# 若具有速度
	if not linear_velocity.is_zero_approx():
		if linear_velocity.x > 0.0:
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
			linear_velocity = Vector2(0.0,0.0)
			$Dead.visible = false
			restart.emit()
			
func on_floor():
	if shape_cast.is_colliding():
		return true

