SILE.registerCommand("xmltricks:ignore", function (_, content)
  for token in SU.gtoke(content[1]) do
    if token.string then SILE.call("define", { command = token.string}, function() end) end
  end
end)

SILE.registerCommand("xmltricks:passthru", function (_, content)
  for token in SU.gtoke(content[1]) do
    if token.string then SILE.registerCommand(token.string, function(_, c) SILE.process(c) end) end
  end
end)

-- FIXME package documention should be self-consistent and not need to refer to a chapter 9 in
-- the SILE manual...
return {
  documentation = [[\begin{document}
In chapter 9, we’re going to use SILE to typeset existing XML documents.
Most of the work of typesetting XML with SILE is creating processing
expectations for particular XML tags. \autodoc:package{xmltricks} makes the process
somewhat easier by providing commands to handle two common cases.

The \autodoc:command{xmltricks:ignore} takes as argument a list of space-separated tag names
and instructs SILE not to bother investigating the given tags.
For instance, when processing a HTML document, you probably don’t need to typeset the
\autodoc:code{head} tag or anything inside it.

Similarly, some tags are just wrappers; you want to process their content,
but there’s nothing specific about the tag itself that needs any styling.
List those tags in a \autodoc:command{xmltricks:passthru} command, and SILE
will descend into the content without requiring a specific command for the
tag itself.
\end{document}]]
}
