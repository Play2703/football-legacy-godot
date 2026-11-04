class_name FormatoCopa
extends RefCounted

const COPA: String = "copa"
const LIGA: String = "liga"



const VERSION: int = 1


const NOMBRES: Array[String] = ["Previa", "Primera ronda", "Segunda ronda", "Tercera ronda",
	"Cuarta ronda", "Quinta ronda", "Sexta ronda", "Séptima ronda", "Octava ronda",
	"Treintaidosavos", "Dieciseisavos", "Octavos", "Cuartos", "Semifinal", "Final",
	"Fase de grupos", "Fase de liga", "Playoff"]



const SIEMBRA_GRUPOS: int = 1000












const TEMPORADA_EUROPA: Array = [8, 10]

const DATOS: Dictionary = {
	"Alemania": {
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[1], [2], [3]], "loc": "menor", "bom": true, "mes": 8.4},
			{"n": "Segunda ronda", "c": 32, "loc": "menor", "mes": 10.9},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 12.1},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 2.1},
			{"n": "Semifinal", "c": 4, "loc": "menor", "mes": 4.3},
			{"n": "Final", "c": 2, "mes": 5.7}],
		"super": {"t": "final", "sede": "copa", "des": "penales", "mes": 8.1}},
	"Arabia Saudí": {
		"copa": [
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2, 1, 14]], "mes": 9.3},
			{"n": "Octavos", "c": 16, "mes": 10.6},
			{"n": "Cuartos", "c": 8, "mes": 11.5},
			{"n": "Semifinal", "c": 4, "mes": 3.5},
			{"n": "Final", "c": 2, "mes": 5.5}],
		"super": {"t": "f4", "sede": "fuera", "des": "prorroga", "mes": 8.6}},
	"Argentina": {
		"t": [2, 10],
		"copa": [
			{"n": "Treintaidosavos", "c": 64, "e": [[1], [2], [3, 1, 17]], "neu": true, "des": "penales", "mes": 2.8},
			{"n": "Dieciseisavos", "c": 32, "neu": true, "des": "penales", "mes": 5.5},
			{"n": "Octavos", "c": 16, "neu": true, "des": "penales", "mes": 8.5},
			{"n": "Cuartos", "c": 8, "neu": true, "des": "penales", "mes": 9.8},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 11.3},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.1}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 11.4}},
	"Austria": {
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[1], [2], [3]], "loc": "menor", "mes": 7.6},
			{"n": "Segunda ronda", "c": 32, "loc": "menor", "mes": 9.4},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 10.9},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 2.2},
			{"n": "Semifinal", "c": 4, "mes": 3.5},
			{"n": "Final", "c": 2, "mes": 5.1}]},
	"Bolivia": {
		"t": [2, 10],
		"copa": [
			{"n": "Fase de grupos", "c": 16, "e": [[1]], "des": "penales", "mes": 8.5,
				"g": {"n": 4, "v": 2, "pasan": 2, "fin": 10.2}},
			{"n": "Cuartos", "c": 8, "p": 2, "loc": "cabeza", "des": "penales", "mes": 10.6, "mes2": 10.8},
			{"n": "Semifinal", "c": 4, "p": 2, "loc": "cabeza", "des": "penales", "mes": 11.2, "mes2": 11.4},
			{"n": "Final", "c": 2, "p": 2, "loc": "cabeza", "neu": false, "des": "penales", "mes": 11.8, "mes2": 12.0}]},
	"Brasil": {
		"t": [2, 10],
		"copa": [
			{"n": "Primera ronda", "c": 28, "e": [[3]], "des": "penales", "mes": 2.3},
			{"n": "Segunda ronda", "c": 88, "e": [[2]], "des": "penales", "mes": 2.8},
			{"n": "Tercera ronda", "c": 48, "des": "penales", "mes": 3.3},
			{"n": "Cuarta ronda", "c": 24, "des": "penales", "mes": 3.8},
			{"n": "Quinta ronda", "c": 32, "e": [[1]], "p": 2, "des": "penales", "mes": 4.6, "mes2": 5.2},
			{"n": "Octavos", "c": 16, "p": 2, "des": "penales", "mes": 7.9, "mes2": 8.2},
			{"n": "Cuartos", "c": 8, "p": 2, "des": "penales", "mes": 8.7, "mes2": 9.1},
			{"n": "Semifinal", "c": 4, "p": 2, "des": "penales", "mes": 10.9, "mes2": 11.3},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.1}],


		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 2.0}},
	"Bélgica": {
		"copa": [
			{"n": "Quinta ronda", "c": 32, "e": [[3]], "loc": "menor", "mes": 8.8},
			{"n": "Sexta ronda", "c": 32, "e": [[2]], "loc": "menor", "mes": 9.4},
			{"n": "Séptima ronda", "c": 32, "e": [[1]], "loc": "menor", "bom": true, "mes": 10.9},
			{"n": "Octavos", "c": 16, "mes": 12.1},
			{"n": "Cuartos", "c": 8, "mes": 1.4},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 2.1, "mes2": 3.0},
			{"n": "Final", "c": 2, "mes": 5.1}],
		"super": {"t": "final", "sede": "liga", "des": "prorroga", "mes": 7.6}},
	"Catar": {
		"copa": [
			{"n": "Previa", "c": 8, "e": [[2, 1, 8]], "neu": true, "des": "penales", "mes": 1.2},
			{"n": "Octavos", "c": 16, "e": [[1]], "bom": true, "des": "penales", "mes": 1.7},
			{"n": "Cuartos", "c": 8, "neu": true, "des": "penales", "mes": 5.0},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 5.2},
			{"n": "Final", "c": 2, "des": "penales", "mes": 5.4}],
		"liga": [
			{"n": "Fase de liga", "c": 20, "e": [[1], [2, 1, 8]], "des": "penales", "mes": 9.0,
				"g": {"n": 1, "v": 1, "jor": 10, "pasan": 14, "fin": 1.5}},
			{"n": "Playoff", "c": 12, "loc": "cabeza", "des": "penales", "mes": 2.6},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "des": "penales", "mes": 3.4},
			{"n": "Semifinal", "c": 4, "loc": "cabeza", "des": "penales", "mes": 4.1},
			{"n": "Final", "c": 2, "des": "penales", "mes": 4.5}]},
	"Chequia": {
		"copa": [
			{"n": "Primera ronda", "c": 108, "e": [[2], [3]], "loc": "menor", "mes": 8.1},
			{"n": "Segunda ronda", "c": 54, "e": [[1, 5, 16]], "loc": "menor", "mes": 8.8},
			{"n": "Tercera ronda", "c": 32, "e": [[1, 1, 4]], "mes": 9.8},
			{"n": "Octavos", "c": 16, "mes": 11.0},
			{"n": "Cuartos", "c": 8, "mes": 3.2},
			{"n": "Semifinal", "c": 4, "mes": 4.3},
			{"n": "Final", "c": 2, "mes": 5.3}]},
	"Chile": {
		"t": [2, 10],
		"copa": [
			{"n": "Fase de grupos", "c": 32, "e": [[1], [2, 1, 16]], "des": "penales", "mes": 2.0,
				"g": {"n": 8, "v": 2, "pasan": 2, "fin": 7.6}},
			{"n": "Octavos", "c": 16, "p": 2, "loc": "cabeza", "bom": true, "des": "penales", "mes": 9.2, "mes2": 9.6},
			{"n": "Cuartos", "c": 8, "p": 2, "loc": "cabeza", "des": "penales", "mes": 10.2, "mes2": 10.6},
			{"n": "Semifinal", "c": 4, "p": 2, "loc": "cabeza", "des": "penales", "mes": 11.1, "mes2": 11.5},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.1}],



		"super": {"t": "f4", "sede": "neutral", "des": "penales", "mes": 1.7}},




	"Colombia": {
		"t": [1, 12],
		"copa": [
			{"n": "Fase de grupos", "c": 20, "e": [[1, 9, 20], [2, 9, 16]], "des": "penales", "mes": 5.0,
				"g": {"n": 4, "v": 1, "pasan": 2, "fin": 5.9}},
			{"n": "Playoff", "c": 16, "e": [[1, 1, 8], [2, 1, 8]], "solo": true, "p": 2, "loc": "menor", "bom": true,
				"des": "penales", "mes": 7.6, "mes2": 8.5},
			{"n": "Octavos", "c": 16, "loc": "cabeza", "bom": true, "des": "penales", "mes": 9.6},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "des": "penales", "mes": 10.3},
			{"n": "Semifinal", "c": 4, "p": 2, "loc": "cabeza", "des": "penales", "mes": 11.0, "mes2": 11.3},



			{"n": "Final", "c": 2, "p": 2, "loc": "cabeza", "neu": false, "des": "penales", "mes": 12.35, "mes2": 12.6}],




		"super": {"t": "doble", "sede": "cabeza", "des": "penales", "mes": 1.4, "mes2": 1.6,
			"entran": "liga"}},
	"Corea del Sur": {
		"t": [2, 10],
		"copa": [
			{"n": "Primera ronda", "c": 28, "e": [[3]], "loc": "menor", "mes": 3.2},
			{"n": "Segunda ronda", "c": 32, "e": [[2]], "loc": "menor", "mes": 3.6},
			{"n": "Tercera ronda", "c": 24, "e": [[1, 5, 12]], "loc": "menor", "mes": 4.3},
			{"n": "Octavos", "c": 16, "e": [[1, 1, 4]], "loc": "menor", "mes": 5.2},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 7.2},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 8.2, "mes2": 8.6},
			{"n": "Final", "c": 2, "mes": 11.9}],

		"super": {"t": "final", "sede": "liga", "des": "penales", "mes": 2.7}},
	"Croacia": {
		"copa": [
			{"n": "Previa", "c": 32, "e": [[2, 7, 22], [3, 1, 16]], "loc": "peor", "mes": 8.6},
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2, 1, 6]], "loc": "peor", "bom": true, "mes": 9.5},
			{"n": "Octavos", "c": 16, "loc": "peor", "mes": 10.8},
			{"n": "Cuartos", "c": 8, "mes": 3.1},
			{"n": "Semifinal", "c": 4, "mes": 4.2},
			{"n": "Final", "c": 2, "mes": 5.4}],
		"super": {"t": "final", "sede": "liga", "des": "prorroga", "mes": 7.6, "doblete": "no"}},
	"Dinamarca": {
		"copa": [
			{"n": "Primera ronda", "c": 92, "e": [[2], [3]], "loc": "peor", "mes": 8.2},
			{"n": "Segunda ronda", "c": 52, "e": [[1, 7, 12]], "loc": "peor", "mes": 9.0},
			{"n": "Tercera ronda", "c": 32, "e": [[1, 1, 6]], "loc": "peor", "mes": 9.7},
			{"n": "Octavos", "c": 16, "loc": "peor", "mes": 10.9},
			{"n": "Cuartos", "c": 8, "p": 2, "loc": "peor", "mes": 11.7, "mes2": 12.0},
			{"n": "Semifinal", "c": 4, "p": 2, "loc": "peor", "mes": 2.8, "mes2": 3.6},
			{"n": "Final", "c": 2, "mes": 5.3}]},
	"Ecuador": {
		"t": [2, 10],
		"copa": [
			{"n": "Primera ronda", "c": 32, "e": [[2], [3, 1, 13]], "loc": "menor", "des": "penales", "mes": 4.3},
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "loc": "menor", "bom": true, "des": "penales", "mes": 6.0},
			{"n": "Octavos", "c": 16, "loc": "menor", "des": "penales", "mes": 7.6},
			{"n": "Cuartos", "c": 8, "loc": "menor", "des": "penales", "mes": 8.6},
			{"n": "Semifinal", "c": 4, "p": 2, "des": "penales", "mes": 10.9, "mes2": 11.1},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.0}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 5.4}},
	"Egipto": {
		"t": [8, 11],
		"copa": [
			{"n": "Primera ronda", "c": 38, "e": [[3, 1, 16]], "des": "penales", "mes": 9.8},
			{"n": "Segunda ronda", "c": 22, "e": [[2]], "des": "penales", "mes": 11.1},
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "mes": 12.6},
			{"n": "Octavos", "c": 16, "mes": 1.8},
			{"n": "Cuartos", "c": 8, "mes": 2.8},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 3.8},
			{"n": "Final", "c": 2, "mes": 5.3}],
		"liga": [
			{"n": "Fase de grupos", "c": 21, "e": [[1]], "des": "penales", "mes": 12.3,
				"g": {"n": 3, "v": 1, "pasan": 2, "mejores": 2, "fin": 2.8}},
			{"n": "Cuartos", "c": 8, "p": 2, "des": "penales", "mes": 3.8, "mes2": 3.95},
			{"n": "Semifinal", "c": 4, "p": 2, "des": "penales", "mes": 5.8, "mes2": 6.05},
			{"n": "Final", "c": 2, "des": "penales", "mes": 6.25}],
		"super": {"t": "f4", "sede": "fuera", "des": "penales", "mes": 11.2,
			"f4": ["liga1", "copa1", "liga_cup1", "liga2"]}},
	"Escocia": {
		"copa": [
			{"n": "Segunda ronda", "c": 40, "e": [[3]], "mes": 10.9},
			{"n": "Tercera ronda", "c": 40, "e": [[2]], "mes": 11.9},
			{"n": "Cuarta ronda", "c": 32, "e": [[1]], "mes": 1.6},
			{"n": "Quinta ronda", "c": 16, "mes": 2.3},
			{"n": "Cuartos", "c": 8, "mes": 3.3},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 4.6},
			{"n": "Final", "c": 2, "mes": 5.8}],
		"liga": [
			{"n": "Fase de grupos", "c": 40, "e": [[1, 6, 12], [2], [3, 1, 12]], "des": "penales", "mes": 7.2,
				"g": {"n": 8, "v": 1, "pasan": 1, "mejores": 3, "fin": 7.9}},
			{"n": "Octavos", "c": 16, "e": [[1, 1, 5]], "loc": "cabeza", "mes": 8.6},
			{"n": "Cuartos", "c": 8, "mes": 9.6},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 11.1},
			{"n": "Final", "c": 2, "mes": 12.4}]},
	"España": {
		"copa": [
			{"n": "Primera ronda", "c": 112, "e": [[1, 5, 20], [2], [3]], "loc": "menor", "bom": true, "mes": 10.9},
			{"n": "Segunda ronda", "c": 56, "loc": "menor", "bom": true, "mes": 12.1},
			{"n": "Dieciseisavos", "c": 32, "e": [[1, 1, 4]], "loc": "menor", "bom": true, "mes": 12.6},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 1.5},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 2.1},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 2.4, "mes2": 3.1},
			{"n": "Final", "c": 2, "mes": 4.6}],

		"super": {"t": "f4", "sede": "fuera", "des": "penales", "mes": 1.3}},
	"Estados Unidos": {
		"t": [2, 10],
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[3]], "mes": 3.2},
			{"n": "Segunda ronda", "c": 32, "e": [[2]], "mes": 3.7},
			{"n": "Dieciseisavos", "c": 32, "e": [[1, 15, 30]], "loc": "cabeza", "mes": 4.3},
			{"n": "Octavos", "c": 16, "mes": 4.8},
			{"n": "Cuartos", "c": 8, "mes": 5.5},
			{"n": "Semifinal", "c": 4, "mes": 9.2},
			{"n": "Final", "c": 2, "neu": false, "mes": 10.0}]},
	"Fiyi": {
		"t": [2, 10],
		"copa": [
			{"n": "Fase de grupos", "c": 8, "e": [[1, 1, 8]], "neu": true, "mes": 6.2,
				"g": {"n": 2, "v": 1, "pasan": 2, "fin": 6.4}},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 6.6},
			{"n": "Final", "c": 2, "mes": 6.7}],
		"super": {"t": "doble", "sede": "cabeza", "des": "penales", "mes": 2.2, "mes2": 2.45}},
	"Francia": {
		"copa": [
			{"n": "Séptima ronda", "c": 176, "e": [[2], [3]], "loc": "menor", "mes": 11.3},
			{"n": "Octava ronda", "c": 92, "loc": "menor", "mes": 11.7},
			{"n": "Treintaidosavos", "c": 64, "e": [[1]], "loc": "menor", "mes": 12.6},
			{"n": "Dieciseisavos", "c": 32, "loc": "menor", "mes": 1.5},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 2.2},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 3.1},
			{"n": "Semifinal", "c": 4, "mes": 4.3},
			{"n": "Final", "c": 2, "mes": 5.5}],
		"super": {"t": "final", "sede": "fuera", "des": "penales", "mes": 1.2}},
	"Grecia": {
		"copa": [
			{"n": "Previa", "c": 22, "e": [[1, 9, 14], [2, 1, 16]], "mes": 8.8},
			{"n": "Fase de liga", "c": 20, "e": [[1, 1, 8]], "mes": 9.6,
				"g": {"n": 1, "v": 1, "jor": 4, "pasan": 12, "fin": 12.1}},
			{"n": "Playoff", "c": 12, "loc": "cabeza", "mes": 1.2},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "mes": 1.7},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 2.2, "mes2": 3.0},
			{"n": "Final", "c": 2, "mes": 4.8}]},
	"Inglaterra": {
		"copa": [
			{"n": "Primera ronda", "c": 80, "e": [[3]], "mes": 11.1},
			{"n": "Segunda ronda", "c": 40, "mes": 12.1},
			{"n": "Tercera ronda", "c": 64, "e": [[1], [2]], "mes": 1.3},
			{"n": "Cuarta ronda", "c": 32, "mes": 2.1},
			{"n": "Quinta ronda", "c": 16, "mes": 3.1},
			{"n": "Cuartos", "c": 8, "mes": 4.1},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 4.8},
			{"n": "Final", "c": 2, "mes": 5.5}],
		"liga": [
			{"n": "Primera ronda", "c": 70, "e": [[2], [3]], "des": "penales", "mes": 8.3},
			{"n": "Segunda ronda", "c": 46, "e": [[1, 10, 20]], "des": "penales", "mes": 8.8},
			{"n": "Tercera ronda", "c": 32, "e": [[1, 1, 9]], "des": "penales", "mes": 9.6},
			{"n": "Cuarta ronda", "c": 16, "des": "penales", "mes": 10.9},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 12.6},
			{"n": "Semifinal", "c": 4, "p": 2, "des": "penales", "mes": 1.4, "mes2": 2.1},
			{"n": "Final", "c": 2, "mes": 3.5}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 8.05}},
	"Irán": {
		"copa": [
			{"n": "Tercera ronda", "c": 36, "e": [[2]], "loc": "menor", "mes": 11.2},
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "loc": "menor", "bom": true, "mes": 12.3},
			{"n": "Octavos", "c": 16, "neu": true, "mes": 1.5},
			{"n": "Cuartos", "c": 8, "neu": true, "mes": 4.1},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 4.8},
			{"n": "Final", "c": 2, "mes": 5.5}],
		"super": {"t": "final", "sede": "neutral", "des": "prorroga", "mes": 8.4, "doblete": "no"}},
	"Italia": {
		"copa": [
			{"n": "Previa", "c": 4, "e": [[3, 1, 4]], "loc": "cabeza", "mes": 8.1},
			{"n": "Primera ronda", "c": 32, "e": [[2], [1, 9, 20]], "loc": "cabeza", "bom": true, "mes": 8.4},
			{"n": "Segunda ronda", "c": 16, "loc": "cabeza", "mes": 9.8},
			{"n": "Octavos", "c": 16, "e": [[1, 1, 8]], "loc": "cabeza", "bom": true, "mes": 12.1},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "mes": 2.1},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 3.1, "mes2": 4.2},
			{"n": "Final", "c": 2, "mes": 5.4}],


		"super": {"t": "f4", "sede": "fuera", "des": "penales", "mes": 12.6}},




	"Japón": {
		"t": [8, 11],






		"copa": [
			{"n": "Primera ronda", "c": 54, "e": [[2], [3]], "mes": 8.6},
			{"n": "Segunda ronda", "c": 60, "e": [[1]], "mes": 8.85},
			{"n": "Tercera ronda", "c": 32, "mes": 9.75},
			{"n": "Octavos", "c": 16, "mes": 12.3},
			{"n": "Cuartos", "c": 8, "mes": 12.6},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 12.9},
			{"n": "Final", "c": 2, "mes": 1.03}],



		"liga": [
			{"n": "Primera ronda", "c": 56, "e": [[1, 5, 20], [2], [3]], "loc": "menor", "mes": 9.3},
			{"n": "Segunda ronda", "c": 32, "loc": "menor", "mes": 9.95},
			{"n": "Tercera ronda", "c": 16, "loc": "menor", "mes": 10.4},
			{"n": "Playoff", "c": 8, "p": 2, "loc": "cabeza", "mes": 10.65, "mes2": 10.85},
			{"n": "Cuartos", "c": 8, "e": [[1, 1, 4]], "p": 2, "mes": 11.35, "mes2": 11.5},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 3.8, "mes2": 3.9},
			{"n": "Final", "c": 2, "mes": 5.0}],


		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 8.0}},
	"Jordania": {
		"copa": [
			{"n": "Previa", "c": 8, "e": [[2, 19, 26]], "des": "penales", "mes": 9.3},
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2, 1, 18]], "des": "penales", "mes": 10.5},
			{"n": "Octavos", "c": 16, "des": "penales", "mes": 11.3},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 2.0},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 5.1},
			{"n": "Final", "c": 2, "mes": 5.6}],
		"liga": [
			{"n": "Fase de liga", "c": 10, "e": [[1]], "neu": true, "mes": 8.9,
				"g": {"n": 1, "v": 1, "pasan": 1, "fin": 12.9}}],
		"super": {"t": "doble", "sede": "cabeza", "des": "penales", "mes": 7.6, "mes2": 7.8}},








	"Marruecos": {
		"t": [9, 10],
		"copa": [
			{"n": "Previa", "c": 32, "e": [[2], [3, 1, 13]], "mes": 1.5},
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "mes": 3.5},
			{"n": "Octavos", "c": 16, "mes": 4.15},
			{"n": "Cuartos", "c": 8, "mes": 6.45},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 6.7},
			{"n": "Final", "c": 2, "mes": 6.95}]},


	"México": {"t": [7, 11]},







	"Noruega": {
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[2], [3]], "loc": "menor", "mes": 8.2},
			{"n": "Segunda ronda", "c": 32, "loc": "menor", "mes": 8.7},
			{"n": "Tercera ronda", "c": 32, "e": [[1]], "loc": "menor", "mes": 9.3},
			{"n": "Octavos", "c": 16, "mes": 3.2},
			{"n": "Cuartos", "c": 8, "mes": 3.7},
			{"n": "Semifinal", "c": 4, "mes": 4.4},
			{"n": "Final", "c": 2, "mes": 5.4}]},
	"Nueva Caledonia": {
		"t": [3, 9],
		"copa": [
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "loc": "menor", "des": "penales", "mes": 6.9},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 7.6},
			{"n": "Cuartos", "c": 8, "mes": 8.2},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 8.9},
			{"n": "Final", "c": 2, "mes": 9.4}]},
	"Nueva Zelanda": {
		"t": [3, 9],
		"copa": [
			{"n": "Segunda ronda", "c": 64, "e": [[1], [2], [3]], "mes": 5.9},
			{"n": "Tercera ronda", "c": 32, "mes": 6.4},
			{"n": "Cuarta ronda", "c": 16, "mes": 7.1},
			{"n": "Cuartos", "c": 8, "mes": 7.8},
			{"n": "Semifinal", "c": 4, "mes": 8.5},
			{"n": "Final", "c": 2, "mes": 9.2}]},
	"Paraguay": {
		"t": [2, 10],
		"copa": [
			{"n": "Primera ronda", "c": 46, "e": [[3]], "des": "penales", "mes": 6.3},
			{"n": "Segunda ronda", "c": 40, "e": [[2]], "des": "penales", "mes": 7.3},
			{"n": "Tercera ronda", "c": 32, "e": [[1]], "des": "penales", "mes": 8.3},
			{"n": "Octavos", "c": 16, "des": "penales", "mes": 9.6},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 10.4},
			{"n": "Semifinal", "c": 4, "des": "penales", "mes": 11.2},
			{"n": "Final", "c": 2, "des": "penales", "mes": 11.7}],




		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 12.1, "misma": true}},

	"Perú": {
		"t": [2, 10],
		"liga": [
			{"n": "Fase de grupos", "c": 34, "e": [[1], [2, 1, 16]], "loc": "cabeza", "des": "penales", "mes": 6.3,
				"g": {"n": 8, "v": 1, "pasan": 2, "fin": 6.9}},
			{"n": "Octavos", "c": 16, "loc": "cabeza", "bom": true, "des": "penales", "mes": 7.4},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "des": "penales", "mes": 8.8},
			{"n": "Semifinal", "c": 4, "p": 2, "loc": "cabeza", "des": "penales", "mes": 10.1, "mes2": 10.3},
			{"n": "Final", "c": 2, "des": "penales", "mes": 11.5}]},
	"Portugal": {
		"copa": [
			{"n": "Primera ronda", "c": 78, "e": [[3]], "mes": 8.8},
			{"n": "Segunda ronda", "c": 92, "e": [[2]], "loc": "menor", "mes": 9.4},
			{"n": "Tercera ronda", "c": 64, "e": [[1]], "loc": "menor", "mes": 10.6},
			{"n": "Cuarta ronda", "c": 32, "mes": 11.7},
			{"n": "Quinta ronda", "c": 16, "mes": 12.6},
			{"n": "Cuartos", "c": 8, "mes": 1.9},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 2.8, "mes2": 4.1},
			{"n": "Final", "c": 2, "mes": 5.7}],
		"liga": [
			{"n": "Cuartos", "c": 8, "e": [[1, 1, 6], [2, 1, 2]], "loc": "cabeza", "des": "penales", "mes": 10.9},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 1.1},
			{"n": "Final", "c": 2, "des": "penales", "mes": 1.25}],
		"super": {"t": "final", "sede": "neutral", "des": "prorroga", "mes": 7.9}},
	"Países Bajos": {
		"copa": [
			{"n": "Primera ronda", "c": 52, "e": [[1, 7, 18], [2], [3]], "loc": "menor", "mes": 10.9},
			{"n": "Segunda ronda", "c": 32, "e": [[1, 1, 6]], "mes": 12.3},
			{"n": "Octavos", "c": 16, "mes": 1.5},
			{"n": "Cuartos", "c": 8, "mes": 2.3},
			{"n": "Semifinal", "c": 4, "mes": 3.1},
			{"n": "Final", "c": 2, "mes": 4.6}],
		"super": {"t": "final", "sede": "liga", "des": "penales", "mes": 8.0}},







	"Rumanía": {
		"copa": [
			{"n": "Primera ronda", "c": 86, "e": [[3]], "loc": "menor", "mes": 8.0},
			{"n": "Segunda ronda", "c": 64, "loc": "menor", "mes": 8.2},
			{"n": "Tercera ronda", "c": 42, "e": [[2, 4, 19]], "loc": "menor", "mes": 8.4},
			{"n": "Playoff", "c": 32, "e": [[1, 9, 16], [2, 1, 3]], "loc": "menor", "mes": 8.9},
			{"n": "Fase de grupos", "c": 24, "e": [[1, 1, 8]], "mes": 10.95,
				"g": {"n": 4, "v": 1, "jor": 3, "pasan": 1, "fin": 2.35}},
			{"n": "Cuartos", "c": 8, "mes": 3.1},
			{"n": "Semifinal", "c": 4, "mes": 4.72},
			{"n": "Final", "c": 2, "mes": 5.42}],
		"super": {"t": "final", "sede": "liga", "des": "penales", "mes": 7.15}},




	"Bosnia y Herzegovina": {
		"copa": [
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2], [3, 1, 4]], "loc": "menor", "mes": 9.4},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 10.9},
			{"n": "Cuartos", "c": 8, "p": 2, "mes": 3.1, "mes2": 3.4},
			{"n": "Semifinal", "c": 4, "p": 2, "mes": 4.1, "mes2": 4.4},
			{"n": "Final", "c": 2, "mes": 5.3}]},
	"Serbia": {
		"copa": [
			{"n": "Previa", "c": 10, "e": [[2, 12, 19], [3, 1, 2]], "des": "penales", "mes": 9.2},
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2, 1, 11]], "des": "penales", "mes": 10.1},
			{"n": "Octavos", "c": 16, "des": "penales", "mes": 11.9},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 3.2},
			{"n": "Semifinal", "c": 4, "des": "penales", "mes": 4.3},
			{"n": "Final", "c": 2, "mes": 5.4}]},
	"Sudáfrica": {
		"copa": [
			{"n": "Previa", "c": 16, "e": [[2]], "mes": 1.4},
			{"n": "Dieciseisavos", "c": 32, "e": [[1]], "mes": 2.1},
			{"n": "Octavos", "c": 16, "mes": 2.6},
			{"n": "Cuartos", "c": 8, "mes": 3.2},
			{"n": "Semifinal", "c": 4, "mes": 4.1},
			{"n": "Final", "c": 2, "mes": 5.1}],
		"liga": [
			{"n": "Octavos", "c": 16, "e": [[1]], "bom": true, "mes": 10.1},
			{"n": "Cuartos", "c": 8, "mes": 10.8},
			{"n": "Semifinal", "c": 4, "mes": 11.3},
			{"n": "Final", "c": 2, "mes": 12.2}]},








	"Suecia": {
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[3]], "loc": "menor", "mes": 8.1},
			{"n": "Segunda ronda", "c": 64, "e": [[1], [2]], "loc": "menor", "mes": 8.75},
			{"n": "Fase de grupos", "c": 32, "mes": 2.65,
				"g": {"n": 8, "v": 1, "pasan": 1, "fin": 3.3}},
			{"n": "Cuartos", "c": 8, "mes": 3.47},
			{"n": "Semifinal", "c": 4, "mes": 3.72},
			{"n": "Final", "c": 2, "mes": 5.45}]},
	"Suiza": {
		"copa": [
			{"n": "Primera ronda", "c": 64, "e": [[1], [2], [3]], "loc": "menor", "mes": 8.4},
			{"n": "Segunda ronda", "c": 32, "loc": "menor", "mes": 9.5},
			{"n": "Octavos", "c": 16, "loc": "menor", "mes": 11.9},
			{"n": "Cuartos", "c": 8, "loc": "menor", "mes": 2.6},
			{"n": "Semifinal", "c": 4, "loc": "menor", "mes": 4.2},
			{"n": "Final", "c": 2, "mes": 5.5}]},
	"Tahití": {
		"t": [9, 10],
		"copa": [
			{"n": "Primera ronda", "c": 24, "e": [[1]], "neu": true, "des": "penales", "mes": 2.1},
			{"n": "Octavos", "c": 16, "neu": true, "des": "penales", "mes": 2.9},
			{"n": "Cuartos", "c": 8, "neu": true, "mes": 4.5},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 6.4},
			{"n": "Final", "c": 2, "mes": 6.6}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 9.4}},
	"Turquía": {
		"copa": [
			{"n": "Tercera ronda", "c": 56, "e": [[1, 6, 18], [2], [3]], "mes": 10.9},
			{"n": "Cuarta ronda", "c": 38, "mes": 12.1},
			{"n": "Fase de grupos", "c": 24, "e": [[1, 1, 5]], "mes": 12.6,
				"g": {"n": 3, "v": 1, "jor": 4, "pasan": 2, "mejores": 2, "fin": 3.1}},
			{"n": "Cuartos", "c": 8, "loc": "cabeza", "mes": 4.2},
			{"n": "Semifinal", "c": 4, "mes": 4.9},
			{"n": "Final", "c": 2, "mes": 5.4}],
		"super": {"t": "f4", "sede": "neutral", "des": "prorroga", "mes": 1.1}},
	"Túnez": {
		"copa": [
			{"n": "Dieciseisavos", "c": 32, "e": [[1], [2, 1, 16]], "loc": "menor", "mes": 3.4},
			{"n": "Octavos", "c": 16, "mes": 4.6},
			{"n": "Cuartos", "c": 8, "mes": 5.2},
			{"n": "Semifinal", "c": 4, "neu": true, "mes": 5.5},
			{"n": "Final", "c": 2, "mes": 5.9}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 8.1}},
	"Ucrania": {
		"copa": [
			{"n": "Treintaidosavos", "c": 56, "e": [[1, 5, 16], [2], [3]], "loc": "menor", "des": "penales", "mes": 8.4},
			{"n": "Dieciseisavos", "c": 32, "e": [[1, 1, 4]], "loc": "menor", "des": "penales", "mes": 9.6},
			{"n": "Octavos", "c": 16, "des": "penales", "mes": 10.9},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 3.3},
			{"n": "Semifinal", "c": 4, "des": "penales", "mes": 4.3},
			{"n": "Final", "c": 2, "mes": 5.4}]},
	"Uruguay": {
		"t": [2, 10],
		"copa": [
			{"n": "Fase de grupos", "c": 24, "e": [[1], [2, 1, 8]], "des": "penales", "mes": 8.2,
				"g": {"n": 6, "v": 1, "pasan": 2, "mejores": 4, "fin": 9.0}},
			{"n": "Segunda ronda", "c": 32, "e": [[2, 9, 19], [3, 1, 5]], "loc": "cabeza", "bom": true, "des": "penales", "mes": 9.7},
			{"n": "Octavos", "c": 16, "loc": "menor", "des": "penales", "mes": 10.5},
			{"n": "Cuartos", "c": 8, "loc": "menor", "des": "penales", "mes": 11.1},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 11.6},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.1}],
		"liga": [
			{"n": "Octavos", "c": 16, "e": [[1]], "neu": true, "bom": true, "des": "penales", "mes": 1.4},
			{"n": "Cuartos", "c": 8, "neu": true, "des": "penales", "mes": 1.6},
			{"n": "Semifinal", "c": 4, "neu": true, "des": "penales", "mes": 1.75},
			{"n": "Final", "c": 2, "des": "penales", "mes": 1.9}],




		"super": {"t": "final", "sede": "neutral", "des": "prorroga", "mes": 2.0, "rival": "liga_cup1"}},
	"Uzbekistán": {
		"t": [3, 9],
		"copa": [
			{"n": "Previa", "c": 16, "e": [[2, 9, 20]], "mes": 4.1},
			{"n": "Fase de grupos", "c": 32, "e": [[1], [2, 1, 8]], "mes": 4.4,
				"g": {"n": 8, "v": 1, "pasan": 2, "fin": 5.4}},
			{"n": "Octavos", "c": 16, "mes": 6.8},
			{"n": "Cuartos", "c": 8, "mes": 8.3},
			{"n": "Semifinal", "c": 4, "mes": 9.3},
			{"n": "Final", "c": 2, "mes": 10.3}],
		"super": {"t": "final", "sede": "neutral", "des": "penales", "mes": 3.4}},
	"Venezuela": {
		"t": [2, 10],
		"copa": [
			{"n": "Fase de grupos", "c": 20, "e": [[1, 9, 14], [2, 1, 14]], "loc": "cabeza", "des": "penales", "mes": 6.8,
				"g": {"n": 5, "v": 2, "pasan": 1, "mejores": 3, "fin": 10.0}},
			{"n": "Octavos", "c": 16, "e": [[1, 1, 8]], "bom": true, "des": "penales", "mes": 10.7},
			{"n": "Cuartos", "c": 8, "des": "penales", "mes": 11.2},
			{"n": "Semifinal", "c": 4, "des": "penales", "mes": 11.6},
			{"n": "Final", "c": 2, "des": "penales", "mes": 12.1}],
		"super": {"t": "final", "sede": "neutral", "des": "prorroga", "mes": 3.2}},
}






