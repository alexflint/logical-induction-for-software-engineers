links:
	rm -rf docs/link/*
	python scripts/generate_links.py \
		--sources logicalinduction/*.py \
		--output docs/link

test:
	pytest

build:
	rm -rf dist/*
	python -m build

publish:
	python -m twine upload dist/* \
		--username alexflint

publish_test:
	python -m twine upload dist/* \
		--username alexflint \
		--repository testpypi

install_local:
	python -m pip install dist/*.tar.gz

install_from_pypi_test:
	python -m pip install \
		--index-url https://test.pypi.org/simple/ \
		--no-deps \
		logicalinduction

dir:
	env CWD=/tmp python -c 'import logicalinduction; print(dir(logicalinduction))'

deps:
	python -m pip install build twine  # for publishing to PyPI

notebook:
	python -m jupyter notebook notebooks/three_updates.ipynb
