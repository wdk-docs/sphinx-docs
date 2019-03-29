# 在 gh-pages 上自动部署 Sphinx 文档自动化文档部署

> Posted on December 23, 2018 <https://www.alkaline-ml.com/2018-12-23-automate-gh-builds/>

## 问题

软件世界中的文档可能非常糟糕。
找到一个有几百颗星的有前途的 git 项目，除了用于记录包使用的 README 之外，这一点太常见了。
虽然像 sphinx 这样的工具使开发人员的自动文档变得更加直接，但托管所述文档却带来了另一个障碍。

在发布和托管文档方面，Github 通过其 gh-pages 功能解决了这个问题，它允许您从分支机构托管静态网页。
但如果你曾经使用它，你可能会意识到它可能导致的头痛。

在这篇文章中，我将分享我开发的工作流程，以使用 Circle CI 自动化我的文档构建和部署到 gh 页面。

## 第一次推到'gh-pages`:

在我们自动化构建之前，在服务器上使用 gh-pages 分支是有帮助的。
在继续之前，请确保已提交并推送所有更改。

从主（或您的默认）分支，我们将检查一个名为 gh-pages 的新孤立分支。
这是一个神奇的分支名称，因此将其称为“重要”，否则您必须在项目设置中执行一些伏都教才能使其全部工作。

```sh
$ git checkout --orphan gh-pages
```

现在，我们要删除所有内容。
除了.git 目录之外的所有东西！

这听起来很可怕，但如果你已经做好了一切，那就没关系了！这是一个快速入侵，将删除除.git 目录之外的所有文件:

```sh
$ find . ! -name ".git/*" -type f -exec rm -f {} +
```

但是，根据项目文件夹中的其他内容，您可能还有其他几个工件或目录要清理。
只需确保.git 文件夹不受影响。

第一次推动很容易。
这将是一个空提交:

```sh
$ git add --all
$ git commit --allow-empty
$ git push origin gh-pages
```

## 自动化所有未来的 doc 部署

现在分支存在于远程，我们可以简化事情。
如果您还没有 Circle 帐户，请转到注册页面，然后单击`使用 Github 注册`。
从那里，您可以设置`.circleci/config.yml`将您的项目添加到 Circle 工作流以在 Github 推送上构建/测试。
如果您不熟悉如何执行此操作，请按照本教程使用 Circle 进行设置。

### 为您的文档创建构建脚本

这是我的构建脚本的样子。
它位于 build_tools / circle 目录中。
我一直在散布评论，试图解释每一步：

```bash
#!/bin/bash

# 失败了
set -e

# 这是一个hack，但我们必须确保我们只从包的顶层运行它而不是在子目录中...
# 我们的设置方式不应该是一个问题，您需要稍微更改它以使其适用于您的项目结构。
if [[ ! -f gh_doc_automation/__init__.py ]]; then
    echo "这必须从gh_doc_automation项目目录运行"
    exit 3
fi

# CD进入docs，制作它们。
# 如果你没有使用Sphinx，你可能会有一个不同的构建脚本。
cd doc
make clean html EXAMPLES_PATTERN=ex_*
cd ..

# 将文档移动到顶级目录，藏匿结帐
mv doc/_build/html ./

# 当我们藏匿时，html/目录将保留在那里
git stash

# 检查我们的gh-pages分支，删除除.git之外的所有内容
git checkout gh-pages
git pull origin gh-pages

# 确保设置凭据！
# 您需要在Circle CI的“环境变量”部分中设置这些环境变量
git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1

# 删除不在.git目录中的所有文件
find . -not -name ".git/*" -type f -maxdepth 1 -delete

# 删除剩余的工件。
# 其中一些是LAST gh-pages构建的工件，其他是包本身的残余。
# 最后的gh-pages构建，其他是包本身的残余。
# 您必须修改此更具体的项目。
declare -a leftover=(".cache/"
                     ".idea/"
                     "build/"
                     "build_tools/"
                     "doc/"
                     "examples/"
                     "gh_doc_automation/"
                     "gh_doc_automation.egg-info/"
                     "_downloads/"
                     "_images/"
                     "_modules/"
                     "_sources/"
                     "_static/"
                     "auto_examples/"
                     "includes"
                     "modules/")

# 检查每个遗留的文件/目录并删除它，或回声它不在那里。
for left in "${leftover[@]}"
do
    rm -r "$left" || echo "$left 不存在;不会删除"
done

# 我们需要这个空文件让git不要尝试构建一个jekyll项目。
# 如果您的项目*是* Jekyll，那么这不适用于您......
touch .nojekyll
mv html/* ./
rm -r html/

# 添加所有内容，准备提交。
# 但只有在我们掌握的时候才会这样做。
# 如果要部署在不同的分支上，可以更改此设置。
if [[ "$CIRCLE_BRANCH" =~ ^master$|^[0-9]+\.[0-9]+\.X$ ]]; then
    git add --all
    git commit -m "[ci skip]发布更新的文档......"

    # 我们必须使用GH_TOKEN凭证重新添加原点。
    # 您将在Circle上的环境变量中使用此SSH密钥。
    # 确保最后更改<project> .git模式！
    git remote rm origin
    git remote add origin https://"$GH_NAME":"$GH_TOKEN"@github.com/"$GH_NAME"/gh_automation.git

    # 现在我们应该能够推动它
    git push origin gh-pages
else
    echo "不是主人，所以不会推文件"
fi
```

