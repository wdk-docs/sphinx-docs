��                          M     ?   [     �     �     �     �  <   �  �   &  ^   �     2  G   E  >   �  8   �  3     m   9  *   �  &   �  *   �  3   $  E   X  (   �  �   �  �   J  2   �  E     <   U  (   �     �  5   �  e   �  �  \	  M   �
  ?   2     r     �     �     �  <   �  �   �  ^   �     	  G     >   d  8   �  3   �  m     *   ~  &   �  *   �  3   �  E   /  (   u  �   �  �   !  2   �  E   �  <   ,  (   i     �  5   �  e   �   *typ* can be used to qualify the link characteristic for individual builders. A place where you can add logic before :meth:`write_doc` is run Build all source files. Builder API Expand this. Finish the building process. First updates the environment, and then calls :meth:`write`. If the builder does not output individual files corresponding to source files, return a string here.  If it does, return an iterable of those files that need to be written. Load necessary templates and perform initialization.  The default implementation does nothing. Main build method. May raise environment.NoUri if there's no way to return a sensible URI. Only rebuild as much as needed for changes in the *filenames*. Only rebuild what was changed or added since last build. Return a relative URI between two source filenames. Return an iterable of output files that are outdated, or a string describing what an update build will build. Return the target URI for a document name. The builder supports data URIs or not. The builder supports remote images or not. The builder's name, for the -b command line option. The builder's output format, or '' if no document output is produced. The default implementation does nothing. The list of MIME types of image formats supported by the builder. Image files are searched in the order in which they appear here. The message emitted upon successful build completion. This can be a printf-style template string with the following keys: ``outdir``, ``project`` These attributes should be set on builder classes: These methods are predefined and will be called from the application: These methods can be overridden in concrete builder classes: This is the base class for all builders. Todo Where you actually write something to the filesystem. default translator class for the builder.  This can be overridden by :py:meth:`app.set_translator()`. Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 *typ* can be used to qualify the link characteristic for individual builders. A place where you can add logic before :meth:`write_doc` is run Build all source files. Builder API Expand this. Finish the building process. First updates the environment, and then calls :meth:`write`. If the builder does not output individual files corresponding to source files, return a string here.  If it does, return an iterable of those files that need to be written. Load necessary templates and perform initialization.  The default implementation does nothing. Main build method. May raise environment.NoUri if there's no way to return a sensible URI. Only rebuild as much as needed for changes in the *filenames*. Only rebuild what was changed or added since last build. Return a relative URI between two source filenames. Return an iterable of output files that are outdated, or a string describing what an update build will build. Return the target URI for a document name. The builder supports data URIs or not. The builder supports remote images or not. The builder's name, for the -b command line option. The builder's output format, or '' if no document output is produced. The default implementation does nothing. The list of MIME types of image formats supported by the builder. Image files are searched in the order in which they appear here. The message emitted upon successful build completion. This can be a printf-style template string with the following keys: ``outdir``, ``project`` These attributes should be set on builder classes: These methods are predefined and will be called from the application: These methods can be overridden in concrete builder classes: This is the base class for all builders. Todo Where you actually write something to the filesystem. default translator class for the builder.  This can be overridden by :py:meth:`app.set_translator()`. 