static func tiene(pais: String, tipo: String = COPA) -> bool:
	if pais.is_empty():
		return false
	if not DATOS.has(pais):
		return tipo == COPA
	return not (DATOS[pais] as Dictionary).get(tipo, []).is_empty()



static func rondas_reales(pais: String, tipo: String = COPA) -> Array:
	if not DATOS.has(pais):
		return []
	return (DATOS[pais] as Dictionary).get(tipo, [])



static func paises_con(tipo: String) -> Array:
	var out: Array = []
	for p in DATOS:
		if tiene(String(p), tipo):
			out.append(String(p))
	return out










static func supercopa(pais: String) -> Dictionary:
	if not DATOS.has(pais):
		return {}
	return (DATOS[pais] as Dictionary).get("super", {})


static func temporada(pais: String) -> Array:
	if DATOS.has(pais) and (DATOS[pais] as Dictionary).has("t"):
		return (DATOS[pais] as Dictionary)["t"]
	return TEMPORADA_EUROPA







static func _off(pais: String, mes: float) -> float:
	var t: Array = temporada(pais)
	var ini: int = int(t[0])
	var dur: float = float(t[1])
	var off: float = float(posmod(int(floor(mes)) - ini, 12)) +(mes - floor(mes))
	if off >= dur +(12.0 - dur) / 2.0:
		off -= 12.0
	return off






