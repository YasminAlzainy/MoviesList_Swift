self.webpackChunk(["mode/handlebars"],{38:function(a,b,c){(function(a){a(c(0),c(35),c(36))})(function(a){"use strict";a.defineSimpleMode("handlebars-tags",{start:[{regex:/\{\{!--/,push:"dash_comment",token:"comment"},{regex:/\{\{!/,push:"comment",token:"comment"},{regex:/\{\{/,push:"handlebars",token:"tag"}],handlebars:[{regex:/\}\}/,pop:!0,token:"tag"},{regex:/"(?:[^\\"]|\\.)*"?/,token:"string"},{regex:/'(?:[^\\']|\\.)*'?/,token:"string"},{regex:/>|[#\/]([A-Za-z_]\w*)/,token:"keyword"},{regex:/(?:else|this)\b/,token:"keyword"},{regex:/\d+/i,token:"number"},{regex:/=|~|@|true|false/,token:"atom"},{regex:/(?:\.\.\/)*(?:[A-Za-z_][\w\.]*)+/,token:"variable-2"}],dash_comment:[{regex:/--\}\}/,pop:!0,token:"comment"},{regex:/./,token:"comment"}],comment:[{regex:/\}\}/,pop:!0,token:"comment"},{regex:/./,token:"comment"}]}),a.defineMode("handlebars",function(b,c){var d=a.getMode(b,"handlebars-tags");return c&&c.base?a.multiplexingMode(a.getMode(b,c.base),{open:"{{",close:"}}",mode:d,parseDelimiters:!0}):d}),a.defineMIME("text/x-handlebars-template","handlebars")})}});
//# sourceMappingURL=handlebars.js.map