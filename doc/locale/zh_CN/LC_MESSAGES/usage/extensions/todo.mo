��          �               �   0   �      .  Y   <  �   �  e     m     P   �  >   >  &   }  �   �  �   *  6   �  3   �  �  0  0   �     �  Y   �  �   Q  e   �  m   :  P   �  >   �  &   8	  �   _	  �   �	  6   �
  3   �
   :mod:`sphinx.ext.todo` -- Support for todo items Configuration Emitted when a todo is defined. *node* is the defined ``sphinx.ext.todo.todo_node`` node. If this is ``True``, :rst:dir:`todo` and :rst:dir:`todolist` produce output, else they produce nothing.  The default is ``False``. If this is ``True``, :rst:dir:`todo` emits a warning for each TODO entries. The default is ``False``. If this is ``True``, :rst:dir:`todolist` produce output without file path and line, The default is ``False``. It will only show up in the output if :confval:`todo_include_todos` is ``True``. There are two additional directives when using this extension: These can be configured as seen below. This directive is replaced by a list of all todo directives in the whole documentation, if :confval:`todo_include_todos` is ``True``. This directive supports an ``class`` option that determines the class attribute for HTML output.  If not given, the class defaults to ``admonition-todo``. Use this directive like, for example, :rst:dir:`note`. autodoc provides the following an additional event: Project-Id-Version: Sphinx 2.1.0+/1499a97c2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-03-29 17:17+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 :mod:`sphinx.ext.todo` -- Support for todo items Configuration Emitted when a todo is defined. *node* is the defined ``sphinx.ext.todo.todo_node`` node. If this is ``True``, :rst:dir:`todo` and :rst:dir:`todolist` produce output, else they produce nothing.  The default is ``False``. If this is ``True``, :rst:dir:`todo` emits a warning for each TODO entries. The default is ``False``. If this is ``True``, :rst:dir:`todolist` produce output without file path and line, The default is ``False``. It will only show up in the output if :confval:`todo_include_todos` is ``True``. There are two additional directives when using this extension: These can be configured as seen below. This directive is replaced by a list of all todo directives in the whole documentation, if :confval:`todo_include_todos` is ``True``. This directive supports an ``class`` option that determines the class attribute for HTML output.  If not given, the class defaults to ``admonition-todo``. Use this directive like, for example, :rst:dir:`note`. autodoc provides the following an additional event: 