const OFF_SEMANA: float = 0.45








static func _semana_off(pais: String, off: float, league_len: int) -> float:
	var dur: float = float(temporada(pais)[1])
	var frac: float = clampf(off / dur, 0.0, 0.98)
	var w: float = floor(frac * float(league_len)) + OFF_SEMANA
	if frac >= 0.98:
		return w
	return CalendarioMundo.semana_en_su_mes(w, off, league_len, pais)


static func semana(pais: String, mes: float, league_len: int) -> float:
	return _semana_off(pais, _off(pais, mes), league_len)






static func agenda(pais: String, rondas: Array, league_len: int) -> Array:
	var out: Array = []
	var prev: float = -1.0
	for r in rondas.size():
		var ro: Dictionary = rondas[r]
		var offs: Array = []
		var o0: float = _off(pais, float(ro.get("mes", 8.5)))
		if ro.has("g"):
			var j: int = int(ro.get("jornadas", 1))
			var fin: float = _off(pais, float((ro["g"] as Dictionary).get("fin", float(ro.get("mes", 8.5)))))
			if fin < o0:
				fin = o0
			for k in j:
				offs.append(o0 +(fin - o0) *(float(k) / float(maxi(j - 1, 1))))
		elif int(ro.get("p", 1)) == 2:
			offs.append(o0)
			offs.append(_off(pais, float(ro.get("mes2", float(ro.get("mes", 8.5)) + 0.3))))
		else:
			offs.append(o0)
		for k in offs.size():
			var w: float = _semana_off(pais, float(offs[k]), league_len)
			if w < prev + 1.0:
				w = floor(prev + 1.0) + OFF_SEMANA
			prev = w
			out.append({"r": r, "leg": k if not ro.has("g") else 0,
				"jor": k if ro.has("g") else -1, "week": w})
	return out


















