"""
    test_util_inspect
    ~~~~~~~~~~~~~~~

    Tests util.inspect functions.

    :copyright: Copyright 2007-2019 by the Sphinx team, see AUTHORS.
    :license: BSD, see LICENSE for details.
"""
import functools
import sys
from textwrap import dedent

import pytest

from sphinx.util import inspect


def test_getargspec():
    def func(a, b, c=1, d=2, *e, **f):
        pass

    spec = inspect.getargspec(func)
    assert spec.args == ['a', 'b', 'c', 'd']
    assert spec.varargs == 'e'
    assert spec.varkw == 'f'
    assert spec.defaults == (1, 2)
    assert spec.kwonlyargs == []
    assert spec.kwonlydefaults is None
    assert spec.annotations == {}


def test_getargspec_partial():
    def func1(a, b, c=1, d=2, *e, **f):
        pass

    partial = functools.partial(func1, 10, c=11)
    spec = inspect.getargspec(partial)
    assert spec.args == ['b']
    assert spec.varargs is None
    assert spec.varkw == 'f'
    assert spec.defaults is None
    assert spec.kwonlyargs == ['c', 'd']
    assert spec.kwonlydefaults == {'c': 11, 'd': 2}
    assert spec.annotations == {}


def test_getargspec_partial2():
    def fun(a, b, c=1, d=2):
        pass
    p = functools.partial(fun, 10, c=11)

    def f_expected(b, *, c=11, d=2):
        pass
    expected = inspect.getargspec(f_expected)

    assert expected == inspect.getargspec(p)


def test_getargspec_builtin_type():
    with pytest.raises(TypeError):
        inspect.getargspec(int)


def test_getargspec_bound_methods():
    def f_expected_unbound(self, arg1, **kwargs):
        pass
    expected_unbound = inspect.getargspec(f_expected_unbound)

    def f_expected_bound(arg1, **kwargs):
        pass
    expected_bound = inspect.getargspec(f_expected_bound)

    class Foo:
        def method(self, arg1, **kwargs):
            pass

    bound_method = Foo().method

    @functools.wraps(bound_method)
    def wrapped_bound_method(*args, **kwargs):
        pass

    assert expected_unbound == inspect.getargspec(Foo.method)
    assert expected_bound == inspect.getargspec(bound_method)
    assert expected_bound == inspect.getargspec(wrapped_bound_method)


def test_Signature():
    # literals
    with pytest.raises(TypeError):
        inspect.Signature(1)

    with pytest.raises(TypeError):
        inspect.Signature('')

    # builitin classes
    with pytest.raises(TypeError):
        inspect.Signature(int)

    with pytest.raises(TypeError):
        inspect.Signature(str)

    # normal function
    def func(a, b, c=1, d=2, *e, **f):
        pass

    sig = inspect.Signature(func).format_args()
    assert sig == '(a, b, c=1, d=2, *e, **f)'


def test_Signature_partial():
    def fun(a, b, c=1, d=2):
        pass
    p = functools.partial(fun, 10, c=11)

    sig = inspect.Signature(p).format_args()
    assert sig == '(b, *, c=11, d=2)'


def test_Signature_methods():
    class Foo:
        def meth1(self, arg1, **kwargs):
            pass

        @classmethod
        def meth2(cls, arg1, *args, **kwargs):
            pass

        @staticmethod
        def meth3(arg1, *args, **kwargs):
            pass

    @functools.wraps(Foo().meth1)
    def wrapped_bound_method(*args, **kwargs):
        pass

    # unbound method
    sig = inspect.Signature(Foo.meth1).format_args()
    assert sig == '(self, arg1, **kwargs)'

    sig = inspect.Signature(Foo.meth1, bound_method=True).format_args()
    assert sig == '(arg1, **kwargs)'

    # bound method
    sig = inspect.Signature(Foo().meth1).format_args()
    assert sig == '(arg1, **kwargs)'

    # class method
    sig = inspect.Signature(Foo.meth2).format_args()
    assert sig == '(arg1, *args, **kwargs)'

    sig = inspect.Signature(Foo().meth2).format_args()
    assert sig == '(arg1, *args, **kwargs)'

    # static method
    sig = inspect.Signature(Foo.meth3).format_args()
    assert sig == '(arg1, *args, **kwargs)'

    sig = inspect.Signature(Foo().meth3).format_args()
    assert sig == '(arg1, *args, **kwargs)'

    # wrapped bound method
    sig = inspect.Signature(wrapped_bound_method).format_args()
    assert sig == '(arg1, **kwargs)'


