��          T               �   D   �      �   �   �   �   �  @   x  �   �  �  Q  D   �       �   >  �   !  @   �  �      :mod:`sphinx.ext.ifconfig` -- Include content based on configuration For example, one could write :: Include content of the directive only if the Python expression given as an argument is ``True``, evaluated in the namespace of the project's configuration (that is, all registered variables from :file:`conf.py` are available). The second argument is the default value, the third should always be ``'env'`` for such values (it selects if Sphinx re-reads the documents if the value changes). This extension is quite simple, and features only one directive: To make a custom config value known to Sphinx, use :func:`~sphinx.application.Sphinx.add_config_value` in the setup function in :file:`conf.py`, e.g.:: Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 :mod:`sphinx.ext.ifconfig` -- Include content based on configuration For example, one could write :: Include content of the directive only if the Python expression given as an argument is ``True``, evaluated in the namespace of the project's configuration (that is, all registered variables from :file:`conf.py` are available). The second argument is the default value, the third should always be ``'env'`` for such values (it selects if Sphinx re-reads the documents if the value changes). This extension is quite simple, and features only one directive: To make a custom config value known to Sphinx, use :func:`~sphinx.application.Sphinx.add_config_value` in the setup function in :file:`conf.py`, e.g.:: 