static func plan(pais: String, tipo: String, por_div: Array, forzar: String = "") -> Dictionary:
	var crudas: Array = rondas_reales(pais, tipo)
	if crudas.is_empty():
		if tipo == COPA and not DATOS.has(pais):
			return _generico(por_div)
		return {}
	var usados: Dictionary = {}
	var entran: Array = []
	for r in crudas:
		var ids: Array = []
		for spec in (r as Dictionary).get("e", []):
			var d: int = int(spec[0])
			if d < 1 or d > por_div.size():
				continue
			var lista: Array = por_div[d - 1]
			var desde: int = int(spec[1]) if spec.size() > 1 else 1
			var hasta: int = int(spec[2]) if spec.size() > 2 else lista.size()
			for k in range(maxi(desde - 1, 0), mini(hasta, lista.size())):
				var id: String = String(lista[k])
				if not usados.has(id):
					usados[id] = true
					ids.append(id)
		entran.append(ids)
	if not forzar.is_empty() and not usados.has(forzar):
		_fuerza(entran, por_div, forzar)
	var out: Array = []
	var vivos: int = 0
	var arrastre: Array = []
	for i in crudas.size():
		var ro: Dictionary =(crudas[i] as Dictionary).duplicate(true)
		var nuevos: Array = arrastre + entran[i]
		vivos +=(entran[i] as Array).size()

		var w: int = 1
		if i + 1 < crudas.size():
			w = maxi(int((crudas[i + 1] as Dictionary).get("c", 2)) -(entran[i + 1] as Array).size(), 0)
		ro["i"] = i
		ro["nuevos"] = nuevos
		ro["A"] = vivos
		ro["w"] = w
		if ro.has("g"):
			var g: Dictionary = ro["g"]
			var ng: int = _n_grupos(vivos, g)
			var sale: int = ng * int(g.get("pasan", 2)) + mini(int(g.get("mejores", 0)), ng)
			if ng < 1 or vivos <= sale:
				return _generico(por_div)
			ro["grupos"] = ng
			ro["jornadas"] = _n_jornadas(vivos, ng, g)
			ro["out"] = sale
			out.append(ro)
			vivos = sale
			arrastre = []
			continue
		var m: int = clampi(vivos - w, 0, vivos / 2)
		if bool(ro.get("solo", false)):
			m = mini(m, nuevos.size() / 2)
		if m <= 0:
			arrastre = nuevos
			continue
		ro["m"] = m
		ro["byes"] = vivos - 2 * m
		out.append(ro)
		vivos -= m
		arrastre = []
	if vivos != 1 or out.is_empty():
		return _generico(por_div)
	return {"rondas": out, "ok": true, "generico": false}