def test_Signature_partialmethod():
    from functools import partialmethod

    class Foo:
        def meth1(self, arg1, arg2, arg3=None, arg4=None):
            pass

        def meth2(self, arg1, arg2):
            pass

        foo = partialmethod(meth1, 1, 2)
        bar = partialmethod(meth1, 1, arg3=3)
        baz = partialmethod(meth2, 1, 2)

    subject = Foo()
    sig = inspect.Signature(subject.foo).format_args()
    assert sig == '(arg3=None, arg4=None)'

    sig = inspect.Signature(subject.bar).format_args()
    assert sig == '(arg2, *, arg3=3, arg4=None)'

    sig = inspect.Signature(subject.baz).format_args()
    assert sig == '()'


def test_Signature_annotations():
    from typing_test_data import (f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10,
                                  f11, f12, f13, f14, f15, f16, f17, Node)

    # Class annotations
    sig = inspect.Signature(f0).format_args()
    assert sig == '(x: int, y: numbers.Integral) -> None'

    # Generic types with concrete parameters
    sig = inspect.Signature(f1).format_args()
    assert sig == '(x: List[int]) -> List[int]'

    # TypeVars and generic types with TypeVars
    sig = inspect.Signature(f2).format_args()
    assert sig == '(x: List[T], y: List[T_co], z: T) -> List[T_contra]'

    # Union types
    sig = inspect.Signature(f3).format_args()
    assert sig == '(x: Union[str, numbers.Integral]) -> None'

    # Quoted annotations
    sig = inspect.Signature(f4).format_args()
    assert sig == '(x: str, y: str) -> None'

    # Keyword-only arguments
    sig = inspect.Signature(f5).format_args()
    assert sig == '(x: int, *, y: str, z: str) -> None'

    # Keyword-only arguments with varargs
    sig = inspect.Signature(f6).format_args()
    assert sig == '(x: int, *args, y: str, z: str) -> None'

    # Space around '=' for defaults
    sig = inspect.Signature(f7).format_args()
    assert sig == '(x: int = None, y: dict = {}) -> None'

    # Callable types
    sig = inspect.Signature(f8).format_args()
    assert sig == '(x: Callable[[int, str], int]) -> None'

    sig = inspect.Signature(f9).format_args()
    assert sig == '(x: Callable) -> None'

    # Tuple types
    sig = inspect.Signature(f10).format_args()
    assert sig == '(x: Tuple[int, str], y: Tuple[int, ...]) -> None'

    # Instance annotations
    sig = inspect.Signature(f11).format_args()
    assert sig == '(x: CustomAnnotation, y: 123) -> None'

    # has_retval=False
    sig = inspect.Signature(f11, has_retval=False).format_args()
    assert sig == '(x: CustomAnnotation, y: 123)'

    # tuple with more than two items
    sig = inspect.Signature(f12).format_args()
    assert sig == '() -> Tuple[int, str, int]'

    # optional
    sig = inspect.Signature(f13).format_args()
    assert sig == '() -> Optional[str]'

    # Any
    sig = inspect.Signature(f14).format_args()
    assert sig == '() -> Any'

    # ForwardRef
    sig = inspect.Signature(f15).format_args()
    assert sig == '(x: Unknown, y: int) -> Any'

    # keyword only arguments (1)
    sig = inspect.Signature(f16).format_args()
    assert sig == '(arg1, arg2, *, arg3=None, arg4=None)'

    # keyword only arguments (2)
    sig = inspect.Signature(f17).format_args()
    assert sig == '(*, arg3, arg4)'

    # type hints by string
    sig = inspect.Signature(Node.children).format_args()
    if (3, 5, 0) <= sys.version_info < (3, 5, 3):
        assert sig == '(self) -> List[Node]'
    else:
        assert sig == '(self) -> List[typing_test_data.Node]'

    sig = inspect.Signature(Node.__init__).format_args()
    assert sig == '(self, parent: Optional[Node]) -> None'


