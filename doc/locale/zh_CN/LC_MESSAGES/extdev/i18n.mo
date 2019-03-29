��          �               �  �   �  �     G   �  ~   �  �   e  P   �  t   J  B   �              ;     A  �   M  @   �  K     5   j  s   �  �     �   �  �   3	     �	     �	  �  �	  �   �  �     G   �  ~   �  �   Y  P   �  t   >  B   �     �         /     5  �   A  @   �  K     5   ^  s   �  �     �   �  �   '     �     �   An extension may naturally come with message translations.  This is briefly summarized in :func:`sphinx.locale.get_translation` help. Choose a name for your message catalog, which must be unique.  Usually the name of your extension is used for the name of message catalog. Compile message catalogs into ``*.mo`` files, for example via `Babel`_: Create message catalogs (``*.po``) for each language which your extension will provide localization, for example via `Babel`_: Ensure that message catalog files are distributed when your package will be installed, by adding equivalent line in your extension ``MANIFEST.in``: Extension internationalization (`i18n`) and localization (`l10n`) using i18n API Generate message catalog template ``*.pot`` file, usually in ``locale/`` source directory, for example via `Babel`_: Get a translation function based on the *catalog* and *namespace*. In practice, you have to: Initialize locale for console. Look for message catalogs in `locale_dirs` and *ensure* that there is at least a NullTranslations catalog set in `translators`.  If called multiple times or if several ``.mo`` files are found, their contents are merged together (thus making ``init`` reentrant). MANIFEST.in Mark in your extension sources all messages as translatable, via :func:`sphinx.locale.get_translation` function, usually renamed ``_()``, e.g.: Set up your extension to be aware of its dedicated translations: The extension can use this API to translate the messages on the extension:: Translate message catalogs for each language manually Translation function for console messages This function follows locale setting (`LC_ALL`, `LC_MESSAGES` and so on). Translation function for messages on documentation (menu, labels, themes and so on). This function follows :confval:`language` setting. When the messages on your extension has been changed, you need to also update message catalog template and message catalogs, for example via `Babel`_: With this code, sphinx searches a message catalog from ``${package_dir}/locales/${language}/LC_MESSAGES/myextension.mo``. The :confval:`language` is used for the searching. i18n API src/__init__.py Project-Id-Version: Sphinx 2.1.0+/1499a97c2
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
 An extension may naturally come with message translations.  This is briefly summarized in :func:`sphinx.locale.get_translation` help. Choose a name for your message catalog, which must be unique.  Usually the name of your extension is used for the name of message catalog. Compile message catalogs into ``*.mo`` files, for example via `Babel`_: Create message catalogs (``*.po``) for each language which your extension will provide localization, for example via `Babel`_: Ensure that message catalog files are distributed when your package will be installed, by adding equivalent line in your extension ``MANIFEST.in``: Extension internationalization (`i18n`) and localization (`l10n`) using i18n API Generate message catalog template ``*.pot`` file, usually in ``locale/`` source directory, for example via `Babel`_: Get a translation function based on the *catalog* and *namespace*. In practice, you have to: Initialize locale for console. Look for message catalogs in `locale_dirs` and *ensure* that there is at least a NullTranslations catalog set in `translators`.  If called multiple times or if several ``.mo`` files are found, their contents are merged together (thus making ``init`` reentrant). MANIFEST.in Mark in your extension sources all messages as translatable, via :func:`sphinx.locale.get_translation` function, usually renamed ``_()``, e.g.: Set up your extension to be aware of its dedicated translations: The extension can use this API to translate the messages on the extension:: Translate message catalogs for each language manually Translation function for console messages This function follows locale setting (`LC_ALL`, `LC_MESSAGES` and so on). Translation function for messages on documentation (menu, labels, themes and so on). This function follows :confval:`language` setting. When the messages on your extension has been changed, you need to also update message catalog template and message catalogs, for example via `Babel`_: With this code, sphinx searches a message catalog from ``${package_dir}/locales/${language}/LC_MESSAGES/myextension.mo``. The :confval:`language` is used for the searching. i18n API src/__init__.py 