static func _fuerza(entran: Array, por_div: Array, forzar: String) -> void:
	var div_de: Dictionary = {}
	var orden: Dictionary = {}
	for d in por_div.size():
		for k in (por_div[d] as Array).size():
			div_de[String(por_div[d][k])] = d + 1
			orden[String(por_div[d][k])] = k
	if not div_de.has(forzar):
		return
	var mia: int = int(div_de[forzar])
	var mejor: Array = []
	for r in entran.size():
		var ids: Array = entran[r]
		for k in ids.size():
			var id: String = String(ids[k])
			var dist: int = absi(int(div_de.get(id, 99)) - mia)
			var sie: int = int(orden.get(id, 0))
			if mejor.is_empty() or dist < int(mejor[2]) \
					or (dist == int(mejor[2]) and sie > int(mejor[3])):
				mejor = [r, k, dist, sie]
	if mejor.is_empty():
		if not entran.is_empty():
			(entran[0] as Array).append(forzar)
		return
	entran[int(mejor[0])][int(mejor[1])] = forzar




static func _n_grupos(vivos: int, g: Dictionary) -> int:
	var n: int = int(g.get("n", 1))
	var pasan: int = int(g.get("pasan", 2))
	while n > 1 and vivos / n <= pasan:
		n -= 1
	return n


