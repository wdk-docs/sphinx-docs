��    g      T              �  e   �  �   �  ?   �  �   �    o  Q   �	  �   �	  v   �
  7   P  �   �  -   T     �  �   �  4        N  4   f  6   �     �  �   �     �     �  �   �  �   d  k   )  �  �     $  -   C  $   q     �  -   �  �   �  U   c  !   �     �  �   �  8  �  �   �  X  x  
   �  v   �  �   S  k   6     �  �   �  �   J  4  �  �   
  �   �  �   h  ;   h  
  �  P   �  q       8   r   �   �   P   u!  �   �!     �"  ;   �"  >   �"  @   /#  q   p#  �   �#  )   �$  B   �$  �   �$  "   �%  )   �%  ,   �%  !   �%  B   &      _&      �&      �&  �   �&  $   �'  �   �'  P   Y(  Y  �(  �   *    �*  4   �+  �   ,  Z   �,  "   @-  �   c-  �   .  �   �.  u   �/  a   �/  �   `0  ^   �0  	   T1  
   ^1     i1     u1  
   ~1     �1     �1     �1     �1     �1  �  �1  K   ]3  �   �3  5   C4  t   y4    �4  B   �5  �   ?6  Q   7  3   X7  �   �7  1   8     O8  w   V8  /   �8     �8  4   9  4   @9     u9  �   �9     +:     8:  �   E:  �   �:  _   Z;  :  �;     �<  ,   =  !   <=     ^=  (   v=  q   �=  I   >     [>     v>  �   �>    ?  �   @    �@     �A  i   �A  �   =B  f   �B     \C  x   kC  e   �C  �   JD  w   EE  �   �E  �   KF  )   &G  �   PG  >   <H  W   {H  3   �H  �   I  E   �I  �   �I     �J  7   �J  7   K  6   ;K  ]   rK  �   �K     SL  8   hL  l   �L     M  !   -M  $   OM     tM  4   �M     �M     �M  $   �M  �   N     �N  �   �N  B   zO    �O  �   �P  �   �Q  A   DR  �   �R  Y   IS     �S  �   �S  �   _T  �   $U  p   �U  Y   :V  }   �V  U   W  	   hW     rW     {W     �W  
   �W     �W     �W     �W     �W     �W   (The `sidebar2` location for the sidebar is needed by the ``sphinxdoc.css`` stylesheet, for example.) **Important**: If you override a block, call ``{{ super() }}`` somewhere to render the block's original content in the extended template -- unless you don't want that content to show up. A boolean that is True if the toc contains more than one entry. A callable yielding the global TOC tree containing the current page, rendered as HTML bullet lists.  Optional keyword arguments: A list of links to put at the left side of the relbar, next to "next" and "prev".  This usually contains links to the general index and other indices, such as the Python module index.  If you add something yourself, it must be a tuple ``(pagename, link title, accesskey, link text)``. A list of parent documents for navigation, structured like the :data:`next` item. A possible location for a sidebar.  `sidebar1` appears before the document and is empty by default, `sidebar2` after the document and contains the default sidebar.  If you want to swap the sidebar location override this and call the `sidebar` helper: A string containing the content of the page in HTML form as produced by the HTML builder, before the theme is applied. A string containing the page's HTML :dudir:`meta` tags. A template contains **variables**, which are replaced with values when the template is evaluated, **tags**, which control the logic of the template and **blocks** which are used for template inheritance. Add additional script files here, like this:: Blocks By prefixing the name of the overridden template with an exclamation mark, Sphinx will load the layout template from the underlying HTML theme. Check if a document with the name *document* exists. Configuration Variables Do I need to use Sphinx's templates to produce HTML? Document metadata (a dictionary), see :ref:`metadata`. Emit a warning message. For example, to add a new link to the template area containing related links all you have to do is to add a new template called ``layout.html`` with the following contents:: Global Variables Helper Functions In addition to these values, there are also all **theme options** available (prefixed by ``theme_``), as well as the values given by the user in :confval:`html_context`. In documents that are created from source files (as opposed to automatically-generated files like the module index, or documents that already are in HTML form), these variables are also available: Inside templates you can set a couple of variables used by the layout template using the ``{% set %}`` tag: Inside the relbar there are three sections: The `rootrellink`, the links from the documentation and the custom `relbaritems`.  The `rootrellink` is a block that by default contains a list item pointing to the master document by default, the `relbaritems` is an empty block.  If you override them to add extra links into the bar make sure that they are list items and end with the :data:`reldelim1`. Jinja/Sphinx Templating Primer Like :data:`next`, but for the previous page. No.  You have several other options: Overriding works like this:: Please use ``.Sphinx.add_js_file()`` instead. Return the path to a *file* which is a filename relative to the root of the generated output.  Use this to refer to static files. Return the path to a Sphinx document as a URL.  Use this to refer to built documents. Return the rendered relation bar. Return the rendered sidebar. Sphinx provides various Jinja functions as helpers in the template.  You can use them to generate links or output multiply used elements. Sphinx uses the `Jinja <http://jinja.pocoo.org>`_ templating engine for its HTML templates.  Jinja is a text-based engine, and inspired by Django templates, so anyone having used Django will already be familiar with it.  It also has excellent documentation for those who need to make themselves familiar with it. Sphinx will look for templates in the folders of :confval:`templates_path` first, and if it can't find the template it's looking for there, it falls back to the selected theme's templates. Sphinx's *basic* theme provides base templates with a couple of blocks it will fill with data.  These are located in the :file:`themes/basic` subdirectory of the Sphinx installation directory, and used by all builtin Sphinx themes. Templates with the same name in the :confval:`templates_path` override templates supplied by the selected theme. Templating The "Show source" link within the sidebar (normally only shown if this is enabled by :confval:`html_show_sourcelink`). The "page name" of the current file, i.e. either the document name if the file is generated from a reST source, or the equivalent hierarchical name relative to the output directory (``[directory/]filename_without_extension``). The block for the footer div.  If you want a custom footer or markup before or after it, override this one. The build date. The builtin **basic** theme supplies the templates that all builtin Sphinx themes are based on.  It has the following elements you can override or use: The contents of the document itself.  It contains the block "body" where the individual content is put by subtemplates like ``page.html``. The default templating language in Sphinx is Jinja.  It's Django/Smarty inspired and easy to understand.  The most important concept in Jinja is :dfn:`template inheritance`, which means that you can overwrite only specific blocks within a template, customizing it while also keeping the changes at a minimum. The delimiter for the items on the left side of the related bar.  This defaults to ``' &raquo;'`` Each item in the related bar ends with the value of this variable. The delimiter for the items on the right side of the related bar.  This defaults to ``' |'``.  Each item except of the last one in the related bar ends with the value of this variable. The doctype of the output format.  By default this is XHTML 1.0 Transitional as this is the closest to what Sphinx and Docutils generate and it's a good idea not to change it unless you want to switch to HTML 5 or a different but compatible XHTML doctype. The following blocks exist in the ``layout.html`` template: The following four blocks are *only* used for pages that do not have assigned a list of custom sidebars in the :confval:`html_sidebars` config value.  Their use is deprecated in favor of separate sidebar templates, which can be included via :confval:`html_sidebars`. The local table of contents for the current page, rendered as HTML bullet lists. The logo location within the sidebar.  Override this if you want to place some content at the top of the sidebar. The name of the builder (e.g. ``html`` or ``htmlhelp``). The name of the copied source file for the current document.  This is only nonempty if the :confval:`html_copy_source` value is ``True``. This has empty value on creating automatically-generated files. The name of the main stylesheet, as given by the theme or :confval:`html_style`. The next document for the navigation.  This variable is either false or has two attributes `link` and `title`.  The title contains HTML markup.  For example, to generate a link to the next page, you can use this snippet:: The page title. The path to the HTML favicon in the static path, or ``''``. The path to the HTML logo image in the static path, or ``''``. The relation links (previous, next document) within the sidebar. The search box within the sidebar.  Override this if you want to place some content at the bottom of the sidebar. The suffix of the file that was rendered. Since we support a list of :confval:`source_suffix`, this will allow you to properly link to the original source file. The table of contents within the sidebar. The title of the current document, as used in the ``<title>`` tag. The title of the documentation (the value of :confval:`html_title`), except when the "single-file" builder is used, when it is set to ``None``. The value of :confval:`copyright`. The value of :confval:`html_short_title`. The value of :confval:`html_use_opensearch`. The value of :confval:`language`. The value of :confval:`master_doc`, for usage with :func:`pathto`. The value of :confval:`project`. The value of :confval:`release`. The value of :confval:`version`. The value of the builder's :attr:`~.SerializingHTMLBuilder.out_suffix` attribute, i.e. the file name extension that the output files will get.  For a standard HTML builder, this is usually ``.html``. The version of Sphinx used to build. These global variables are available in every template and are safe to use. There are more, but most of them are an implementation detail and might change in the future. This block adds a couple of ``<link>`` tags to the head section of the template. This block contains the *relation bar*, the list of related links (the parent documents on the left, and the links to index, modules etc. on the right).  `relbar1` appears before the document, `relbar2` after the document.  By default, both blocks are filled; to show the relbar only before the document, you would override `relbar2` like this:: This block is empty by default and can be used to add extra contents into the ``<head>`` tag of the generated HTML file.  This is the right place to add references to JavaScript or extra CSS files. To customize the output of your documentation you can override all the templates (both the layout templates and the child templates) by adding files with the same name as the original filename into the template directory of the structure the Sphinx quickstart generated for you. True if :confval:`html_show_sourcelink` is ``True``. True if the built HTML is meant to be embedded in some viewing application that handles navigation, not the web browser, such as for HTML help or Qt help formats.  In this case, the sidebar is not included. True if the reST document sources are copied (if :confval:`html_copy_source` is ``True``). Working with the builtin templates You can :ref:`write a custom builder <writing-builders>` that derives from :class:`~sphinx.builders.html.StandaloneHTMLBuilder` and calls your template engine of choice. You can use the :class:`~sphinx.builders.html.PickleHTMLBuilder` that produces pickle files with the page contents, and postprocess them using a custom tool, or use them in your Web application. You can write a :class:`~sphinx.application.TemplateBridge` subclass that calls your template engine of choice, and set the :confval:`template_bridge` configuration value accordingly. ``collapse`` (``True`` by default): if true, all TOC entries that are not ancestors of the current page are collapsed ``includehidden`` (``False`` by default): if true, the TOC tree will also contain hidden entries. ``maxdepth`` (defaults to the max depth selected in the toctree directive): the maximum depth of the tree; set it to ``-1`` to allow unlimited depth ``titles_only`` (``False`` by default): if true, put only toplevel document titles in the tree `doctype` `document` `extrahead` `footer` `linktags` `sidebarlogo` `sidebarrel` `sidebarsearch` `sidebarsourcelink` `sidebartoc` Project-Id-Version: Sphinx 2.1.0+/1499a97c2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-05-10 14:45+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (例如, ``sphinxdoc.css`` 样式表需要侧边栏的 `sidebar2` 位置. ) **重要**: 如果覆盖一个块, 请在某处调用 ``{{super()}}`` 以在扩展模板中呈现块的原始内容 - 除非您不希望显示该内容.  如果toc包含多个条目, 则为布尔值为True.  一个可调用的, 产生包含当前页面的全局TOC树, 呈现为HTML项目符号列表. 可选关键字参数: 放置在relbar左侧,  "next" 和 "prev" 旁边的链接列表. 这通常包含指向常规索引和其他索引的链接, 例如Python模块索引. 如果你自己添加一些东西, 它必须是一个元组 ``(页面名称, 链接标题, 访问键, 链接文本)``.  用于导航的父文档列表, 结构类似于 :data:`next` 项.  侧边栏的可能位置.  `sidebar1` 出现在文档之前, 默认为空, 在文档后面是`sidebar2`并包含默认侧边栏. 如果你想交换边栏位置覆盖它并调用 `sidebar` 帮助器: 在应用主题之前, 包含HTML构建器生成的HTML表单内容的字符串.  包含页面HTML :dudir:`meta` 标签的字符串.  模板包含 **variables**: 在评估模板时将其替换为值, **tags**: 用于控制模板的逻辑, 以及 **blocks**: 用于模板继承.  在这里添加其他脚本文件, 如下所示:: Blocks 通过在带有感叹号的被覆盖模板的名称前面加上前缀, Sphinx将从底层HTML主题加载布局模板.  检查是否存在名为 *document* 的文档.  配置变量 我是否需要使用Sphinx的模板来生成HTML？ 文档元数据(字典), 请参阅 :ref:`metadata`.  发出警告信息.  例如, 要向包含相关链接的模板区域添加新链接, 您所要做的就是添加一个名为 ``layout.html`` 的新模板, 其中包含以下内容:: 全局变量 助手功能 除了这些值之外, 还有所有 **主题选项** (以 ``theme_`` 为前缀), 以及用户在 :confval:`html_context` 中给出的值.  在从源文件创建的文档中(与自动生成的文件(如模块索引或已经是HTML格式的文档)相反), 这些变量也可用: 在模板内部, 您可以使用 ``{％set％}`` 标签设置布局模板使用的几个变量: 在relbar里面有三个部分: `rootrellink`, 文档中的链接和自定义 `relbaritems`.  `rootrellink` 是一个默认包含指向主文档的列表项的块, `relbaritems` 是一个空块. 如果覆盖它们以在条形图中添加额外的链接, 请确保它们是列表项并以 :data:`reldelim1` 结束.  Jinja/Sphinx 模板入门 喜欢 :data:`next`, 但是对于上一页.  不, 您还有其他几种选择: 覆盖就是这样的:: 请用 ``.Sphinx.add_js_file()`` 代替. 将路径返回到*文件*, 该文件是相对于生成的输出的根的文件名. 用它来引用静态文件.  将路径返回到Sphinx文档作为URL. 用它来引用构建的文档.  返回渲染的关系栏.  返回渲染的侧边栏.  Sphinx在模板中提供各种Jinja函数作为帮助程序. 您可以使用它们来生成链接或输出多次使用的元素.  Sphinx使用 `Jinja <http://jinja.pocoo.org>`_ 模板引擎作为其HTML模板.  Jinja是一个基于文本的引擎, 受到Django模板的启发, 因此任何使用过Django的人都会熟悉它.  它还为那些需要熟悉它的人提供了出色的文档.  Sphinx将首先在 :confval:`templates_path` 文件夹中查找模板, 如果找不到它正在寻找的模板, 它将回退到所选主题的模板.  Sphinx的 *basic* 主题为基本模板提供了几个块, 它将填充数据. 它们位于Sphinx安装目录的 :file:`themes/basic` 子目录中, 并由所有内置Sphinx主题使用. 在 :confval:`templates_path` 中具有相同名称的模板会覆盖所选主题提供的模板.  模板 侧边栏中的“显示源”链接(通常仅在以下情况下显示 :confval:`html_show_sourcelink`).  当前文件的“页面名称”, 即文件名(如果文件是从reST源生成的), 或者是相对于输出目录的等效层次名称(``[directory/] filename_without_extension``).  页脚div的块. 如果您想在其之前或之后使用自定义页脚或标记, 请覆盖此页脚.  构建日期.  内置 **基本** 主题提供所有内置Sphinx主题所基于的模板. 它具有以下可以覆盖或使用的元素: 文件本身的内容. 它包含块 "body" , 其中单个内容由 ``page.html`` 等子模板放置.  Sphinx中的默认模板语言是Jinja. 这是 Django/Smarty 的灵感和易于理解.  Jinja中最重要的概念是 :dfn:`template inheritance` , 这意味着您只能覆盖模板中的特定块, 自定义它, 同时将更改保持在最低限度.  相关栏左侧项目的分隔符. 这默认为 ``' &raquo;'`` 相关栏中的每个项目都以此变量的值结束.  相关栏右侧项目的分隔符. 这默认为 ``' |'``. 除相关栏中最后一个项目之外的每个项目都以此变量的值结束.  输出格式的doctype. 默认情况下, 这是XHTML 1.0 Transitional, 因为它最接近Sphinx和Docutils生成的内容, 除非您想要切换到HTML 5或不同但兼容的XHTML doctype, 否则最好不要更改它.  ``layout.html`` 模板中存在以下块: 以下四个块 *仅* 用于未在 :confval:`html_sidebars` 配置值中分配自定义侧边栏列表的页面. 它们的使用已被弃用, 有利于单独的侧边栏模板, 可以通过以下方式包含 :confval:`html_sidebars` .  当前页面的本地目录, 呈现为HTML项目符号列表.  侧栏内的徽标位置. 如果要在边栏顶部放置一些内容, 请覆盖此项.  构建器的名称(例如``html``或``htmlhelp``).  当前文档的复制源文件的名称. 如果 :confval:`html_copy_source` 值为 ``True``, 则这只是非空的. 这对于创建自动生成的文件没有空白价值.  主要样式表的名称, 由主题或 :confval:`html_style` 给出.  导航的下一个文档. 这个变量要么是假的, 要么有两个属性 `link` 和 `title`. 标题包含HTML标记. 例如, 要生成指向下一页的链接, 您可以使用此代码段:: 页面标题.  静态路径中 HTML favicon 的路径, 或者 ``''``.  静态路径中HTML徽标图像的路径, 或者``'``.  边栏内的关系链接(上一个, 下一个文档).  侧边栏内的搜索框. 如果要在侧边栏的底部放置一些内容, 请覆盖此项.  已呈现文件的后缀. 由于我们支持以下列表 :confval:`source_suffix`, 这将允许您正确链接到原始源文件.  侧栏内的目录.  当前文档的标题, 在 ``<title>`` 标签中使用.  文档的标题(值 :confval:`html_title`), 除非使用“单文件”构建器, 否则设置为“无”.  价值 :confval:`copyright` .  值 :confval:`html_short_title`.  值 :confval:`html_use_opensearch`.  :confval:`language` 的值 .  :confval:`master_doc 的值`, 用于 :func:`pathto`. 值 :confval:`project`.  值 :confval:`release`.  值 :confval:`html_use_opensearch`.  构建器的值 :attr:`〜.SerializingHTMLBuilder.out_suffix` 属性, 即输出文件将获得的文件扩展名. 对于标准的HTML构建器, 这通常是 ``.html``.  用于构建的Sphinx版本.  这些全局变量在每个模板中都可用, 并且可以安全使用. 还有更多, 但大多数都是实现细节, 将来可能会发生变化.  这个块在模板的head部分添加了几个 ``<link>`` 标签.  该块包含*关系栏*, 相关链接列表(左侧的父文档, 右侧的索引链接, 模块等).  `relbar1` 出现在文档之前, `relbar2` 出现在文档之后. 默认情况下, 两个块都已填充;要在文档之前显示relbar, 你可以像这样重写 `relbar2` :: 默认情况下, 此块为空, 可用于将额外内容添加到生成的HTML文件的 ``<head>`` 标记中. 这是添加对JavaScript或额外CSS文件的引用的正确位置.  要自定义文档的输出, 可以通过将与原始文件名同名的文件添加到Sphinx快速入门为您生成的结构的模板目录中来覆盖所有模板(布局模板和子模板).  如果 :confval:`html_show_sourcelink` 是 ``True`` , 则为真.  如果构建的HTML旨在嵌入到处理导航的某个查看应用程序中, 而不是Web浏览器(例如HTML帮助或Qt帮助格式), 则为True. 在这种情况下, 侧边栏不包括在内.  如果复制了reST文档源, 则为True(如果 :confval:`html_copy_source`为``True``).  使用内置模板 您可以 :ref:`编写一个自定义构建器<writing-builders>`, 它派生自 :class:`~sphinx.builders.html.StandaloneHTMLBuilder` 并调用您选择的模板引擎.  您可以使用 :class:`~sphinx.builders.html.PickleHTMLBuilder` 生成带有页面内容的 pickle 文件, 并使用自定义工具对其进行后处理, 或者在Web应用程序中使用它们.  你可以编写一个 :class:`~sphinx.application.TemplateBridge` 子类来调用你选择的模板引擎, 并相应地设置 :confval:`template_bridge` 配置值.  ``collapse`` (默认为 ``True``):如果为true, 则表示当前页面不是祖先的所有TOC条目都将折叠 `includehidden``(默认为 ``False``): 如果为true, TOC树也将包含隐藏的条目.  ``maxdepth`` (默认为toctree指令中选择的最大深度):树的最大深度;将它设置为 ``-1`` 以允许无限深度 ``titles_only``(默认为 ``False``):如果为true, 则只在树中放入文档标题 `doctype` `文档` `extrahead` `页脚` `linktags` `sidebarlogo` `sidebarrel` `sidebarsearch` `sidebarsourcelink` `sidebartoc` 