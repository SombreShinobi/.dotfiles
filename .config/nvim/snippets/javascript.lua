return {
    s(
        "fn",
        fmt("function {}({}) {{\n\t{}\n}}", {
            i(1),
            i(2),
            i(0),
        })
    ),
    s(
        "docfn",
        fmt(
            "/**\n* {}\n* @param {{{}}} {} - {}\n* @param {{{}}} {} - {}\n* @returns {{{}}} - {}\n* */\nfunction {}({}) {{\n\t{}\n}}",
            { i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8, "void"), i(9), i(10), i(11), i(0) }
        )
    ),
    s(
        "for",
        fmt(
            "for (let {} = {}; {} {} {}; {}++) {{\n\t{}\n}}",
            { i(1, "i"), i(2, "0"), rep(1), i(3, "<"), i(4), rep(1), i(5) }
        )
    ),
}