static func _n_jornadas(vivos: int, ng: int, g: Dictionary) -> int:
	var mayor: int = int(ceil(float(vivos) / float(ng)))
	var j: int = mayor - 1 if mayor % 2 == 0 else mayor
	if int(g.get("jor", 0)) > 0:
		j = mini(j, int(g["jor"]))
	return j * maxi(int(g.get("v", 1)), 1)





static func _generico(por_div: Array) -> Dictionary:
	var ids: Array = []
	for lista in por_div:
		for id in lista:
			ids.append(String(id))
	ids = ids.slice(0, 32)
	if ids.size() < 2:
		return {}
	var pot: int = 1
	while pot * 2 <= ids.size():
		pot *= 2
	var out: Array = []
	var vivos: int = ids.size()
	while vivos > 1:

		var m: int = vivos - pot if vivos > pot else vivos / 2
		out.append({"n": _nombre_por_tamano(vivos) if vivos <= pot else "Primera ronda",
			"c": vivos, "nuevos": ids if out.is_empty() else [], "A": vivos, "m": m,
			"byes": vivos - 2 * m, "w": vivos - m, "i": out.size()})
		vivos -= m

	for k in out.size():
		(out[k] as Dictionary)["mes"] = 8.0 + 9.5 * float(k + 1) / float(out.size() + 1)
	return {"rondas": out, "ok": true, "generico": true}


static func _nombre_por_tamano(n: int) -> String:
	match n:
		2:
			return "Final"
		4:
			return "Semifinal"
		8:
			return "Cuartos"
		16:
			return "Octavos"
		32:
			return "Dieciseisavos"
		64:
			return "Treintaidosavos"
	return "Primera ronda"



static func es_neutral(ro: Dictionary, es_final: bool) -> bool:
	if ro.has("neu"):
		return bool(ro["neu"])
	return es_final and int(ro.get("p", 1)) == 1


