��          t               �   Q   �        �   -  ,        A  Q   J  J   �  �   �  �   t  W    �  j  S   �     F  �   M  (        G  @   P  E   �  l   �  �   D	  `  �	   Add *recommonmark* to the :confval:`list of configured extensions <extensions>`:: Configuration If you want to use Markdown files with extensions other than ``.md``, adjust the :confval:`source_suffix` variable.  The following example configures Sphinx to parse all files with the extensions ``.md`` and ``.txt`` as Markdown:: Install the Markdown parser *recommonmark*:: Markdown The configuration as explained here requires recommonmark version 0.5.0 or later. To configure your Sphinx project for Markdown support, proceed as follows: Version 1.8 deprecates and version 3.0 removes the ``source_parsers`` configuration variable that was used by older *recommonmark* versions. You can further configure *recommonmark* to allow custom syntax that standard *CommonMark* doesn't support.  Read more in the `recommonmark documentation`__. `Markdown`__ is a lightweight markup language with a simplistic plain text formatting syntax.  It exists in many syntactically different *flavors*.  To support Markdown-based documentation, Sphinx can use `recommonmark`__. recommonmark is a Docutils bridge to `CommonMark-py`__, a Python package for parsing the `CommonMark`__ Markdown flavor. Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 将 *recommonmark* 添加到 :confval:`已配置的扩展名列表 <extensions>` :: 配置 如果要使用除 ``.md`` 以外的扩展名的Markdown文件，请调整 :confval:`source_suffix` 变量。下面的示例配置Sphinx将所有扩展名为 ``.md`` 和 ``.txt`` 的文件解析为 Markdown:: 安装Markdown解析器 *recommonmark*:: Markdown 此处说明的配置需要6.5.0或更高版本的propmonmark。 要配置Sphinx项目以获得Markdown支持，请执行以下操作: 版本1.8弃用，版本3.0删除了旧的 *recommonmark* 版本使用的 ``source_parsers`` 配置变量。 您可以进一步配置 *recommonmark* 以允许标准 *CommonMark* 不支持的自定义语法。 阅读 `recommonmark documentation`__ 中的更多内容。 `Markdown`__ 是一种轻量级标记语言，具有简单的纯文本格式语法。它存在于许多语法上不同的 *flavors* 。  为了支持基于Markdown的文档，Sphinx可以使用 `recommonmark`__ 。recommonmark是一个Docutils桥接器，用于 `CommonMark-py`__ ，这是一个用于解析 `CommonMark`__ Markdown风格的Python包。 