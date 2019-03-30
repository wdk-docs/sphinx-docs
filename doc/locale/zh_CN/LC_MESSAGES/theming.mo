��    "      ,              <  %   =     c  �   ~  t        �  )   �  4   �     �         /  b   >  �   �  	  0  T  :     �	  
   �	  �  �	  �   3  �     �   �  d  p  �   �  �   �  b     q   �  4   �     '  �   D  �   �    �  ,   �  3        8  �  I  $   �     �  �     t   �     %  !   2  4   T  "   �     �    �  b   �  �   /  	  �  T  �          *  �  1  �   �  �   �  �   <   d  �   �   ["  �   #  b   �#  q   $  B   x$  !   �$  �   �$  �   u%    Y&  ,   p'  3   �'     �'   'sphinx_themes' entry_points feature. A :file:`theme.conf` file. A ``static/`` directory containing any static files that will be copied to the output static directory on build.  These can be images, styles, script files. As a way to distribute your theme, you can use Python package.  Python package brings to users easy setting up ways. Creating themes Distribute your theme as a Python package First, in the user's ``templates_path`` directories. HTML templates, if needed. HTML theming support If the name of a file in the ``static/`` directory of a theme (or in the user's static path, for that matter) ends with ``_t``, it will be processed by the template engine.  The ``_t`` will be left from the final file name.  For example, the *classic* theme has a file ``static/classic.css_t`` which uses templating to put the color options into the stylesheet.  When a documentation is built with the classic theme, the output directory will contain a ``_static/classic.css`` file where all template tags have been processed. If your theme package contains two or more themes, please call ``add_html_theme()`` twice or more. It is not an executable Python file, as opposed to :file:`conf.py`, because that would pose an unnecessary security risk if themes are shared. Since theme options are meant for the user to configure a theme more easily, without having to write a custom stylesheet, it is necessary to be able to template static files as well as HTML files.  Therefore, Sphinx supports so-called "static templates", like this: Sphinx supports changing the appearance of its HTML output via *themes*.  A theme is a collection of HTML templates, stylesheet(s) and other static files. Additionally, it has a configuration file which specifies from which theme to inherit, which highlighting style to use, and what options exist for customizing the theme's look and feel. Static templates Templating The **inherit** setting gives the name of a "base theme", or ``none``.  The base theme will be used to locate missing templates (most themes will not have to supply most templates if they use ``basic`` as the base theme), its options will be inherited, and all of its static files will be used as well. If you want to also inherit the stylesheet, include it via CSS' ``@import`` in your own. The **options** section contains pairs of variable names and default values. These options can be overridden by the user in :confval:`html_theme_options` and are accessible from all templates as ``theme_<name>``. The **pygments_style** setting gives the name of a Pygments style to use for highlighting.  This can be overridden by the user in the :confval:`pygments_style` config value. The **sidebars** setting gives the comma separated list of sidebar templates for constructing sidebars.  This can be overridden by the user in the :confval:`html_sidebars` config value. The **stylesheet** setting gives the name of a CSS file which will be referenced in the HTML header.  If you need more than one CSS file, either include one from the other via CSS' ``@import``, or use a custom HTML template that adds ``<link rel="stylesheet">`` tags as necessary.  Setting the :confval:`html_style` config value will override this setting. The :doc:`guide to templating <templating>` is helpful if you want to write your own templates.  What is important to keep in mind is the order in which Sphinx searches for templates: The :file:`theme.conf` file is in INI format [1]_ (readable by the standard Python :mod:`ConfigParser` module) and has the following structure: Themes are meant to be project-unaware, so they can be used for different projects without change. Themes take the form of either a directory or a zipfile (whose name is the theme name), containing the following: Then, in its base theme, its base's base theme, etc. Then, in the selected theme. This document provides information about creating your own theme. If you simply wish to use a pre-existing HTML themes, refer to :doc:`/usage/theming`. To distribute your theme as a Python package, please define an entry point called ``sphinx.html_themes`` in your ``setup.py`` file, and write a ``setup()`` function to register your themes using ``add_html_theme()`` API in it:: When extending a template in the base theme with the same name, use the theme name as an explicit directory: ``{% extends "basic/layout.html" %}``.  From a user ``templates_path`` template, you can still use the "exclamation mark" syntax as described in the templating document. ``sphinx.html_themes`` entry_points feature. ``sphinx_themes`` entry_points has been deprecated. sidebar settings Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 'sphinx_themes'entry_points功能。 :file:`theme.conf` 文件。 A ``static/`` directory containing any static files that will be copied to the output static directory on build.  These can be images, styles, script files. As a way to distribute your theme, you can use Python package.  Python package brings to users easy setting up ways. 创建主题 将您的主题分发为Python包 First, in the user's ``templates_path`` directories. HTML模板，如果需要的话。 HTML主题支持 If the name of a file in the ``static/`` directory of a theme (or in the user's static path, for that matter) ends with ``_t``, it will be processed by the template engine.  The ``_t`` will be left from the final file name.  For example, the *classic* theme has a file ``static/classic.css_t`` which uses templating to put the color options into the stylesheet.  When a documentation is built with the classic theme, the output directory will contain a ``_static/classic.css`` file where all template tags have been processed. If your theme package contains two or more themes, please call ``add_html_theme()`` twice or more. It is not an executable Python file, as opposed to :file:`conf.py`, because that would pose an unnecessary security risk if themes are shared. Since theme options are meant for the user to configure a theme more easily, without having to write a custom stylesheet, it is necessary to be able to template static files as well as HTML files.  Therefore, Sphinx supports so-called "static templates", like this: Sphinx supports changing the appearance of its HTML output via *themes*.  A theme is a collection of HTML templates, stylesheet(s) and other static files. Additionally, it has a configuration file which specifies from which theme to inherit, which highlighting style to use, and what options exist for customizing the theme's look and feel. 静态模板 模板 The **inherit** setting gives the name of a "base theme", or ``none``.  The base theme will be used to locate missing templates (most themes will not have to supply most templates if they use ``basic`` as the base theme), its options will be inherited, and all of its static files will be used as well. If you want to also inherit the stylesheet, include it via CSS' ``@import`` in your own. The **options** section contains pairs of variable names and default values. These options can be overridden by the user in :confval:`html_theme_options` and are accessible from all templates as ``theme_<name>``. The **pygments_style** setting gives the name of a Pygments style to use for highlighting.  This can be overridden by the user in the :confval:`pygments_style` config value. The **sidebars** setting gives the comma separated list of sidebar templates for constructing sidebars.  This can be overridden by the user in the :confval:`html_sidebars` config value. The **stylesheet** setting gives the name of a CSS file which will be referenced in the HTML header.  If you need more than one CSS file, either include one from the other via CSS' ``@import``, or use a custom HTML template that adds ``<link rel="stylesheet">`` tags as necessary.  Setting the :confval:`html_style` config value will override this setting. The :doc:`guide to templating <templating>` is helpful if you want to write your own templates.  What is important to keep in mind is the order in which Sphinx searches for templates: The :file:`theme.conf` file is in INI format [1]_ (readable by the standard Python :mod:`ConfigParser` module) and has the following structure: Themes are meant to be project-unaware, so they can be used for different projects without change. Themes take the form of either a directory or a zipfile (whose name is the theme name), containing the following: 然后，在它的基础主题，它的基地的基础主题等。 然后，在选定的主题中。 This document provides information about creating your own theme. If you simply wish to use a pre-existing HTML themes, refer to :doc:`/usage/theming`. To distribute your theme as a Python package, please define an entry point called ``sphinx.html_themes`` in your ``setup.py`` file, and write a ``setup()`` function to register your themes using ``add_html_theme()`` API in it:: When extending a template in the base theme with the same name, use the theme name as an explicit directory: ``{% extends "basic/layout.html" %}``.  From a user ``templates_path`` template, you can still use the "exclamation mark" syntax as described in the templating document. ``sphinx.html_themes`` entry_points feature. ``sphinx_themes`` entry_points has been deprecated. sidebar settings 