static func desempate(ro: Dictionary) -> String:
	return String(ro.get("des", "prorroga"))









static func nuevo(pais: String, tipo: String, por_div: Array, forzar: String = "") -> Dictionary:
	var pl: Dictionary = plan(pais, tipo, por_div, forzar)
	if pl.is_empty():
		return {}
	var orden: Dictionary = {}
	var div: Dictionary = {}
	var k: int = 0
	for d in por_div.size():
		for id in por_div[d]:
			orden[String(id)] = k
			div[String(id)] = d + 1
			k += 1
	return {"pais": pais, "tipo": tipo, "rondas": pl["rondas"], "r": 0, "vivos": [],
		"orden": orden, "div": div, "bracket": [], "exentos": [], "grupos": {},
		"winner": "", "generico": bool(pl.get("generico", false))}


static func ronda(st: Dictionary, r: int = -1) -> Dictionary:
	var rs: Array = st.get("rondas", [])
	var i: int = int(st.get("r", 0)) if r < 0 else r
	return rs[i] if i >= 0 and i < rs.size() else {}


static func es_grupo(st: Dictionary, r: int = -1) -> bool:
	return ronda(st, r).has("g")


static func terminado(st: Dictionary) -> bool:
	return int(st.get("r", 0)) >=(st.get("rondas", []) as Array).size()





static func finalista(st: Dictionary) -> String:
	var br: Array = st.get("bracket", [])
	var w: String = String(st.get("winner", ""))
	if br.is_empty() or w.is_empty() or (br[br.size() - 1] as Array).size() != 1:
		return ""
	var t: Dictionary = br[br.size() - 1][0]
	if String(t.get("a", "")) == w:
		return String(t.get("b", ""))
	return String(t.get("a", "")) if String(t.get("b", "")) == w else ""





static func sortea(st: Dictionary, rng: RandomNumberGenerator) -> void:
	if terminado(st):
		return
	var r: int = int(st["r"])
	if (st["bracket"] as Array).size() > r:
		return
	var ro: Dictionary = ronda(st, r)
	var vivos: Array = st["vivos"]
	for id in ro.get("nuevos", []):
		if not vivos.has(String(id)):
			vivos.append(String(id))
	var orden: Dictionary = st["orden"]
	vivos.sort_custom(func(a, b): return int(orden.get(a, 9999)) < int(orden.get(b, 9999)))
	if ro.has("g"):
		_sortea_grupos(st, r, ro, rng)
		(st["bracket"] as Array).append([])
		(st["exentos"] as Array).append([])
		return
	var es_final: bool = r ==(st["rondas"] as Array).size() - 1
	var w: int = 1 if es_final else int(ro.get("w", vivos.size() / 2))
	var m: int = clampi(vivos.size() - w, 0, vivos.size() / 2)
	if es_final:
		m = 1 if vivos.size() >= 2 else 0
	var nuevos: Dictionary = {}
	for id in ro.get("nuevos", []):
		nuevos[String(id)] = true
	var juegan: Array = []
	var exentos: Array = []
	if bool(ro.get("solo", false)):
		var nv: Array = []
		for id in vivos:
			if nuevos.has(id):
				nv.append(id)
			else:
				exentos.append(id)
		m = mini(m, nv.size() / 2)

		var sobran: int = nv.size() - 2 * m
		exentos.append_array(nv.slice(0, sobran))
		juegan = nv.slice(sobran)
	else:











		var nb: int = vivos.size() - 2 * m
		var tuyo: String = String(st.get("tuyo", ""))
		for i in range(vivos.size() - 1, -1, -1):
			if exentos.size() >= nb:
				break
			if String(vivos[i]) != tuyo:
				exentos.append(vivos[i])
		if exentos.size() < nb and vivos.has(tuyo):
			exentos.append(tuyo)
		for id in vivos:
			if not exentos.has(id):
				juegan.append(id)
	var pares: Array = []
	if bool(ro.get("bom", false)):
		var b1: Array = juegan.slice(0, m)
		var b2: Array = juegan.slice(m)
		baraja(b1, rng)
		baraja(b2, rng)
		for i in m:
			pares.append([b1[i], b2[i]] if rng.randf() < 0.5 else [b2[i], b1[i]])
	else:
		var bolsa: Array = juegan.duplicate()
		baraja(bolsa, rng)
		for i in range(0, bolsa.size() - 1, 2):
			pares.append([bolsa[i], bolsa[i + 1]])
	var cruces: Array = []
	var loc: String = String(ro.get("loc", "sorteo"))
	var div: Dictionary = st["div"]
	for p in pares:
		var a: String = String(p[0])
		var b: String = String(p[1])
		var swap: bool = false
		match loc:
			"menor":
				swap = int(div.get(b, 9)) > int(div.get(a, 9))
			"peor":
				swap = int(orden.get(b, 9999)) > int(orden.get(a, 9999))
			"cabeza":
				swap = int(orden.get(b, 9999)) < int(orden.get(a, 9999))
		if swap:
			var t: String = a
			a = b
			b = t
		cruces.append({"a": a, "b": b, "winner": "", "score": ""})
	(st["bracket"] as Array).append(cruces)
	(st["exentos"] as Array).append(exentos)




static func cierra(st: Dictionary, decide: Callable) -> void:
	if terminado(st) or es_grupo(st):
		return
	var r: int = int(st["r"])
	var ro: Dictionary = ronda(st, r)
	var cruces: Array =(st["bracket"] as Array)[r]
	var pasan: Array = []
	for t in cruces:
		if String(t.get("winner", "")).is_empty():
			var res: Dictionary = decide.call(String(t["a"]), String(t["b"]), ro)
			for k in res:
				t[k] = res[k]
		pasan.append(String(t["winner"]))
	pasan.append_array((st["exentos"] as Array)[r])
	st["vivos"] = pasan
	_avanza(st)


static func _avanza(st: Dictionary) -> void:
	st["r"] = int(st["r"]) + 1
	if terminado(st):
		var v: Array = st["vivos"]
		st["winner"] = String(v[0]) if v.size() == 1 else ""




static func simula_hasta_el_final(st: Dictionary, rng: RandomNumberGenerator, decide: Callable,
		partido: Callable) -> void:
	var tope: int = 64
	while not terminado(st) and tope > 0:
		tope -= 1
		sortea(st, rng)
		if es_grupo(st):
			var gr: Dictionary = grupos_de(st)
			for k in (gr.get("jornadas", []) as Array).size():
				juega_jornada(st, k, partido)
			cierra_grupos(st)
		else:
			cierra(st, decide)




static func grupos_de(st: Dictionary, r: int = -1) -> Dictionary:
	var i: int = int(st.get("r", 0)) if r < 0 else r
	return (st.get("grupos", {}) as Dictionary).get(str(i), {})




static func _sortea_grupos(st: Dictionary, r: int, ro: Dictionary, rng: RandomNumberGenerator) -> void:
	var g: Dictionary = ro["g"]
	var ids: Array = st["vivos"]
	var n: int = int(ro.get("grupos", _n_grupos(ids.size(), g)))
	var grupos: Array = []
	for i in n:
		grupos.append([])
	for k in range(0, ids.size(), n):
		var bombo: Array = ids.slice(k, k + n)
		baraja(bombo, rng)
		for i in bombo.size():
			(grupos[i] as Array).append(bombo[i])
	var jornadas: Array = []
	for gi in n:
		var rs: Array = todos_contra_todos(grupos[gi], int(g.get("v", 1)), int(g.get("jor", 0)))
		for k in rs.size():
			while jornadas.size() <= k:
				jornadas.append([])
			for par in rs[k]:
				(jornadas[k] as Array).append(par)
	var res: Array = []
	for jd in jornadas:
		var fila: Array = []
		for _p in jd:
			fila.append([])
		res.append(fila)
	(st["grupos"] as Dictionary)[str(r)] = {"grupos": grupos, "jornadas": jornadas, "res": res}






