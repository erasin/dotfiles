; highlights.scm for Helix

; Comments
(comment) @comment

; Text
; (text) @text

; Output tags
(tpl_output) @variable

; Control keywords
[
  (tpl_if)
  (tpl_elseif)
  (tpl_else)
  (tpl_endif)
  (tpl_compare)
  (tpl_volist)
  (tpl_foreach)
  (tpl_switch)
  (tpl_case)
  (tpl_endswitch)
  (tpl_default)
  (tpl_include)
] @keyword

; Variables
(variable) @variable

; Function names
(function_call) @function

; Strings inside arguments
; (string) @string

; Numeric literals
; (number) @number
