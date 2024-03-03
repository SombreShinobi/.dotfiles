return {
	s(
		"fn",
		fmt("func {}({}) ({}) {{\n\t{}\n}}", {
			i(1),
			i(2),
			i(3),
			i(0),
		})
	),
	s(
		"forr",
		fmt("for {} := range {} {{\n\t{}\n}}", {
			i(1),
			i(2),
			i(0),
		})
	),
	s(
		"for",
		fmt("for {} := {}; {} < {}; {}++ {{\n\t{}\n}}", {
			i(1),
			i(2),
			rep(1),
			i(3),
			rep(1),
			i(0),
		})
	),
	s(
		"eif",
		fmt("{}, {} := {}({})\nif {} != nil {{\n\treturn {}, {}\n}}", {
			i(1),
			i(2, "err"),
			i(3),
			i(4),
			rep(2),
			i(5),
			rep(2),
		})
	),
}
