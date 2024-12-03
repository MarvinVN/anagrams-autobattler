class_name Enums

static var UPPER_ALPHABET = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
static var ALPHABET = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

enum Letters {
	A,
	B,
	C,
	D,
	E,
	F,
	G,
	H,
	I,
	J,
	K,
	L,
	M,
	N,
	O,
	P,
	Q,
	R,
	S,
	T,
	U,
	V,
	W,
	X,
	Y,
	Z,
	WILD,
	EMPTY,
	SMILE
}

static func get_letter_string(letter_set: Array) -> String:
	var word = ""
	for letter in letter_set:
		word += Letters.find_key(letter)
	return word.to_lower()

static func get_letter(letter: String):
	match letter:
		'a': return Letters.A
		'b': return Letters.B
		'c': return Letters.C
		'd': return Letters.D
		'e': return Letters.E
		'f': return Letters.F
		'g': return Letters.G
		'h': return Letters.H
		'i': return Letters.I
		'j': return Letters.J
		'k': return Letters.K
		'l': return Letters.L
		'm': return Letters.M
		'n': return Letters.N
		'o': return Letters.O
		'p': return Letters.P
		'q': return Letters.Q
		'r': return Letters.R
		's': return Letters.S
		't': return Letters.T
		'u': return Letters.U
		'v': return Letters.V
		'w': return Letters.W
		'x': return Letters.X
		'y': return Letters.Y
		'z': return Letters.Z
		'empty': return Letters.EMPTY
		'wild': return Letters.WILD
		'smile': return Letters.SMILE
		

enum TileStates {
	AVAILABLE,
	USED,
	LOCKED,
	FROZEN,
	WILD,
	WILD_USED
}

enum Modifiers {
	ADD_LETTER,
	FREEZE,
	LOCK,
	WILD_CARD
}
