extends AnimatableBody2D

signal keyfall
func _process(_delta):
	if $PlatKey0.position.y>200:
		$AnimationPlayer.play("UP")
		keyfall.emit()
