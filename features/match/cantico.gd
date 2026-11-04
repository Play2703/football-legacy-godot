extends RefCounted



















const ON: int = 80
const OFF: int = 65

const CASA: String = "casa"
const VIAJA: String = "viaja"
const BURLA: String = "burla"


const CALMA_VIAJA: float = 0.5



static func sigue(tenia: bool, aficion: int) -> bool:
	return aficion > OFF if tenia else aficion >= ON





static func modo(local: bool, tuyo: bool, burla: bool) -> String:
	if burla and not local:
		return BURLA
	if not tuyo:
		return ""
	return CASA if local else VIAJA





static func en_balon(modo: String, kind: String) -> bool:
	return not modo.is_empty() and not (modo == CASA and kind == "penal")



static func letra(apellido: String, modo: String) -> String:
	if apellido.is_empty() or modo.is_empty():
		return ""
	if modo == BURLA:
		return I18n.tf("¡{0}, TRAIDOR!", [apellido])
	return I18n.tf("¡{0}, {0}!", [apellido])
