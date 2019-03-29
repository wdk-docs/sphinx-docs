��          �               �   ?   �      -     ;  z   D  �   �  >   l    �  �   �  /   l  1   �  P   �  J     �  j  ?   �     2     @  z   I  �   �  >   q    �  �   �	  /   q
  1   �
  P   �
  J   $   :mod:`sphinx.ext.linkcode` -- Add external links to source code Configuration Example: In your configuration, you need to specify a :confval:`linkcode_resolve` function that returns an URL based on the object. The argument ``domain`` specifies the language domain the object is in. ``info`` is a dictionary with the following keys guaranteed to be present (dependent on the domain): The function should return ``None`` if no link is to be added. This extension looks at your object descriptions (``.. class::``, ``.. function::`` etc.) and adds external links to code hosted somewhere on the web. The intent is similar to the ``sphinx.ext.viewcode`` extension, but assumes the source code can be found somewhere on the Internet. This is a function ``linkcode_resolve(domain, info)``, which should return the URL to source code corresponding to the object in given domain with given information. ``c``: ``names`` (list of names for the object) ``cpp``: ``names`` (list of names for the object) ``javascript``: ``object`` (name of the object), ``fullname`` (name of the item) ``py``: ``module`` (name of the module), ``fullname`` (name of the object) Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 :mod:`sphinx.ext.linkcode` -- Add external links to source code Configuration Example: In your configuration, you need to specify a :confval:`linkcode_resolve` function that returns an URL based on the object. The argument ``domain`` specifies the language domain the object is in. ``info`` is a dictionary with the following keys guaranteed to be present (dependent on the domain): The function should return ``None`` if no link is to be added. This extension looks at your object descriptions (``.. class::``, ``.. function::`` etc.) and adds external links to code hosted somewhere on the web. The intent is similar to the ``sphinx.ext.viewcode`` extension, but assumes the source code can be found somewhere on the Internet. This is a function ``linkcode_resolve(domain, info)``, which should return the URL to source code corresponding to the object in given domain with given information. ``c``: ``names`` (list of names for the object) ``cpp``: ``names`` (list of names for the object) ``javascript``: ``object`` (name of the object), ``fullname`` (name of the item) ``py``: ``module`` (name of the module), ``fullname`` (name of the object) 