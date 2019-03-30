"""
    test_build_linkcheck
    ~~~~~~~~~~~~~~~~~~~~

    Test the build process with manpage builder with the test root.

    :copyright: Copyright 2007-2019 by the Sphinx team, see AUTHORS.
    :license: BSD, see LICENSE for details.
"""

import pytest


@pytest.mark.sphinx('linkcheck', testroot='linkcheck', freshenv=True)
def test_defaults(app, status, warning):
    app.builder.build_all()

    assert (app.outdir / 'output.txt').exists()
    content = (app.outdir / 'output.txt').text()

    print(content)
    # looking for '#top' and 'does-not-exist' not found should fail
    assert "Anchor 'top' not found" in content
    assert "Anchor 'does-not-exist' not found" in content
    # looking for non-existent URL should fail
    assert " Max retries exceeded with url: /doesnotexist" in content
    # images should fail
    assert "Not Found for url: http://example.com/image.png" in content
    assert "Not Found for url: http://example.com/image2.png" in content
    assert len(content.splitlines()) == 5


@pytest.mark.sphinx(
    'linkcheck', testroot='linkcheck', freshenv=True,
    confoverrides={'linkcheck_anchors_ignore': ["^!", "^top$"],
                   'linkcheck_ignore': [
                       'https://localhost:7777/doesnotexist',
                       'http://www.sphinx-doc.org/en/1.7/intro.html#',
                       'http://example.com/image.png',
                       'http://example.com/image2.png']
                   })
def test_anchors_ignored(app, status, warning):
    app.builder.build_all()

    assert (app.outdir / 'output.txt').exists()
    content = (app.outdir / 'output.txt').text()

    # expect all ok when excluding #top
    assert not content
