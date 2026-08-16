local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- codeforces | basic template for competitive programming 
return {
  s("codeforces", {
    t("// "), i(1),
    t({
      "",
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "using ll = long long;",
      "",
      "",
      "int main() {",
      "\tios::sync_with_stdio(false);",
      "\tcin.tie(nullptr);",
      "",
      "\t"
    }),
    i(2),
    t({
      "",
      "",
      "\treturn 0;",
      "}",
      ""
    })
  })
}