我正在使用 Sphinx，因此我的文档是使用`sphinx-quickstart`创建的`doc/Makefile`构建的。
如果您使用的是其他框架，则必须对此行进行一些更正：

```sh
cd doc
make clean html EXAMPLES*PATTERN=ex*\*
cd ..
```

脚本中有几点你必须使用你的 git 项目名称进行修改，以确保你指向正确的位置。
您甚至需要在推送之前使脚本可执行，否则您将遇到构建失败！

```sh
$ chmod +x build_tools/circle/build_push_doc.sh
```

## 设置环境变量

在上面的脚本中，您会注意到在 Circle 的“环境变量”部分中需要存储一些环境变量。
否则，你会收到这样的错误:

圈失败

您需要三个环境变量:

- GH_NAME - 你的 github 用户名。例如，我的是 tgsmith61591
- GH_EMAIL - 您与 github 帐户关联的电子邮件地址。
- GH_TOKEN - 这是您必须在 Github 上创建的 SSH 密钥。[请遵循这些说明](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

所有这些对于你能够从 Circle 推送到你的遥控器是必要的，特别是令牌应该受到严密保护。

## 修改你的`config.yml`

此时，您应该为项目设置 Circle 配置文件，并且应该设置构建脚本。
现在我们将使用文档构建/推送工作流修改您的配置。

您需要做的就是在 YAML 文件中创建一个新部分。
这是我在示例项目中的样子:

```sh
deploy-doc:
  docker:
  - image: python:3.6
    working_directory: ~/gh_doc_automation
    steps:
  - checkout
  - run: make doc-requirements
  - run: make install
  - run: ./build_tools/circle/build_push_doc.sh
```

如果需要，可以使用不同的 Python 映像，并且您需要将工作目录设置为项目名称。
另请注意，我正在使用 Makefile 构建。
所有 Makefile 都是一个“目标”背后的一系列命令。
以下是调用 doc-requirements 时会发生的情况：

```sh
$ python -m pip install -r build_tools/doc/doc_requirements.txt
```

使用 Makefile 完全是一种品味的东西，并不是必须的。
没有 Makefile，我的配置看起来像：

```sh
deploy-doc:
  docker:
  - image: python:3.6
    working_directory: ~/gh_doc_automation
  steps:
  - checkout
  - run: python -m pip install -r build_tools/doc/doc_requirements.txt
  - run: python -m pip install -r requirements.txt
  - run: python setup.py install
  - run: ./build_tools/circle/build_push_doc.sh
```

将作业添加到配置文件后，需要确保它运行。
将作业添加到现有工作流程：

```sh
workflows:
  version: 2
  your_pipeline:
    jobs:
      - some-other-job
      - deploy-doc
```

就这样！下次掌握时，您的文档将被构建和部署！您可以在以下位置查看：

```html
http://<GH_NAME>.github.io/<YOUR_PROJECT_NAME></YOUR_PROJECT_NAME></GH_NAME>
```

## 最后的想法

这是一种自动化文档推送的简单方法。
当然，在这种情况下，这并不是您所追求的，但它应该为您提供使您的解决方案适应您的要求所需的一切。
您可能也有兴趣查看我在我的项目 pmdarima 中构建版本化文档的方式。
