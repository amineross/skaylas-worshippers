extends Node3D

var spawnPoints: Array[Node]
var enemyNodes : Array[Node]
var hasSpawned

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPoints = get_node("SpawnPoints").get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_trigger_body_entered(body):
	if hasSpawned:
		return
	
	if body.is_in_group("Player"):
		spawn()

func spawn():
	for point in spawnPoints:
		spawnEnemyAt(point)
	hasSpawned = true

func spawnEnemyAt(targetPoint: Node):
	var enemyToSpawn = preload("res://Asset/Scene/enemy.tscn")
	var enemyInstance = enemyToSpawn.instantiate()
	get_tree().get_root().get_node("Node3D").add_child(enemyInstance)
	enemyInstance.global_position = targetPoint.global_position
	
	enemyNodes.append(enemyInstance)