static func todos_contra_todos(eq: Array, vueltas: int = 1, jor: int = 0) -> Array:
	var t: Array = eq.duplicate()
	if t.size() % 2 == 1:
		t.append("")
	var n: int = t.size()
	var rondas: Array = []
	for k in n - 1:
		var ro: Array = []
		for i in n / 2:
			var a: String = String(t[i])
			var b: String = String(t[n - 1 - i])
			if a.is_empty() or b.is_empty():
				continue

			if (k + i) % 2 == 1:
				ro.append([b, a])
			else:
				ro.append([a, b])
		rondas.append(ro)
		t.insert(1, t.pop_back())
	if jor > 0:
		rondas = rondas.slice(0, jor)
	if vueltas >= 2:
		var vuelta: Array = []
		for ro in rondas:
			var inv: Array = []
			for p in ro:
				inv.append([p[1], p[0]])
			vuelta.append(inv)
		rondas.append_array(vuelta)
	return rondas



static func pon_resultado(st: Dictionary, k: int, a: String, b: String, ga: int, gb: int) -> void:
	var gr: Dictionary = grupos_de(st)
	var jd: Array =(gr.get("jornadas", []) as Array)[k] if k <(gr.get("jornadas", []) as Array).size() else []
	for j in jd.size():
		var p: Array = jd[j]
		if String(p[0]) == a and String(p[1]) == b:
			(gr["res"] as Array)[k][j] = [ga, gb]
			return



static func juega_jornada(st: Dictionary, k: int, partido: Callable) -> void:
	var gr: Dictionary = grupos_de(st)
	if gr.is_empty() or k >=(gr["jornadas"] as Array).size():
		return
	var jd: Array = gr["jornadas"][k]
	for j in jd.size():
		if ((gr["res"] as Array)[k][j] as Array).is_empty():
			var s: Array = partido.call(String(jd[j][0]), String(jd[j][1]))
			(gr["res"] as Array)[k][j] = [int(s[0]), int(s[1])]




static func tablas(st: Dictionary, r: int = -1) -> Array:
	var gr: Dictionary = grupos_de(st, r)
	if gr.is_empty():
		return []
	var filas: Dictionary = {}
	for grupo in gr["grupos"]:
		for id in grupo:
			filas[String(id)] = {"id": String(id), "pj": 0, "pts": 0, "gf": 0, "gc": 0}
	var jornadas: Array = gr["jornadas"]
	for k in jornadas.size():
		for j in (jornadas[k] as Array).size():
			var s: Array =(gr["res"] as Array)[k][j]
			if s.size() < 2:
				continue
			var a: String = String(jornadas[k][j][0])
			var b: String = String(jornadas[k][j][1])
			for par in [[a, int(s[0]), int(s[1])], [b, int(s[1]), int(s[0])]]:
				var f: Dictionary = filas[par[0]]
				f["pj"] = int(f["pj"]) + 1
				f["gf"] = int(f["gf"]) + int(par[1])
				f["gc"] = int(f["gc"]) + int(par[2])
				f["pts"] = int(f["pts"]) +(3 if int(par[1]) > int(par[2]) else (1 if par[1] == par[2] else 0))
	var orden: Dictionary = st.get("orden", {})
	var out: Array = []
	for grupo in gr["grupos"]:
		var t: Array = []
		for id in grupo:
			t.append(filas[String(id)])
		t.sort_custom(func(x, y): return _mejor_fila(x, y, orden))
		out.append(t)
	return out


static func _mejor_fila(x: Dictionary, y: Dictionary, orden: Dictionary) -> bool:
	if int(x["pts"]) != int(y["pts"]):
		return int(x["pts"]) > int(y["pts"])
	var dx: int = int(x["gf"]) - int(x["gc"])
	var dy: int = int(y["gf"]) - int(y["gc"])
	if dx != dy:
		return dx > dy
	if int(x["gf"]) != int(y["gf"]):
		return int(x["gf"]) > int(y["gf"])
	return int(orden.get(x["id"], 9999)) < int(orden.get(y["id"], 9999))





static func cierra_grupos(st: Dictionary) -> void:
	if terminado(st) or not es_grupo(st):
		return
	var r: int = int(st["r"])
	var g: Dictionary = ronda(st, r)["g"]
	var pasan: int = int(g.get("pasan", 2))
	var mejores: int = int(g.get("mejores", 0))
	var ts: Array = tablas(st, r)
	var orden: Dictionary = st["orden"]
	var clasif: Array = []
	for puesto in pasan +(1 if mejores > 0 else 0):
		var fila: Array = []
		for t in ts:
			if puesto <(t as Array).size():
				fila.append(t[puesto])
		fila.sort_custom(func(x, y): return _mejor_fila(x, y, orden))
		if puesto >= pasan:
			fila = fila.slice(0, mejores)
		for f in fila:
			clasif.append(String(f["id"]))
	for i in clasif.size():
		orden[clasif[i]] = SIEMBRA_GRUPOS *(r + 1) + i
	st["vivos"] = clasif
	_avanza(st)



static func grupo_de(st: Dictionary, id: String, r: int = -1) -> int:
	var gr: Dictionary = grupos_de(st, r)
	var gs: Array = gr.get("grupos", [])
	for i in gs.size():
		if (gs[i] as Array).has(id):
			return i
	return -1




static func partido_de(st: Dictionary, id: String, k: int, r: int = -1) -> Dictionary:
	var gr: Dictionary = grupos_de(st, r)
	var js: Array = gr.get("jornadas", [])
	if k < 0 or k >= js.size():
		return {}
	for p in js[k]:
		if String(p[0]) == id:
			return {"opp": String(p[1]), "home": true}
		if String(p[1]) == id:
			return {"opp": String(p[0]), "home": false}
	return {}



static func participantes(st: Dictionary, r: int) -> Array:
	var out: Array = []
	if ronda(st, r).has("g"):
		for grupo in grupos_de(st, r).get("grupos", []):
			out.append_array(grupo)
		return out
	var br: Array = st.get("bracket", [])
	if r < br.size():
		for t in br[r]:
			out.append(String(t["a"]))
			out.append(String(t["b"]))
	return out







static func quien_juega(st: Dictionary) -> Dictionary:
	var field0: Array = []
	var vivo: Dictionary = {}
	var rs: Array = st.get("rondas", [])
	var r_act: int = int(st.get("r", 0))
	for r in rs.size():
		for id in (rs[r] as Dictionary).get("nuevos", []):
			field0.append(String(id))
			if r >= r_act:
				vivo[String(id)] = true
	if terminado(st):
		vivo = {String(st.get("winner", "")): true}
	else:
		for id in st.get("vivos", []):
			vivo[String(id)] = true
	var rondas: Array = []
	for r in (st.get("bracket", []) as Array).size():
		rondas.append(participantes(st, r))
	var fuera: Array = []
	for id in field0:
		if not vivo.has(id):
			fuera.append(id)
	return {"field0": field0, "rondas": rondas, "fuera": fuera,
		"winner": String(st.get("winner", ""))}



static func baraja(arr: Array, rng: RandomNumberGenerator) -> void:
	for i in range(arr.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Variant = arr[i]
		arr[i] = arr[j]
		arr[j] = tmp
