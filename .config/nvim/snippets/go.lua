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
}
