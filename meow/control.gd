extends Control

var timer: float = 0.0
var result: String = ""
var reverse_input: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    var _s: String = $Title/HFlowContainer/LineEdit.text

    _s = _s if _s != "" else "喵~"
    result = ("{0}" + "\u202d\u202d\u2067" + "{1}" + "\u2067\u202d\u202d").format([$LineEdit.text, _s.reverse() if reverse_input else _s])
    $LineEdit/Preview.text = result

    if not $LineEdit.text == "":
        $Control/Button.position.y = lerp($Control/Button.position.y, 0.0, 1.0 - 0.001 ** delta)
        $LineEdit/PreviewOther.text = "某位群友：@" + result + " 这是测试文本"
    else:
        $Control/Button.position.y = lerp($Control/Button.position.y, -100.0 - 10.0, 1.0 - 0.001 ** delta)
        $LineEdit/PreviewOther.text = ""

    timer += 1.0 * delta


func _on_button_pressed() -> void:
    DisplayServer.clipboard_set(result)


func _on_button1_pressed() -> void:
    reverse_input = false if reverse_input else true
