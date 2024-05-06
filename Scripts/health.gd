extends TextureProgressBar

@export var player: Player
@export var boss: EnemyBoss
# Called when the node enters the scene tree for the first time.
func _ready():
	if player != null:
		player.healthChanged.connect(updatePlayerHealth) # Replace with function body.
		updatePlayerHealth()
	elif boss != null:
		boss.healthChanged.connect(updateBossHealth) # Replace with function body.
		updateBossHealth()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func updatePlayerHealth():
	if has_node("/root/PlayerVariables"):
		var player_vars = get_node("/root/PlayerVariables")
		max_value = player_vars.level_health * 4
		value = player_vars.health

func updateBossHealth():
	var player_vars = get_node("/root/PlayerVariables")
	var boss_max_health: int = player_vars.level_health * 12
	max_value = boss_max_health
	if boss.health > boss_max_health:
		boss.health = boss_max_health
	value = boss.health