def test_safe_getattr_with_default():
    class Foo:
        def __getattr__(self, item):
            raise Exception

    obj = Foo()

    result = inspect.safe_getattr(obj, 'bar', 'baz')

    assert result == 'baz'


def test_safe_getattr_with_exception():
    class Foo:
        def __getattr__(self, item):
            raise Exception

    obj = Foo()

    try:
        inspect.safe_getattr(obj, 'bar')
    except AttributeError as exc:
        assert exc.args[0] == 'bar'
    else:
        pytest.fail('AttributeError not raised')


def test_safe_getattr_with_property_exception():
    class Foo:
        @property
        def bar(self):
            raise Exception

    obj = Foo()

    try:
        inspect.safe_getattr(obj, 'bar')
    except AttributeError as exc:
        assert exc.args[0] == 'bar'
    else:
        pytest.fail('AttributeError not raised')


def test_safe_getattr_with___dict___override():
    class Foo:
        @property
        def __dict__(self):
            raise Exception

    obj = Foo()

    try:
        inspect.safe_getattr(obj, 'bar')
    except AttributeError as exc:
        assert exc.args[0] == 'bar'
    else:
        pytest.fail('AttributeError not raised')


def test_dictionary_sorting():
    dictionary = {"c": 3, "a": 1, "d": 2, "b": 4}
    description = inspect.object_description(dictionary)
    assert description == "{'a': 1, 'b': 4, 'c': 3, 'd': 2}"


def test_set_sorting():
    set_ = set("gfedcba")
    description = inspect.object_description(set_)
    assert description == "{'a', 'b', 'c', 'd', 'e', 'f', 'g'}"


def test_set_sorting_fallback():
    set_ = {None, 1}
    description = inspect.object_description(set_)
    assert description in ("{1, None}", "{None, 1}")


def test_frozenset_sorting():
    frozenset_ = frozenset("gfedcba")
    description = inspect.object_description(frozenset_)
    assert description == "frozenset({'a', 'b', 'c', 'd', 'e', 'f', 'g'})"


def test_frozenset_sorting_fallback():
    frozenset_ = frozenset((None, 1))
    description = inspect.object_description(frozenset_)
    assert description in ("frozenset({1, None})", "frozenset({None, 1})")


def test_dict_customtype():
    class CustomType:
        def __init__(self, value):
            self._value = value

        def __repr__(self):
            return "<CustomType(%r)>" % self._value

    dictionary = {CustomType(2): 2, CustomType(1): 1}
    description = inspect.object_description(dictionary)
    # Type is unsortable, just check that it does not crash
    assert "<CustomType(2)>: 2" in description


def test_isstaticmethod():
    class Foo():
        @staticmethod
        def method1():
            pass

        def method2(self):
            pass

    class Bar(Foo):
        pass

    assert inspect.isstaticmethod(Foo.method1, Foo, 'method1') is True
    assert inspect.isstaticmethod(Foo.method2, Foo, 'method2') is False
    assert inspect.isstaticmethod(Bar.method1, Bar, 'method1') is True
    assert inspect.isstaticmethod(Bar.method2, Bar, 'method2') is False
