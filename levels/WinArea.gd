extends Area2D

func _on_body_entered(body):
	if body.name == "RigidPlayer":
		$LabelWinHide.visible= true
