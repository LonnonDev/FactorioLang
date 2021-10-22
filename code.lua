require("main")

-- Args: Statement, Output, Wires
local basic = decider("E > B", "C", {})
local basic2 = decider("E > B", "C", {})
local basic3 = decider("E > 2", "C", {})
local basic4 = decider("1 > B", "C", {})

generate()