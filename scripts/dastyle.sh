ASTYLE_OPTS="\
--style=linux \
--indent=force-tab=8 \
--indent-preproc-define \
--indent-col1-comments \
--max-instatement-indent=80 \
--pad-oper \
--pad-header \
--unpad-paren \
--align-pointer=name \
--align-reference=name \
--remove-brackets \
--max-code-length=80 \
--break-after-logical \
--suffix=none \
--formatted \
--lineend=linux \
"

astyle $ASTYLE_OPTS $@
