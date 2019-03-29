��    .      �              �  R   �  #   P     t  "   �  !   �     �      �  7     �   M  3   �  :     6   I  �   �     (  1   D  b   v  (   �  �    +   �  C   �  5   �  �   /	  3   "
  )   V
  )   �
  S   �
  /   �
  '   .  D   V  >   �  3   �       2   ,  )   _  (   �  �   �  ,   g  g   �  f   �  :   c  �   �  9   7  4   q  	   �     �  �  �  R   X  #   �     �  "   �  !        3      O  7   p  �   �  3   5  :   i  6   �  �   �     �  1   �  b   �  (   4  �  ]  +   �  C     5   T  �   �  3   }  )   �  )   �  S     /   Y  '   �  D   �  >   �  3   5     i  2   �  )   �  (   �  �     ,   �  g   �  f   W  :   �  �   �  9   �  4   �  	           *_from* is a path for source image file, and *_to* is a path for destination file. A base class for Sphinx directives. A base class for Sphinx roles. A base class for image converters. A base class for reference roles. A base class of Transforms. A base class of post-transforms. A boolean indicates the role has explicit title or not. A conversion rules the image converter supports. It is represented as a list of pair of source image format (mimetype) and destination one:: A dictionary of directive options for customization A list of strings, the directive content for customization A string containing the entire interpreted text input. An image converter is kind of Docutils transform module.  It is used to convert image files which does not supported by builder to appropriate format for that builder. Base classes for components Check this transform working for current builder. Compared with ``docutils.transforms.Transform``, this class improves accessibility to Sphinx APIs. Convert a image file to expected format. For example, :py:class:`LaTeX builder <.LaTeXBuilder>` supports PDF, PNG and JPEG as image formats.  However it does not support SVG images. For such case, to use image converters allows to embed these unsupported images into the document.  One of image converters; :ref:`sphinx.ext.imgconverter <sphinx.ext.imgconverter>` can convert a SVG image to PNG format using Imagemagick internally. Make a subclass of ``ImageConverter`` class Override ``conversion_rules``, ``is_available()`` and ``convert()`` Override to apply the transform to the document tree. Post transforms are invoked to modify the document to restructure it for outputting. They do resolving references, convert images, special transformation for each output formats and so on.  This class helps to implement these post transforms. Reference to the :class:`.BuildEnvironment` object. Reference to the :class:`.Config` object. Reference to the :class:`.Sphinx` object. Register your image converter to Sphinx using :py:meth:`.Sphinx.add_post_transform` Return the image converter is available or not. Set source and line number to the node. Sphinx provides utility classes and functions to develop extensions. Subclasses should override this method instead of ``apply()``. The ``docutils.parsers.rst.states.Inliner`` object. The interpreted text content. The line number where the interpreted text begins. The link target for the interpreted text. The link title for the interpreted text. The reference roles can accpet ``link title <target>`` style as a text for the role.  The parsed result; link title and target will be stored to ``self.title`` and ``self.target``. The role name actually used in the document. The subclasses of them might not work with bare docutils because they are strongly coupled with Sphinx. The subclasses of this class might not work with docutils. This class is strongly coupled with Sphinx. There are three steps to make your custom image converter: These base classes are useful to allow your extensions to obtain Sphinx components (e.g. :class:`.Config`, :class:`.BuildEnvironment` and so on) easily. This class provides helper methods for Sphinx directives. This class provides helper methods for Sphinx roles. Utilities main method of post transforms. Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 *_from* is a path for source image file, and *_to* is a path for destination file. A base class for Sphinx directives. A base class for Sphinx roles. A base class for image converters. A base class for reference roles. A base class of Transforms. A base class of post-transforms. A boolean indicates the role has explicit title or not. A conversion rules the image converter supports. It is represented as a list of pair of source image format (mimetype) and destination one:: A dictionary of directive options for customization A list of strings, the directive content for customization A string containing the entire interpreted text input. An image converter is kind of Docutils transform module.  It is used to convert image files which does not supported by builder to appropriate format for that builder. Base classes for components Check this transform working for current builder. Compared with ``docutils.transforms.Transform``, this class improves accessibility to Sphinx APIs. Convert a image file to expected format. For example, :py:class:`LaTeX builder <.LaTeXBuilder>` supports PDF, PNG and JPEG as image formats.  However it does not support SVG images. For such case, to use image converters allows to embed these unsupported images into the document.  One of image converters; :ref:`sphinx.ext.imgconverter <sphinx.ext.imgconverter>` can convert a SVG image to PNG format using Imagemagick internally. Make a subclass of ``ImageConverter`` class Override ``conversion_rules``, ``is_available()`` and ``convert()`` Override to apply the transform to the document tree. Post transforms are invoked to modify the document to restructure it for outputting. They do resolving references, convert images, special transformation for each output formats and so on.  This class helps to implement these post transforms. Reference to the :class:`.BuildEnvironment` object. Reference to the :class:`.Config` object. Reference to the :class:`.Sphinx` object. Register your image converter to Sphinx using :py:meth:`.Sphinx.add_post_transform` Return the image converter is available or not. Set source and line number to the node. Sphinx provides utility classes and functions to develop extensions. Subclasses should override this method instead of ``apply()``. The ``docutils.parsers.rst.states.Inliner`` object. The interpreted text content. The line number where the interpreted text begins. The link target for the interpreted text. The link title for the interpreted text. The reference roles can accpet ``link title <target>`` style as a text for the role.  The parsed result; link title and target will be stored to ``self.title`` and ``self.target``. The role name actually used in the document. The subclasses of them might not work with bare docutils because they are strongly coupled with Sphinx. The subclasses of this class might not work with docutils. This class is strongly coupled with Sphinx. There are three steps to make your custom image converter: These base classes are useful to allow your extensions to obtain Sphinx components (e.g. :class:`.Config`, :class:`.BuildEnvironment` and so on) easily. This class provides helper methods for Sphinx directives. This class provides helper methods for Sphinx roles. Utilities main method of post transforms. 