return {
    s(
        "fn",
        fmt("{} {}({}) {{\n\t{}\n}}", {
            i(1, "void"),
            i(2),
            i(3, "void"),
            i(0),
        })
    ),
    s(
        "en",
        fmt("enum {} {{\n\t{}\n}};", {
            i(1),
            i(0),
        })
    ),
}
